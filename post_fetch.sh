#!/usr/bin/env zsh

endpoint=$1
data=$2

if [[ -z $endpoint ]]; then
  print -P "%F{red}┌────────────────────────────────────────────────────────┐%f"
  print -P "%F{red}│   ERROR: Please enter a valid endpoint.               │%f"
  print -P "%F{red}│%f %F{gray}Example: %F{cyan}localhost:8000/api/students%f                   %F{red}│%f"
  print -P "%F{red}└────────────────────────────────────────────────────────┘%f"
  exit 1
fi

if [[ -z $data ]]; then
  print -P "%F{yellow}┌────────────────────────────────────────────────────────┐%f"
  print -P "%F{yellow}│   WARNING: Missing JSON data payload.                 │%f"
  print -P "%F{yellow}│%f %F{gray}Example: %F{cyan}$0 $endpoint '{\"nom\":\"Dupont\", ...}'%f %F{yellow}│%f"
  print -P "%F{yellow}└────────────────────────────────────────────────────────┘%f"
  exit 1
fi

print -P "%F{cyan}┌────────────────────────────────────────────────────────┐%f"
print -P "%F{cyan}│   Sending POST Request to: %F{white}%B$endpoint%b%f "
print -P "%F{cyan}└────────────────────────────────────────────────────────┘%f"

curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d "$data" \
  "$endpoint" | jq -C
