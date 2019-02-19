#!/bin/bash

running=`docker ps | grep ${BACKEND_INSTANCE} | wc -l`
if [ $running -eq 0 ]; then
    echo "docker instance stopped"
else
    docker stop ${BACKEND_INSTANCE}
    docker rm ${BACKEND_INSTANCE} || true
fi