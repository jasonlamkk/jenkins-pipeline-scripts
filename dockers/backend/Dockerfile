FROM node:alpine

RUN apk --no-cache add bash yarn && \
mkdir /data && touch /data/docker-volume-not-mounted 

WORKDIR /data

CMD ["tail", "-f", "/dev/null"]