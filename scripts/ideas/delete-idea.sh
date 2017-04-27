#!/bin/bash
#ID=2 TOKEN=BAhJIiVlODkyNTczNzYzYmVkN2RmOWNlYWM1MjAyZDhmMDI2NgY6BkVG--23303c36d71984539b1c7c76dd96acaeb37c437c sh scripts/ideas/delete-idea.sh

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ideas/$ID"
curl "${API}${URL_PATH}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json"

echo
