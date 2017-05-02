#!/bin/bash
#TOKEN=BAhJIiVkZTcxZTlkZjBjYTFhMjhiMTBkYjg0ZTIwY2E1NGQ3ZgY6BkVG--66e2d042d22a20ed98cd20119112ea8e92bdb102 sh scripts/ideas/get-ideas.sh

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ideas"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
