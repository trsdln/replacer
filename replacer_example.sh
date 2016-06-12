#!/usr/bin/env bash

SOURCE_FILE=main.js

TOP_LINE="import { MyModule } from 'imports/path/to/my/mod';"
FIND='App.Foo.MyModule'
REPLACE='MyModule'

echo "Replacing '${FIND}' with '${REPLACE}' while adding '${TOP_LINE}' at top"

OUT_SUFF=_out.js

rm -f ./test/*${OUT_SUFF} #remove old output files

for SOURCE_FILE in `ls -1 test/*`; do
  FILE="${SOURCE_FILE}${OUT_SUFF}"
  cp ${SOURCE_FILE} ${FILE} # don't affect source file

  ./replacer.sh "${FILE}" "${FIND}" "${REPLACE}" "${TOP_LINE}"
done



