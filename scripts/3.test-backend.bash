#!/bin/bash

cd ${PROJECT_ROOT}/${BACKEND_FOLDER}

docker exec -i ${BACKEND_INSTANCE} echo "DEMO; yarn update --ignore-platform-reqs --optimize-autoloader"

docker exec -i ${BACKEND_INSTANCE} echo "DEMO; yarn run test"