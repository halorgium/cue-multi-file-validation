# validating multiple files

## build the JSON

```
(cd source && cue export -e 'users') > users.json
(cd source && cue export -e 'teams') > teams.json
```

vet fails:
```
% cue vet . users.json teams.json
conflicting values [{name:"jim",email:"jim@example.com"}] and {#User:{name:string,email:string},#Team:{name:string,description:string},users:[#User],teams:[#Team]} (mismatched types list and struct):
    ./schema.cue:1:1
    ./users.json:1:1
```
