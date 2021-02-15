FROM ledermann/rails-base-builder:3.0.0-alpine AS Builder
FROM ledermann/rails-base-final:3.0.0-alpine
LABEL maintainer="georg@ledermann.dev"

USER app

# Start up
CMD ["docker/startup.sh"]
