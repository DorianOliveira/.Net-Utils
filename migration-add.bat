@echo off

@REM INSTRUCTIONS
@REM Parameters:
@REM 1 - Migration name
@REM 2 - Project destiny: Where the MIGRATIONS folder is or will be created
@REM 3 - Startup Project: Where is the context configuration (startup.cs or program.cs)

if [%1] == [] GOTO :GET_MIGRATION_BY_INPUT
if [%2] == [] GOTO :EXEC_DEFAULT
if [%3] == [] GOTO :EXEC_WITH_PROJECT
 
@REM When all arguments provided
    call :addMigration %1 %2 %3
    exit

:GET_MIGRATION_BY_INPUT
    Set /p MigrationName=Migration name:
    call :addMigration %MigrationName% Infrastructure WebApp/WebApp
    exit

:EXEC_DEFAULT
    call :addMigration %1 Infrastructure WebApp/WebApp
    exit 

:EXEC_WITH_PROJECT
    call :addMigration %1 %2 WebApp/WebApp
    exit

:ERROR
    echo 'Migration name is required'
    pause
    exit

@REM Function to add migration
:addMigration
    echo Creating migration %1. Project: %2. Startup project: %3
    dotnet ef migrations add %1 --project %2 --startup-project %3    