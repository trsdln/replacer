# Utility for bulk text replacement

Written specifically for migration from global variables to modules in Meteor project.

__Syntax:__

```sh
$ replacer.sh file replace with top_line
```

__Usage example:__


```sh
TOP_LINE="import { MyModule } from 'imports/path/to/my/mod';"
FIND='App.Foo.MyModule'
REPLACE='MyModule'

for FILE in `git ls-files . | grep '.js'`; do 
  echo "Processing $FILE"
  ./replacer.sh "${FILE}" "${FIND}" "${REPLACE}" "${TOP_LINE}"
done
```

Right now it works only with Mac OS X, because it uses `sed` which isn't 
compatible with Linux's version of the utility.
