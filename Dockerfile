FROM nullstone/rails:6-ruby3

RUN apk add --no-cache --update \
    nodejs yarn

# Copy in code and install packages
COPY . .
RUN gem install bundler && bundle install

# Set RAILS_ENV to production for docker builds
# This is overriden in docker-compose for local exec to 'development'
ENV RAILS_ENV production

# Precompile assets
RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean
