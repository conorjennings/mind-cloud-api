#!/bin/bash
#ID=92 TOKEN=BAhJIiVkZTcxZTlkZjBjYTFhMjhiMTBkYjg0ZTIwY2E1NGQ3ZgY6BkVG--66e2d042d22a20ed98cd20119112ea8e92bdb102 sh scripts/ideas/delete-idea.sh

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ideas/$ID"
curl "${API}${URL_PATH}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json"

echo
