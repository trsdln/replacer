#!/bin/bash

echo "Started"

TARGET_FILE=$1
FIND=$2
REPLACE=$3
TOP_LINE=$4
TEMP_FILE=.tmp

if grep -q "${FIND}" ${TARGET_FILE}; then # file contains string we need to replace
    # check if we need to top line
    if grep -q "${TOP_LINE}" "${TARGET_FILE}"; then
        echo "Insert top line in ${TARGET_FILE}"
        sed -e 'a\'$'\n'"${TOP_LINE}" ${TARGET_FILE} > ${TEMP_FILE} && mv -f ${TEMP_FILE} ${TARGET_FILE}
    fi

    # replace old usages with new one
    echo "Replace module usages"
    sed 's/${FIND}/${REPLACE}/g' ${TARGET_FILE} > ${TEMP_FILE} && mv -f ${TEMP_FILE} ${TARGET_FILE}
fi

echo "Finished"