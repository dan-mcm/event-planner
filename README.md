# Event Planner Application

A sample application running with Ruby on Rails.

Bootstrapped with default rails tooling i.e. `rails new event-planning -d postgresql`

## Dockerisation

To Run the application you can spin up the main application and dependencies via the docker-compose file:

```
docker-compose build
docker-compose up -d
```

## Environmental Variables

Open Weather Maps API key is hardcoded in weather_controller.rb. You will need to swap this out for a valid key to be able to run the service locally. This will be substituted with a .env variable at a later date.


## Databases

Hosted via Postgres docker image (with non persistent-volume for now). To manually create & run migrations you can run the below:

Manually access the DB:

```
docker exec -it event-planner-db-1 bash
psql -U "ep_user" -d "ep_db"
```

Manually run the db migrations:

```
docker exec -it event-planner-app-1 bash
bundle exec rake db:migrate:status
bundle exec rake db:migrate
```

## API Endpoints

The following endpoints are implemented

### User (devise default endpoints)
As the User registration is configured via [Devise](https://github.com/heartcombo/devise) theres some default registration endpoints configured:

```
# User Registration
/users/sign_up

# User Login
/users/sign_in

# User Logout
/users/sign_out

# User Profile
/users/edit
/users/:id/edit

# Password Reset
/users/password/new
/users/password/edit

# Account Deletion
/users/cancel

# Session Management
/users/confirmation/new
/users/confirmation
/users/unlock/new
/users/unlock
```

### Events Endpoints
```
# Events Index
curl -X GET http://localhost:3000/events

# Show Specific Event Details
curl -X GET http://localhost:3000/events/1

# Create a new Event
curl -i -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer your_token_here" -d '{"title":"New Event", "description":"Some description", "start_date":"2023-12-01", "end_date":"2023-12-02", "user_id": 1}' http://localhost:3000/api/v1/events

# Update an existing event (PUT also works)
curl -X PATCH -H "Content-Type: application/json" -d '{"title":"Updated Event"}' http://localhost:3000/events/1

# Delete an event
curl -X DELETE http://localhost:3000/events/1
```

### Example End to End Flow
```
# create a user

## Need to imitate landing on page to generate CSRF token
curl -X GET http://localhost:3000/users/sign_in

## Use the CSRF from above in folow on query
## Note; currently cant get either of these flows to work.

## attempt 1 - trying CSRF token passed as header, have also attemptedpassed as authentication token, also trialed passing authentication token from sign_in endpoint in payload as well no luck.
# curl -X POST -H "Content-Type: application/json" -d '{
  "user": {
    "email": "example@example.com",
    "password": "password",
    "password_confirmation": "password"
  }
}' http://localhost:3000/users/sign_up

## attempt 2 - trying authenticty token to match format of browser query

curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "authenticity_token=$authenticity_token&user%5Bemail%5D=daniellll%40test.com&user%5Bpassword%5D=123123&user%5Bpassword_confirmation%5D=123123&commit=Sign+up" http://localhost:3000/users/sign_up


# login and get auth token
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"user": {"email": "test@daniel.com", "password": "123123"}}' \
  http://localhost:3000/users/sign_in

# create event using token
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer {{AUTH TOKEN}}" \
  -d '{"event": {"title": "Event Title", "description": "Event Description", "date": "2023-12-01T12:00:00", "location": "Event Location"}}' \
  http://localhost:3000/api/v1/events

```
