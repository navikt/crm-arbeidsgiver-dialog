const { execSync } = require('child_process');
const fs = require('fs');

const createScratch = () => {
    runCommand(
        'Creating Scratch Org...',
        'sfdx force:org:create -f ./config/project-scratch-def.json --setalias Dialog --durationdays 7 --setdefaultusername'
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
        `sfdx sfpowerkit:package:dependencies:install -u Dialog -r -a -w 60 -k "${keys}"`
    );
};

const pushMetadata = () => {
    runCommand('Pushing metadata...', 'sfdx force:source:push');
};

const openOrg = () => {
    runCommand('Opening Org...', 'sfdx force:org:open');
};

const activateMocks = () => {
    runCommand('Setting mocks...', 'sfdx force:apex:execute -f scripts/apex/activateMock.cls');
};

const runCommand = (prompt, command) => {
    console.log(prompt);
    execSync(command);
};

const readJSONFile = (path) => {
    return JSON.parse(fs.readFileSync(path));
};

createScratch();
installDependencies();
pushMetadata();
openOrg();
activateMocks();
