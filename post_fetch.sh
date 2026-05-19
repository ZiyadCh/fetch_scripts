#!/usr/bin/env bash

endpoint=$1
data=$2

RED='\033[31m'
YELLOW='\033[33m'
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

if [[ -z $data ]]; then
  printf "${YELLOW}┌────────────────────────────────────────────────────────┐${RESET}\n"
  printf "${YELLOW}│  WARNING: Missing JSON data payload.                  │${RESET}\n"
  printf "${YELLOW}│${RESET} ${GRAY}Example:${RESET} ${CYAN}$0 $endpoint '{\"nom\":\"Dupont\"}'${RESET} ${YELLOW}│${RESET}\n"
  printf "${YELLOW}└────────────────────────────────────────────────────────┘${RESET}\n"
  exit 1
fi

printf "${CYAN}┌────────────────────────────────────────────────────────┐${RESET}\n"
printf "${CYAN}│  Sending POST Request to:${RESET} ${WHITE}${BOLD}%s${RESET}\n" "$endpoint"
printf "${CYAN}└────────────────────────────────────────────────────────┘${RESET}\n"

curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d "$data" \
  "$endpoint" | jq -C
