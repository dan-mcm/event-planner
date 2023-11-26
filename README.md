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

docker-compose exec app rails db:create
docker-compose exec app rails db:migrate