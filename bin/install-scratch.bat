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

echo "Installing crm-platform-base ver. 0.180"
call sfdx force:package:install --package 04t7U0000008qfxQAA -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-journal-utilities ver. 0.18"
call sfdx force:package:install --package 04t7U000000TqidQAC -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-shared-user-notification ver. 0.17"
call sfdx force:package:install --package 04t7U000000TproQAC -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-shared-flowComponents ver. 0.3"
call sfdx force:package:install --package 04t7U000000Tpf4QAC -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-platform-access-control ver. 0.106"
call sfdx force:package:install --package 04t7U0000008qWCQAY -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-community-base ver. 0.76"
call sfdx force:package:install --package 04t7U000000TqrzQAC -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-henvendelse-base ver. 0.12"
call sfdx force:package:install --package 04t7U0000008qbWQAQ -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-platform-integration ver. 0.92"
call sfdx force:package:install --package 04t7U0000008qZ6QAI -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-platform-oppgave ver. 0.43"
call sfdx force:package:install --package 04t7U0000008qSFQAY -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-henvendelse ver. 0.91"
call sfdx force:package:install --package 04t7U0000008qYXQAY -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-shared-base ver. 1.1"
call sfdx force:package:install --package 04t2o000000ySqpAAE -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-thread-view ver. 0.2"
call sfdx force:package:install --package 04t7U000000TqvIQAS -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-shared-timeline ver. 1.18"
call sfdx force:package:install --package 04t7U000000TqbDQAS -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-arbeidsgiver-base ver. 1.290"
call sfdx force:package:install --package 04t7U0000008rAlQAI -r -k %secret% --wait 30 --publishwait 30

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
