# validating multiple files

## build the JSON

```
(cd source && cue export -e 'users') > users.json
```

command:
```
cue vet .
```

result is expected

Uncommenting `users` results in:
```
cue vet . -c
```

```
users.0.email: incomplete value string:
    ./schema.cue:5:10
users.0.name: incomplete value string:
    ./schema.cue:4:9
```
