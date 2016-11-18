#!/bin/bash

SAVE_NAME="ourworld"

SAVE_MAP="${SAVE_NAME}.zip"

#AUTOSAVE_INTERVAL="--autosave-interval 10"

#UTOSAVE_SLOTS="--autosave-slots 3"

#DISABLED_COMMANDS="--disallow-commands"

EXEC_DIR="/factorio"

EXEC_BIN="${EXEC_DIR}/bin/x64/factorio"

#EXEC_ARGS="${AUTOSAVE_INTERVAL} ${AUTOSAVE_SLOTS}"

AUTOSAVE_DIR="${EXEC_DIR}/saves"

echo "# Factorio Server launcher start..."

# find the latest autosaveN.zip

LATEST_MAP=`ls -t ${AUTOSAVE_DIR}/*.zip 2> /dev/null | head -1`

echo "# Latest autosave map: ${LATEST_MAP}"

if [ "${LATEST_MAP}" == "${AUTOSAVE_DIR}/${SAVE_MAP}" ]; then

echo "- Using origin map: ${LATEST_MAP}"

else

echo "- Using latest map: ${LATEST_MAP}"

mv ${LATEST_MAP} ${AUTOSAVE_DIR}/${SAVE_MAP}

fi

# Check save map

if [ ! -f ${LATEST_MAP} ]; then

${EXEC_BIN} --create ${SAVE_NAME}

fi

# Run server with args

${EXEC_BIN} --start-server ${SAVE_NAME} $@
