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

#UserNames: [for u in users { u.name }]

#Owner: O={
  string
  #known: list.Contains(#UserNames, O)
  #known: true
}

users: [#User]
teams: [#Team]
