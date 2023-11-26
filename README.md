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