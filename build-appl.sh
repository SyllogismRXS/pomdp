#!/bin/bash

##############################################
# Build APPL
##############################################
if [ ! -d ./3rd-party-build ];
then
    mkdir ./3rd-party-build
fi

if [ ! -d ./3rd-party-build/appl* ]; then
    echo "Extracting APPL..."
    tar xvf ./3rd-party/appl* -C ./3rd-party-build
fi

pushd ./3rd-party-build/appl*/src >& /dev/null
make
popd >& /dev/null

##############################################
# Generate setenv.sh file
##############################################
ENV_VAR_FILE="setenv.sh"

if [ -f $ENV_VAR_FILE ];
then
    rm ${ENV_VAR_FILE}
fi

WORK_DIR=${PWD}
NEW_FILE_PATH=${PWD}/$ENV_VAR_FILE
APPL_ROOT=$(readlink -f ./3rd-party-build/appl*)

echo 'export APPL_ROOT='"${APPL_ROOT}" > ${ENV_VAR_FILE}
echo 'export PATH=${PATH}:'"${APPL_ROOT}/src" >> ${ENV_VAR_FILE}

chmod +x ${ENV_VAR_FILE}

echo "-----------------------------------------------------"
echo "Generated environment file"
echo "Add the following to your .bashrc file for future use"
echo "        source ${NEW_FILE_PATH}"

source $ENV_VAR_FILE
