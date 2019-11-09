######################
# Stage: Builder
FROM ruby:2.6.5-alpine as Builder

ARG FOLDERS_TO_REMOVE
ARG BUNDLE_WITHOUT
ARG RAILS_ENV

RUN apk add --update --no-cache \
  build-base \
  postgresql-dev \
  git \
  nodejs \
  yarn \
  tzdata

WORKDIR /app

ENV BUNDLE_WITHOUT=${BUNDLE_WITHOUT} \
  RAILS_ENV=${RAILS_ENV} \
  SECRET_KEY_BASE=foo \
  APP_HOST=workcation.test

# Install gems
ADD Gemfile* /app/
RUN gem install bundler:2.0.2 && \
  bundle config --global frozen 1 && \
  bundle install -j4 --retry 3 && \
  # Remove unneeded files (cached *.gem, *.o, *.c)
  rm -rf /usr/local/bundle/cache/*.gem && \
  find /usr/local/bundle/gems/ -name "*.c" -delete && \
  find /usr/local/bundle/gems/ -name "*.o" -delete

# Install yarn packages
COPY package.json yarn.lock /app/
RUN yarn install

# Add the Rails app
ADD . /app

# Compile assets
RUN bundle exec rails webpacker:compile

# Remove folders not needed in resulting image
RUN rm -rf $FOLDERS_TO_REMOVE

###############################
# Stage Final
FROM ruby:2.6.5-alpine
LABEL maintainer="mail@georg-ledermann.de"

ARG ADDITIONAL_PACKAGES
ARG COMMIT_SHA
ARG COMMIT_TIME

ENV COMMIT_SHA=${COMMIT_SHA} \
  COMMIT_TIME=${COMMIT_TIME} \
  RAILS_LOG_TO_STDOUT=true \
  RAILS_SERVE_STATIC_FILES=true

# Add Alpine packages
RUN apk add --update --no-cache \
  postgresql-client \
  tzdata \
  file \
  $ADDITIONAL_PACKAGES

# Add user
RUN addgroup -g 1000 -S app && \
  adduser -u 1000 -S app -G app
USER app

# Copy app with gems from former build stage
COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=app:app /app /app

WORKDIR /app

# Expose Puma port
EXPOSE 3000

# Start up
CMD ["docker/startup.sh"]
