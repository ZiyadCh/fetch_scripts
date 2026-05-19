#!/usr/bin/env bash

endpoint=$1
lines=$2

RED='\033[31m'
GREEN='\033[32m'
CYAN='\033[36m'
WHITE='\033[97m'
GRAY='\033[90m'
RESET='\033[0m'
BOLD='\033[1m'

if [[ -z $endpoint ]]; then
  printf "${RED}┌────────────────────────────────────────────────────────┐${RESET}\n"
  printf "${RED}│  ERROR: Please enter a valid endpoint.                │${RESET}\n"
  printf "${RED}│${RESET} ${GRAY}Example:${RESET} ${CYAN}localhost:8000/api/students${RESET}                   ${RED}│${RESET}\n"
  printf "${RED}└────────────────────────────────────────────────────────┘${RESET}\n"
  exit 1
fi

printf "${GREEN}┌────────────────────────────────────────────────────────┐${RESET}\n"
printf "${GREEN}│  Sending GET Request to:${RESET} ${WHITE}${BOLD}%s${RESET}\n" "$endpoint"
printf "${GREEN}└────────────────────────────────────────────────────────┘${RESET}\n"

if [[ -z $lines ]]; then
  curl -s \
    -H "Accept: application/json" \
    "$endpoint" | jq -C
else
  curl -s \
    -H "Accept: application/json" \
    "$endpoint" | jq -C | head -"$lines"
fi
