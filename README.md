# who2kill-cli

## Usage Examples

### List of flags

`-DatabaseName` (Required)
Specifies which database name to search/kill process

`-Display` (Optional)
Displays list of all processes

`-Kill` (Optional)
Kills all processes attached to database

### Examples

Display all processes for specific database
`.\who2kill.ps1 -DatabaseName "my-db-name" -Display`

Kill all processes for specific database
`.\who2kill.ps1 -DatabaseName "my-db-name" -Kill`