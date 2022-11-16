# validating multiple files

## export to JSON

```
(cd source && cue export -e 'users') |jq '{users: .}' > users.json
(cd source && cue export -e 'teams') |jq '{teams: .}' > teams.json
```

## vetting

```
cue vet schema.cue *.json
teams.0.owner.#known: conflicting values true and false:
    ./schema.cue:13:10
    ./schema.cue:20:11
    ./schema.cue:21:11
    ./schema.cue:25:9
```

## exporting

```
cue export schema.cue *.json
{
    "user_names": [
        "jim"
    ],
    "users": [
        {
            "name": "jim",
            "email": "jim@example.com"
        }
    ],
    "teams": [
        {
            "name": "admins",
            "description": "Administrators",
            "owner": "jim"
        }
    ]
}
```
