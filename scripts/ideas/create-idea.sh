#!/bin/bash

#TOKEN='BAhJIiVhNDcyOTg0MDk5Nzg2MjE2ZGNjZTYwZGQwYWM2ZDYzMAY6BkVG--88322dbfdc09bcc31411fca0cf6f094f00f318f9' TEXT='' sh scripts/ideas/create-idea.sh

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
