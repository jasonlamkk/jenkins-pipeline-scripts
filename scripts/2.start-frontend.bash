#!/bin/bash

hasImage=`docker images | grep ${FRONTEND_IMAGE} | wc -l`
if [ $hasImage -eq 0 ]; then
    cd $FRONTEND_DOCKERFILE_FOLDER
    docker build -t $FRONTEND_IMAGE .
fi

running=`docker ps | grep ${FRONTEND_INSTANCE} | wc -l`
if [ $running -eq 0 ]; then
    mkdir -p ${HOST_ROOT}/${FRONTEND_FOLDER}
    echo "docker instance stopped"
    exists=`docker ps -a | grep ${FRONTEND_INSTANCE} | wc -l`
    if [ $running -eq 0 ]; then
        echo "docker instance not exists"
    else
        docker rm ${FRONTEND_INSTANCE}
        echo "docker instance exists, deleting"
    fi
    docker run --rm -d --network=${D_NETWORK} -v "${HOST_ROOT}/${FRONTEND_FOLDER}":/build --name=${FRONTEND_INSTANCE} ${FRONTEND_IMAGE}
else 
    echo "docker instance is running"
fi

for file in $(< ${PROJECT_ROOT}/env/frontend/files_to_copy.txt)
do
    arrIN=(${file//;/ })
    echo "${arrIN[0]} - ${arrIN[1]}"
    docker cp "${PROJECT_ROOT}/${arrIN[0]}" "${BACKEND_INSTANCE}:${arrIN[1]}"
done
