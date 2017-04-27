#!/bin/bash

#TOKEN=BAhJIiVlODkyNTczNzYzYmVkN2RmOWNlYWM1MjAyZDhmMDI2NgY6BkVG--23303c36d71984539b1c7c76dd96acaeb37c437c TEXT='second idea' sh scripts/ideas/create-idea.sh

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ideas"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "idea": {
      "content": "'"${TEXT}"'"
    }
  }'

echo
