@echo OFF

rem Set parameters
set ORG_ALIAS=arbeidsgiver-dialog


@echo:
echo Installing crm-arbeidsgiver-dialog scratch org (%ORG_ALIAS%)
@echo:

echo Cleaning previous scratch org...
cmd.exe /c sfdx force:org:delete -p -u %ORG_ALIAS% 2>NUL
@echo:

echo Creating scratch org...
cmd.exe /c sfdx force:org:create -s -f config/project-scratch-def.json -d 7 -a %ORG_ALIAS%
call :checkForError
@echo:

echo Installing dependencies...
set secret=(jq '.PACKAGE_KEY' env.json -r)
keys="" && for /l %%p in (jq '.packageAliases | keys[]' sfdx-project.json -r); do keys+=%%p":"%secret%" "; done 
cmd.exe /c sfdx sfpowerkit:package:dependencies:install -u %ORG_ALIAS% -r -a -w 60 -k "%{keys}%"
call :checkForError
@echo:

echo Pushing metadata...
cmd.exe /c sfdx force:source:push
call :checkForError
@echo:

echo Publishing arbeidsgiver-dialog site...
cmd.exe /c sfdx force:community:publish -n "arbeidsgiver-dialog" 
call :checkForError
@echo:

echo Assigning permissions...
cmd.exe /c sfdx force:user:permset:assign -n Messaging_Read_and_Write_Messages_and_Threads
call :checkForError
@echo:

echo Inserting test data...
cmd.exe /c sfdx force:data:tree:import -p  dummy-data/plan.json
call :checkForError
@echo:

echo Activating Mocks...
cmd.exe /c sfdx force:apex:execute -f ./scripts/apex/activateMock.cls
call :checkForError
@echo:

echo Opening org...
cmd.exe /c sfdx force:org:open
@echo:



rem Report install success if no error
@echo:
if ["%errorlevel%"]==["0"] (
  echo Installation completed.
  @echo:
)

:: ======== FN ======
GOTO :EOF

rem Display error if the install has failed
:checkForError
if NOT ["%errorlevel%"]==["0"] (
    echo Installation failed.
    exit /b %errorlevel%
)
