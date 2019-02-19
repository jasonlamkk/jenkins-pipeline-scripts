#!/bin/bash

cd ${PROJECT_ROOT}/${FRONTEND_FOLDER}

docker exec -i ${FRONTEND_INSTANCE} echo "DEMO; yarn update --ignore-platform-reqs --optimize-autoloader"

docker exec -i ${FRONTEND_INSTANCE} echo "DEMO; yarn run test"