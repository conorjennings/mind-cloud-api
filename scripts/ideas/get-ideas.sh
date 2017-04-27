#!/bin/bash
#TOKEN=BAhJIiUzNmYyNDQyM2FiMGIxMTk2MTY1Y2VmYjU5M2FiYTkwMwY6BkVG--df55f3a3e0d68241efef889ede652908d2fad60e sh scripts/ideas/get-ideas.sh

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ideas"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
