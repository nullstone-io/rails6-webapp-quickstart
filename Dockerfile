# syntax=docker/dockerfile:1
FROM nullstone/rails:6-webapp-ruby3

ENV RAILS_ENV production

# Install packages
COPY Gemfile* .
RUN gem install bundler
RUN bundle install

# Copy in code, precompile static assets
COPY . .
RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean
