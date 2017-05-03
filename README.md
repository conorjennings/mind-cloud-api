[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# mindCloud Client API

Find the repo for the mindCloud front end client [here](https://github.com/danielleletarte/mind-cloud-client).

Find the deployed mindCloud front end client [here](https://danielleletarte.github.io/mind-cloud-client/).

## Dependencies

Install with `bundle install`.

-   [`rails-api`](https://github.com/rails-api/rails-api)
-   [`rails`](https://github.com/rails/rails)
-   [`active_model_serializers`](https://github.com/rails-api/active_model_serializers)
-   [`ruby`](https://www.ruby-lang.org/en/)
-   [`postgres`](http://www.postgresql.org)


## API

This API manages the brilliant ideas of mindCloud users. A user can create new ideas and edit/delete existing ideas when authenticated. A user has can view only their own ideas.

### API end-points

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |
| GET    | `/ideas`               | `ideas#index`     |
| GET    | `/ideas/:id`           | `ideas#show`      |
| POST   | `/ideas`               | `ideas#create`    |
| PATCH  | `/ideas/:id`           | `ideas#update`    |
| DELETE | `/ideas/:id`           | `ideas#destroy`   |

All data returned from API actions is formatted as JSON.

### User Actions

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```
### User Actions

#### index /ideas

The index action is a GET that retrieves all the ideas associated with a user. The response body will contain JSON containing an array of ideas, e.g.:



Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ideas"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiUzNmYyNDQyM2FiMGIxMTk2MTY1Y2VmYjU5M2FiYTkwMwY6BkVG--df55f3a3e0d68241efef889ede652908d2fad60e sh scripts/ideas/get-ideas.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "ideas": [
  {
    "id": 1,
    "content": "this is a test"
  }
  {
    "id": 2,
    "content": "another idea"
  }
 ]
}
```
#### show /ideas/:id

The show action is a GET specifing the id of the idea to retrieve. If the request is successful the status will be 200, OK, and the response body will contain JSON for the idea requested.

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ideas/$ID"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json"
```

```sh
ID=2 TOKEN=BAhJIiVlODkyNTczNzYzYmVkN2RmOWNlYWM1MjAyZDhmMDI2NgY6BkVG--23303c36d71984539b1c7c76dd96acaeb37c437c sh scripts/ideas/get-idea.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "idea": {
    "id": 2,
    "content": "this is a specific idea"
  }
}
```
#### create /ideas

The create action expects a POST with an empty body (e.g '' or '{}' if JSON). If the request is successful, the response will have an HTTP Status of 201 Created, and the body will contain JSON of the created idea set to the associated user.

Request:

```sh
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
```

```sh
TOKEN=BAhJIiVmZjZmYTY1MWI3ODRmOTlkZGNmYTMyMTI0YTU0OWU5ZAY6BkVG--5e86cb79e6fe263cf0da4444bd0006774da82509 TEXT='here is idea 1' sh scripts/ideas/create-idea.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "idea": {
    "id": 1,
    "content": "here is idea 1"
  }
}
```
#### update /ideas/:id

This update action expects an empty (e.g '' or '{}' if JSON) PATCH to an existing idea.

If the request is successful, the response will have an HTTP Status of 200 OK, and the body will be JSON containing the updated idea.

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
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
```

```sh
ID=2 CONTENT='this is changed content' TOKEN=BAhJIiVlODkyNTczNzYzYmVkN2RmOWNlYWM1MjAyZDhmMDI2NgY6BkVG--23303c36d71984539b1c7c76dd96acaeb37c437c sh scripts/ideas/update-idea.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
#### destroy /ideas/:id

The destroy action is a DELETE request specifing the id of the idea to delete. If the request is successful the status will be 204 No Content.

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ideas/$ID"
curl "${API}${URL_PATH}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json"
```

```sh
ID=92 TOKEN=BAhJIiVkZTcxZTlkZjBjYTFhMjhiMTBkYjg0ZTIwY2E1NGQ3ZgY6BkVG--66e2d042d22a20ed98cd20119112ea8e92bdb102 sh scripts/ideas/delete-idea.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
