# who2kill-cli

## Description
Powershell script that simplifies usage of `sp_who2` and `KILL` in SQL by allowing you to run it from CMD/Powershell

## Why 

If you want to list all processes that a database has running currently, you may use `sp_who2`. If you then decide to kill a specific process, you’ll have to run `KILL` and provide the specific ID of that process. You cannot provide a list of IDs, which means you would need to copy and paste as many times as there are processes. You could write a SQL script to somehow loop through all of them, but that’s not exactly a better, faster solution, if you need to re-write it each time, so I wrote this script to avoid all that.

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