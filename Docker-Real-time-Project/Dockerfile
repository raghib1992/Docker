# Use existing Docker Image as a base
FROM alpine
    # Set the baseImage to use for subsequent instructions. FROM must be the first instruction in a Dockerfile.
    # FROM baseImage
    # FROM baseImage:tag
    # FROM baseImage@digest

# Downlaod and install dependencies
RUN apk add --update redis
    # Execute any commands on top of the current image as a new layer and commit the results

# Tell the image what to do when it start as a container
CMD [ "redis-server" ]
    # Provide defaults for an executing container. If an executable is not specified, then ENTRYPOINT must be specified as well. There can only be one CMD instruction in a Dockerfile.
    # CMD [ "/bin/ls", "-l" ]