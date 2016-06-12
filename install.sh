#!/usr/bin/env bash

INSTALL_DEST="/usr/local/bin/replacer"

if [[ $1 == '-r' ]]; then
 rm -f ${INSTALL_DEST}
else
 echo "Creating symlink at ${INSTALL_DEST}"
 ln -s $(pwd)/replacer.sh ${INSTALL_DEST}
fi

