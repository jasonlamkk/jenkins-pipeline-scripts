#!/bin/bash

echo "just leave the room for initial configuration"


echo "for example, ensure required tools is installed"

hasJq=`which jq | wc -l`

if [ $hasJq -eq 0 ]; then
    apk add jq
fi

echo "another example"

mkdir -p ${HOST_ROOT}/${BACKEND_FOLDER}

mkdir -p ${HOST_ROOT}/${FRONTEND_FOLDER}