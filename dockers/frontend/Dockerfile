FROM node:alpine

RUN apk --no-cache add bash yarn && \
mkdir /build && touch /build/docker-volume-not-mounted 

WORKDIR /build

CMD ["tail", "-f", "/dev/null"]