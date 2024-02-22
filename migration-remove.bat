@echo off

@REM INSTRUCTIONS
@REM Parameters:
@REM 1 - Project destiny: Where the MIGRATIONS folder is or will be created
@REM 2 - Startup Project: Where is the context configuration (startup.cs or program.cs)

if [%1] == [] GOTO :EXEC_DEFAULT
if [%2] == [] GOTO :EXEC_WITH_PROJECT

call :removeMigration %1 %2
exit 

:EXEC_DEFAULT
    call :removeMigration Infrastructure WebApp/WebApp
    exit 

:EXEC_WITH_PROJECT
    call :removeMigration %1 WebApp/WebApp
    exit

:removeMigration
    echo Removendo ultima migracao. Projeto: %1 Projeto de incializaca: %2
    dotnet ef migrations remove --project %1 --startup-project %2
