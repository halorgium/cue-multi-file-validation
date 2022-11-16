# validating multiple files

## build the JSON

```
(cd source && cue export -e 'users') > users.json
```

command:
```
cue vet .
```

result is expected as this is only validating teams.cue

## With users

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

validating `users.json` now does not work:
```
cue vet . users.json
```

```
conflicting values [{name:"jim",email:"jim@example.com"}] and {teams:[{name:"admins",description:"Administrators"}]} (mismatched types list and struct):
    ./teams.cue:1:1
    ./users.json:1:1
```
