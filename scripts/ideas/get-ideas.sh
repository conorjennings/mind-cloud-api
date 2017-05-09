#!/bin/bash
#TOKEN=BAhJIiUzMmY0YzVkNjA4ZWE5ODFiYjY2MGQ1NTcxYzlmNmZjYQY6BkVG--708886a26e7e58d49c5517e0edf8d0b6048268b4 sh scripts/ideas/get-ideas.sh

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ideas"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
