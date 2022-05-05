import { execSync } from 'child_process';
import fs from 'fs';

const config = readJSONFile('./config/scratch-org-config.json');

const createScratch = () => {
    runCommand(
        'Creating Scratch Org...',
        'sfdx force:org:create -f ./config/project-scratch-def.json --setalias ArbeidsgiverDialog --durationdays 7 --setdefaultusername'
    );
};

const installDependencies = () => {
    const { packageAliases } = readJSONFile('sfdx-project.json');
    const { PACKAGE_KEY } = readJSONFile('env.json');
    let keys = '';

    for (let prop in packageAliases) {
        keys += `${prop}:${PACKAGE_KEY} `;
    }

    runCommand(
        'Installing dependencies...',
        `sfdx sfpowerkit:package:dependencies:install -u ArbeidsgiverDialog -r -a -w 60 -k "${keys}"`
    );
};

const pushMetadata = () => {
    runCommand('Pushing metadata...', 'sfdx force:source:push');
};

const openOrg = () => {
    runCommand('Opening Org...', 'sfdx force:org:open');
};

const runPostInstallScripts = () => {
    config.POST_INSTALL_SCRIPTS.forEach((el) => {
        runCommand(el.prompt, `sfdx force:apex:execute -f ${el.path}`);
    });
};

const assignPermissions = () => {
    runCommand('Assigning permissions...', `sfdx force:user:permset:assign -n ${config.ASSIGNABLE_PERMISSIONS}`);
};

const insertTestData = () => {
    if (!config.INSERT_TEST_DATA) return;
    runCommand('Inserting test data...', ' sfdx force:data:tree:import -p  dummy-data/plan.json');
};

function runCommand(prompt, command) {
    console.log(prompt);
    execSync(command);
}

function readJSONFile(path) {
    return JSON.parse(fs.readFileSync(path));
}

createScratch();
installDependencies();
pushMetadata();
openOrg();
assignPermissions();
insertTestData();
runPostInstallScripts();
