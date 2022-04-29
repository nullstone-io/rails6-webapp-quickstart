# Rails Web App Quickstart

This is a Rails Web App Quickstart for [Nullstone](https://nullstone.io).

This quickstart is set up with:
- Ruby 3
- Rails 6
- Static Assets
  - Configured to hot-reload assets for local development
  - Precompiled and served through NGINX for docker builds
- Postgresql Database
  - Migrations are executed on start of docker image
- Error logs 
  - Emitted to stdout for docker builds
  - Pretty errors for local development
- Hot reload for local development

This web app was generated following these steps.
1. `rails new --database=postgresql --skip-test --skip-sprockets .`
2. Add the following to `Gemfile`
  ```
  group :test do
    gem 'rspec-rails'
  end
  ```
3. `bundle install`
4. `rails generate rspec:install`

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
