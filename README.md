# Event Planner Application

A sample application running with Ruby on Rails.

Bootstrapped with default rails tooling i.e. `rails new event-planning -d postgresql`

## Dockerisation

To Run the application you can spin up the main application and dependencies via the docker-compose file:

```
docker-compose build
docker-compose up -d
```

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
curl -X GET http://localhost:3000/api/v1/events

# Show Specific Event Details
curl -X GET http://localhost:3000/api/v1/events/1

# Create a new Event
curl -i -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer your_token_here" -d '{"title":"New Event", "description":"Some description", "start_date":"2023-12-01", "end_date":"2023-12-02", "user_id": 1}' http://localhost:3000/api/v1/events

# Update an existing event (PUT also works)
curl -X PATCH -H "Content-Type: application/json" -d '{"title":"Updated Event"}' http://localhost:3000/api/v1/events/1

# Delete an event
curl -X DELETE http://localhost:3000/api/v1/events/1
```
