@echo off

REM Check if the command line argument "--skip-build" is provided
set skip_build=0
for %%i in (%*) do (
  if "%%i"=="--skip-build" (
    set skip_build=1
  )
)

REM Launch npm run build command in a separate window if skip_build is not set
if %skip_build%==0 (
  @echo BUILDING ...
  start /wait cmd /c "npm run build"
)

REM Change to the current directory
@echo DEPLOYING ...
cd ./secret-santa-build

REM Add all files to the Git index
git add --all

REM Commit the changes
git commit -m "deploy files"

REM Push to the remote repository
git push origin master

REM Pause to view the output (optional)
pause
