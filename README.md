# validating multiple files

## build the JSON

```
(cd source && cue export -e 'users') > users.jso
```

command:
```
cue vet . users.json -c -d 'users'
```

result is expected
