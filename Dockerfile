FROM ledermann/rails-base-builder:3.1.2-alpine AS Builder
FROM ledermann/rails-base-final:3.1.2-alpine
LABEL maintainer="georg@ledermann.dev"

# Workaround to trigger Builder's ONBUILDs to finish:
COPY --from=Builder /etc/alpine-release /tmp/dummy

USER app

# Start up
CMD ["docker/startup.sh"]
