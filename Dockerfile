FROM ledermann/rails-base-builder:2.7.2-alpine AS Builder
FROM ledermann/rails-base-final:2.7.2-alpine
LABEL maintainer="georg@ledermann.dev"

USER app

# Start up
CMD ["docker/startup.sh"]
