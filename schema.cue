package validate

import "list"

#User: {
  name: string
  email: string
}

#Team: {
  name: string
  description: string
  owner: #Owner
}

#user_names: [for u in users { u.name }]

#Owner: O={
  string
  #known: list.Contains(#user_names, O)
  #known: true
}

users: [#User]
teams: [#Team]
