# validating multiple files

## export to JSON

```
(cd source && cue export -e 'users') |jq '{users: .}' > users.json
(cd source && cue export -e 'teams') |jq '{teams: .}' > teams.json
```

## vetting

```
cue vet . -c
teams_json.contents: incomplete value string:
    ./schema.cue:38:13
users_json.contents: incomplete value string:
    ./schema.cue:31:13
error in call to encoding/json.Unmarshal: non-concrete value string:
    ./schema.cue:34:8
    ./schema.cue:31:13
error in call to encoding/json.Unmarshal: non-concrete value string:
    ./schema.cue:41:8
    ./schema.cue:38:13
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
