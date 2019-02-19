#!/bin/bash

echo "just leave the room for initial configuration"


echo "for example, ensure required tools is installed"

hasRsync=`which rsync | wc -l`

if [ $hasRsync -eq 0 ]; then
    apk add rsync
else 
    echo "rsync was installed"
fi

echo "another example, prepare some folder"

mkdir -p ${HOST_ROOT}/${BACKEND_FOLDER}

mkdir -p ${HOST_ROOT}/${FRONTEND_FOLDER}
