# syntax=docker/dockerfile:1
FROM nullstone/rails:6-webapp-ruby3

ENV RAILS_ENV development

# Install packages
COPY Gemfile* .
RUN gem install bundler
RUN bundle install

# Copy in code
COPY . .
