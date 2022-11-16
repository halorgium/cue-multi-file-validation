package validate

import "tool/file"
import "encoding/json"

command: validate: {
  users_json: file.Read & {
    filename: "users.json"
    contents: string
  }

  users: json.Unmarshal(users_json.contents)

  teams_json: file.Read & {
    filename: "teams.json"
    contents: string
  }

  my_teams: json.Unmarshal(teams_json.contents)

  my_teams & teams
}
