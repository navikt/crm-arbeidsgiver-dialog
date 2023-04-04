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

echo "Installing crm-platform-base ver. 0.191"
call sfdx force:package:install --package 04t7U0000004eA6QAI -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-journal-utilities ver. 0.23"
call sfdx force:package:install --package 04t7U0000004eD0QAI -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-shared-user-notification ver. 0.21"
call sfdx force:package:install --package 04t7U0000008qofQAA -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-shared-flowComponents ver. 0.4"
call sfdx force:package:install --package 04t7U0000008qz4QAA -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-platform-access-control ver. 0.113"
call sfdx force:package:install --package 04t7U0000004e8tQAA -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-community-base ver. 0.86"
call sfdx force:package:install --package 04t7U0000004duXQAQ -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-henvendelse-base ver. 0.15"
call sfdx force:package:install --package 04t7U0000004eD5QAI -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-platform-integration ver. 0.99"
call sfdx force:package:install --package 04t7U0000004dzIQAQ -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-platform-oppgave ver. 0.48"
call sfdx force:package:install --package 04t7U0000004e7vQAA -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-henvendelse ver. 0.96"
call sfdx force:package:install --package 04t7U0000004eAaQAI -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-shared-base ver. 1.1"
call sfdx force:package:install --package 04t2o000000ySqpAAE -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-thread-view ver. 0.2"
call sfdx force:package:install --package 04t7U000000TqvIQAS -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-shared-timeline ver. 1.21"
call sfdx force:package:install --package 04t7U0000004dytQAA -r -k %secret% --wait 30 --publishwait 30

echo "Installing crm-arbeidsgiver-base ver. 1.304"
call sfdx force:package:install --package 04t7U0000004e51QAA -r -k %secret% --wait 30 --publishwait 30

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
