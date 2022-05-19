# syntax=docker/dockerfile:1
FROM nullstone/rails:webapp

# Install packages
COPY Gemfile* .
COPY package.json .
COPY yarn.lock .
RUN gem install bundler
RUN bundle install
RUN yarn install

# Copy in code, precompile static assets
COPY . .
RUN SECRET_KEY_BASE=1 bundle exec rake assets:precompile
