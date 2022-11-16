package validate

import "list"
import "tool/file"
import "encoding/json"

#User: {
  name: string
  email: string
}

#Team: {
  name: string
  description: string
  owner: #Owner
}

user_names: [for u in users { u.name }]

#Owner: O={
  string
  #known: list.Contains(user_names, O)
  #known: true
}

users: [#User]
teams: [#Team]

users_json: file.Read & {
  filename: "users.json"
  contents: string
}

users: json.Unmarshal(users_json.contents)

teams_json: file.Read & {
  filename: "teams.json"
  contents: string
}

teams: json.Unmarshal(teams_json.contents)
