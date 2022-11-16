# validating multiple files

## validating users

```
cue vet . users.json -d 'users' -c
```

result is expected

## validating teams

```
cue vet . teams.json -d 'teams' -c
0.owner.#known: conflicting values true and false:
    ./schema.cue:13:10
    ./schema.cue:20:11
    ./schema.cue:21:11
    ./schema.cue:25:9
```

```
cue vet . teams.json users.json -d 'teams' -c
0.owner.#known: conflicting values true and false:
    ./schema.cue:13:10
    ./schema.cue:20:11
    ./schema.cue:21:11
    ./schema.cue:25:9
```

```
cue vet . teams.json users.json -d 'teams | users' -c
2 errors in empty disjunction:
0: field not allowed: description:
    --schema:1:9
    ./schema.cue:5:8
    ./schema.cue:24:9
    ./teams.json:1:1
    ./teams.json:4:9
0.owner.#known: conflicting values true and false:
    --schema:1:1
    ./schema.cue:13:10
    ./schema.cue:20:11
    ./schema.cue:21:11
    ./schema.cue:25:9
```
