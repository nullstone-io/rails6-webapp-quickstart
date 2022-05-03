# Rails Web App Quickstart

This is a Rails Web App Quickstart for [Nullstone](https://nullstone.io).

This quickstart is set up with:
- Ruby 3
- Rails 6.1
- Static Assets
  - Configured to hot-reload assets for local development
  - Precompiled and served through NGINX for docker builds
- Postgresql Database
  - Migrations are executed on start of docker image
- Error logs 
  - Emitted to stdout for docker builds
  - Pretty errors for local development
- Hot reload for local development

## How to launch via Nullstone

1. Create postgresql datastore.
2. Create a public web app. (Remember `app-name` for later)
3. Add the postgresql datastore (from step 1) to the app.
4. Add the `SECRET_KEY_BASE for Rails Cookies` capability to the app.
5. Add the `Nginx Sidecar for Fargate Service` capability to the app.
6. Build, push, and deploy
  ```shell
  docker build -t rails-quickstart .
  nullstone launch --source=rails-quickstart --app=<app-name> --env=<env-name>
  ```

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

## Details on quickstart

This web app was generated following these steps.
1. `rails new --database=postgresql --skip-test --webpack .`
2. Add the following to `Gemfile`
  ```
  group :test do
    gem 'rspec-rails'
  end
  ```
3. `bundle install`
4. `rails generate rspec:install`
5. Set logs to stdout in development mode.
  ```
  # config/environments/development.rb
  ...
  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger     = ActiveSupport::TaggedLogging.new(logger)
  end
  ```
