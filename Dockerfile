# syntax=docker/dockerfile:1
FROM nullstone/rails:webapp

# Install packages
COPY Gemfile* .
RUN gem install bundler
RUN bundle install

COPY package.json .
COPY yarn.lock .
RUN yarn install

# Copy in code, precompile static assets
COPY . .
RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean
