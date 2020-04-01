FROM ledermann/rails-base-builder:latest AS Builder
FROM ledermann/rails-base-final:latest
LABEL maintainer="georg@ledermann.dev"

USER app

# Start up
CMD ["docker/startup.sh"]
