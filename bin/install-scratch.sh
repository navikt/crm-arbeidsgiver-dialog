#!/bin/bash

SCRIPT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $SCRIPT_PATH/..

# Check exit code function
error() {
    echo ""
    if [[ $1 -eq 0 ]]; then
        echo "Installation completed."
        echo ""
        exit $1
    else
        if [[ -n $2 ]]; then
            echo "$2"
            echo ""
        fi
        
        echo "Installation failed."
        echo ""
        exit $1
    fi
}

publishCommunity() {
    echo "Publishing arbeidsgiver-dialog site..."
    if [[ $npm_config_without_publish ]]; then
        echo "Skipping publish of community: "arbeidsgiver-dialog"..."
    else
        sf community publish --name "arbeidsgiver-dialog" || { error $? '"sf community publish" command failed for community: "arbeidsgiver-dialog".'; }
    fi
echo ""
}

if [[ $npm_config_info ]]; then
    echo "Usage: npm run mac:build [options]"
    echo ""
    echo "Options:"
    echo "  --package-key=<key>         Package key to install"
    echo "  --org-alias=<alias>         Alias for the scratch org"
    echo "  --org-duration=<days>       Duration of the scratch org"
    echo "  --without-deploy            Skip deploy"
    echo "  --without-publish           Skip publish of community: \"arbeidsgiver-dialog\""
    echo "  --publish-community         Publish of community: \"arbeidsgiver-dialog\""
    echo "  --browser=<option>          Browser where the org opens."
    echo "                              <options: chrome|edge|firefox>"
    echo "  --info                      Show this help"
    echo ""
    exit 0
fi

if [[ $npm_config_publish_community ]]; then
    publishCommunity
    
    exit 0
fi

sfdx plugins inspect @dxatscale/sfpowerscripts >/dev/null 2>&1 || { 
    echo >&2 "\"@dxatscale/sfpowerscripts\" is required, but it's not installed."
    echo "Run \"sfdx plugins install @dxatscale/sfpowerscripts\" to install it."
    echo ""
    echo "Aborting...."
    echo ""
    exit 1
}
sfdx plugins inspect sfdmu >/dev/null 2>&1 || {
    echo >&2 "\"sfdmu\" is required, but it's not installed."
    echo "Run \"sfdx plugins install sfdmu\" to install it."
    echo ""
    echo "Aborting..."
    echo ""
    exit 1
}

command -v jq >/dev/null 2>&1 || {
    echo >&2 "\"jq\" is required, but it's not installed."
    echo "Run \"brew install jq\" to install it if you have Homebrew installed."
    echo ""
    echo "Aborting..."
    echo ""
    exit 1
}

ORG_ALIAS="arbeidsgiver-dialog"
secret=$npm_config_package_key

if [[ -n $npm_config_org_alias ]]; then
    org_alias=$npm_config_org_alias
else
    org_alias=$ORG_ALIAS
fi

echo ""
echo "Org Alias: $org_alias"
echo ""

if [[ -n $npm_config_org_duration ]]; then
    days=$npm_config_org_duration
else
    days=7
fi

echo "Scratch org duration: $days days"
echo ""

echo "Installing crm-arbeidsgiver-dialog scratch org ($org_alias)"
echo ""

echo "Cleaning previous scratch org..."
sf org delete scratch --no-prompt --target-org $org_alias &> /dev/null
echo ""

echo "Creating scratch org..."
sf org create scratch --set-default --definition-file config/project-scratch-def.json --duration-days "$days" --alias $org_alias || { error $? '"sf org create scratch" command failed.'; }
echo ""

echo "Installing dependencies..."
keys=""
for p in $(jq '.packageAliases | keys[]' sfdx-project.json -r);
do
    keys+=$p":"$secret" ";
done
sfdx sfpowerscripts dependency install --installationkeys "${keys}" || { error $? '"sfdx sfpowerscripts dependency install" command failed.'; }
echo ""

echo "Deploying/Pushing metadata..."
if [[ $npm_config_without_deploy ]]; then
    echo "Skipping deploy..."
else
    sf project deploy start || { error $? '"sf project deploy start" command failed.'; }
fi
echo ""

echo "Assigning permissions..."
sf org assign permset \
--name Messaging_Read_and_Write_Messages_and_Threads \
--name Arbeidsgiver_Dialog_Interne \
--name Arbeidsgiver_base \
--name Arbeidsgiver_contract \
|| { error $? '"sf org assign permset" command failed.'; }
echo ""

echo "Inserting test data..."
sf data import tree --plan dummy-data/plan.json || { error $? '"sf data import tree" command failed.'; }
echo ""

echo "Running post install scripts..."
sf apex run --file ./scripts/apex/activateMock.cls || { error $? '"sf apex run" command failed for Apex class: "activateMock".'; }
sf apex run --file ./scripts/apex/createPortalUser.cls || { error $? '"sf apex run" command failed for Apex class: "createPortalUser".'; }
sf apex run --file ./scripts/apex/createTestData.cls || { error $? '"sf apex run" command failed for Apex class: "createTestData".'; }
echo ""

echo "Opening org..."
if [[ -n $npm_config_browser ]]; then
    sf org open --browser "$browser" --path "lightning/app/standard__LightningService" || { error $? '"sf org open" command failed.'; }
else
    sf org open --path "lightning/app/standard__LightningService" || { error $? '"sf org open" command failed.'; }
fi
echo ""

publishCommunity

error $?
