param (
    [string]$DatabaseName,
    [switch]$Display,
    [switch]$Kill
)

if ([string]::IsNullOrEmpty($DatabaseName)) {
    Write-Host "ERROR: Please provide a DatabaseName." -ForegroundColor Red
    exit
}

$connectionString = "Server=localhost;Database=master;Integrated Security=True;TrustServerCertificate=True"

$query = @"
USE master;
SELECT spid, loginame, hostname, program_name, status, dbid
FROM sys.sysprocesses
WHERE dbid = DB_ID('$DatabaseName');
"@

$processes = Invoke-Sqlcmd -ConnectionString $connectionString -Query $query

if ($processes) {
    if ($Kill) {
        foreach ($process in $processes) {
            $spid = $process.spid
            try {
                $killQuery = "KILL $spid;"
                Invoke-Sqlcmd -ServerInstance $serverInstance -Query $killQuery
                Write-Host "Killed process with SPID: $spid" -ForegroundColor Green
            } catch {
                Write-Host "Failed to kill process with SPID: $spid. Error: $_" -ForegroundColor Red
            }
        }        
    } elseif ($Display) {
        Write-Output "Processes for database: $DatabaseName"
        $processes | Format-List
    }else {
        Write-Host "ERROR: Please specify either -Display or -Kill flag" -ForegroundColor Red
    }
} else {
    Write-Host "No open connections found for database: $DatabaseName" -ForegroundColor Yellow
}