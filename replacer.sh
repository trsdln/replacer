#!/bin/bash

echo "Started"

IMP='import { Meteor }'
FIND='Meteor'
REPLACE='CoolModule'
FL=main1.js

cp todo.txt $FL

if grep -q "${FIND}" $FL; then # file contains string we need to replace
    # check if we need to add import
    if grep -q "${IMP}" "${FL}"; then
        echo "Insert import in ${FL}"
        sed -e 'a\'$'\n'"${IMP}" $FL > tmp && mv -f tmp $FL && echo "YES" || echo "OOPS"
    fi

    # replace old usages with new one
    sed 's/${FIND}/${REPLACE}/g' $FL > tmp && mv -f tmp $FL
    echo "Replace module usages"
fi

