#!/bin/bash
ID=13
CONTENT='this is changed content'
TOKEN="BAhJIiVkZWQzZmIwZGJiNWY2YThhYmM4OTZiZWM1NTVmMzlmZgY6BkVG--1ebb1489a8ef0365a3950030149a5294cfed4371"

API="https://mind-cloud.herokuapp.com"
URL_PATH="/ideas/$ID"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "idea": {
      "content": "'"${CONTENT}"'"
    }
  }'

echo
