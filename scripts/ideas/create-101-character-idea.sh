#!/bin/bash
# Test should fail! Character limit is set to 100.
#TOKEN=BAhJIiUzNmYyNDQyM2FiMGIxMTk2MTY1Y2VmYjU5M2FiYTkwMwY6BkVG--df55f3a3e0d68241efef889ede652908d2fad60e TEXT='This comment is 101 characters long. akjf;lajd adfsadfdsdsfdasdfasdfadfsadasdfasdfsdfadasdfasdasfasd1' sh scripts/ideas/create-101-character-idea.sh

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
