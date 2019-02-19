#!/bin/bash

hasImage=`docker images | grep ${BACKEND_IMAGE} | wc -l`
if [ $hasImage -eq 0 ]; then
    cd $BACKEND_DOCKERFILE_FOLDER
    docker build -t $BACKEND_IMAGE .
fi

running=`docker ps | grep ${BACKEND_INSTANCE} | wc -l`
if [ $running -eq 0 ]; then
    mkdir -p ${HOST_ROOT}/${BACKEND_FOLDER}
    echo "docker instance stopped"
    exists=`docker ps -a | grep ${BACKEND_INSTANCE} | wc -l`
    if [ $running -eq 0 ]; then
        echo "docker instance not exists"
    else
        docker rm ${BACKEND_INSTANCE}
        echo "docker instance exists, deleting"
    fi
    docker run --rm -d --network=${D_NETWORK} -p 39000:9000 -v ${HOST_ROOT}/${BACKEND_FOLDER}:/data --name=${BACKEND_INSTANCE} ${BACKEND_IMAGE}
else 
    echo "docker instance is running"
fi

for file in $(< ${PROJECT_ROOT}/env/backend/files_to_copy.txt)
do
    arrIN=(${file//;/ })
    echo "${arrIN[0]} - ${arrIN[1]}"
    docker cp "${PROJECT_ROOT}/${arrIN[0]}" "${BACKEND_INSTANCE}:${arrIN[1]}"
done
