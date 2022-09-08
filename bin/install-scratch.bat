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
for /f "tokens=1,2 delims=:{} " %%A in (env.json) do set secret=%%~A

echo "Installing crm-platform-base ver. 0.159"
call sfdx force:package:install --package 04t7U000000Tph0QAC -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-journal-utilities ver. 0.15"
call sfdx force:package:install --package 04t7U000000TpOhQAK -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-shared-user-notification ver. 0.16"
call sfdx force:package:install --package 04t7U000000TpdDQAS -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-shared-flowComponents ver. 0.2"
call sfdx force:package:install --package 04t7U000000ToqLQAS -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-platform-access-control ver. 0.95"
call sfdx force:package:install --package 04t7U000000TpVTQA0 -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-community-base ver. 0.64"
call sfdx force:package:install --package 04t7U000000TpSZQA0 -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-henvendelse-base ver. 0.8"
call sfdx force:package:install --package 04t7U000000TpdwQAC -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-henvendelse ver. 0.71"
call sfdx force:package:install --package 04t7U000000TpoBQAS -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-platform-integration ver. 0.79"
call sfdx force:package:install --package 04t7U000000TpWWQA0 -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-shared-base ver. 1.1"
call sfdx force:package:install --package 04t2o000000ySqpAAE -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-shared-timeline ver. 1.13"
call sfdx force:package:install --package 04t7U000000TpDjQAK -r -k %secret% --wait 10 --publishwait 10

echo "Installing crm-arbeidsgiver-base ver. 1.234"
call sfdx force:package:install --package 04t7U000000TpGOQA0 -r -k %secret% --wait 10 --publishwait 10

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
cmd.exe /c sfdx force:user:permset:assign -n Arbeidsgiver_Dialog_Interne
cmd.exe /c sfdx force:user:permset:assign -n Arbeidsgiver_base
cmd.exe /c sfdx force:user:permset:assign -n Arbeidsgiver_contract
call :checkForError
@echo:

echo Inserting test data...
cmd.exe /c sfdx force:data:tree:import -p  dummy-data/plan.json
call :checkForError
@echo:

echo "Running post install scripts..."
cmd.exe /c sfdx force:apex:execute -f ./scripts/apex/activateMock.cls
cmd.exe /c sfdx force:apex:execute -f ./scripts/apex/createPortalUser.cls
cmd.exe /c sfdx force:apex:execute -f ./scripts/apex/createTestData.cls
echo ""

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
