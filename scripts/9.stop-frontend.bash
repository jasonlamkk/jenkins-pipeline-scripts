#!/bin/bash

running=`docker ps | grep ${FRONTEND_INSTANCE} | wc -l`
if [ $running -eq 0 ]; then
    echo "docker instance stopped"
else
    docker stop ${FRONTEND_INSTANCE}
    docker rm ${FRONTEND_INSTANCE}
fi