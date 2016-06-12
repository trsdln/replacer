# Utility for bulk text replacement

### Usage:

```
$ replacer.sh targetFile whatReplace withWhat addThisAtTopOfFile
```

### Usage example


```
TOP_LINE="import \{ MyModule \} from 'imports/path/to/my/mod';"
FIND='App.Foo.MyModule'
REPLACE='MyModule'

for FILE in `git ls-files . | grep '.js'`; do 
  echo "Processing $FILE"
  ./replacer.sh "${FILE}" "${FIND}" "${REPLACE}" "${TOP_LINE}"
done
```

It uses `sed` which is not compatible between Linux and Mac OS, so
right now it works only with Mac OS.
