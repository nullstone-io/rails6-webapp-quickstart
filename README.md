# Rails Web App Quickstart

This is a Rails Web App Quickstart for [Nullstone](https://nullstone.io).

This web app was generated using the following:
```shell
rails new --database=postgresql -T .
rails generate rspec:install
```

This example is configured with the following:
- static assets served through nginx
- postgresql database

## How to run locally

```shell
docker compose up
```

Visit [http://localhost:3000](http://localhost:3000).

### Hot reload

The `app` in `docker-compose.yml` is configured to automatically reload changes to files.
You do not need to rebuild/restart the app when making changes to Rails files.

However, when updating dependencies, you will need to restart your docker container.
The dependencies will be installed on boot of the docker container.
