#!/bin/bash

#TOKEN=BAhJIiVmZjZmYTY1MWI3ODRmOTlkZGNmYTMyMTI0YTU0OWU5ZAY6BkVG--5e86cb79e6fe263cf0da4444bd0006774da82509 TEXT='here is idea 1' sh scripts/ideas/create-idea.sh

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
