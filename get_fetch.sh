#!/usr/bin/env zsh

endpoint=$1
lines=$2
if [[ -z $endpoint ]]; then
print -P "%F{red}──────────────────────────────────────────────────────────%f"
print -P "%F{red}  ❌ ERROR: Please enter a valid endpoint.%f"
print -P "%F{gray}  Example: %F{cyan}localhost:8000/api/students%f"
print -P "%F{red}──────────────────────────────────────────────────────────%f"
  exit 1
fi

if [[ -z $lines ]]; then
print -P "%F{green}──────────────────────────────────────────────────────────%f"
curl -s -H "Accept:application/json" $endpoint | jq 
else
print -P "%F{green}──────────────────────────────────────────────────────────%f"
  curl -s -H "Accept:application/json" $endpoint | jq -C | head  -$lines
fi
