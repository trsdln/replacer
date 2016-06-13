#!/bin/bash

TARGET_FILE="./${1}"
FIND=$2
REPLACE=$3
TOP_LINE=$4
TEMP_FILE=.tmp

TOP_STAT="NO"
REPL_STAT="NO"

if [ ! -f ${TARGET_FILE} ]; then
    echo "File not found: '${TARGET_FILE}'"
    exit 1;
fi

if grep -q "${FIND}" ${TARGET_FILE}; then # file contains string we need to replace
    # check if we need to top line
    if [[ $(grep -l "${TOP_LINE}" "${TARGET_FILE}") == '' ]]; then
        TOP_STAT="YES"
        sed -e '1i\'$'\n'"${TOP_LINE}" ${TARGET_FILE} > ${TEMP_FILE} && mv -f ${TEMP_FILE} ${TARGET_FILE}
    fi

    # replace old usages with new one
    sed 's/'${FIND}'/'${REPLACE}'/g' ${TARGET_FILE} > ${TEMP_FILE} && mv -f ${TEMP_FILE} ${TARGET_FILE}
    REPL_STAT="YES"
fi

if [ ${REPL_STAT} == "YES" ]; then
    echo "Processed ${TARGET_FILE}: TOP=${TOP_STAT} REPL=${REPL_STAT}"
fi
