#!/bin/bash

echo "just leave the room for initial configuration"


echo "for example, ensure required tools is installed"

hasJq=`which jq | wc -l`

if [ $hasJq -eq 0 ]; then
    apk add jq
fi

echo "another example, prepare some folder"

mkdir -p ${HOST_ROOT}/${BACKEND_FOLDER}

mkdir -p ${HOST_ROOT}/${FRONTEND_FOLDER}

echo "one more example, ensure the deploy target's ssh key is put into the known_host file"

my_dir="$(dirname $0)"
source "$my_dir/fetch-ip.bash"
ssh-keyscan -t rsa ${DEPLOY_HOST} > ~/.ssh/known_hosts