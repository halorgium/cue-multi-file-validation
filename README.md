# validating multiple files

## export to JSON

```
(cd source && cue export -e 'users') |jq '{users: .}' > users.json
(cd source && cue export -e 'teams') |jq '{teams: .}' > teams.json
```

## exporting

```
cue export schema.cue *.json
{
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

### changing an owner

```
jq '.teams[0].owner = "not-jim"' teams.json > teams-temp.json
mv teams-temp.json teams.json
```

```
% cue export schema.cue *.json
teams.0.owner.#known: conflicting values true and false:
    ./schema.cue:13:10
    ./schema.cue:20:11
    ./schema.cue:21:11
    ./schema.cue:25:9
```
