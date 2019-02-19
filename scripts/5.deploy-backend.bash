#!/bin/bash

my_dir="$(dirname $0)"
source "$my_dir/fetch-ip.bash"

#check if the path is empty, which likely a misconfiguration
safecheck=`echo ${FRONTEND_DEPLOY_PATH} | wc -c`

if [ $safecheck -gt 10 ]; then

  rsync -au -e ssh --exclude './.env' ${PROJECT_ROOT}/${BACKEND_FOLDER}/. ${BACKEND_DEPLOY_USER}@${DEPLOY_HOST}:${BACKEND_DEPLOY_PATH}

  # curl --request POST \
  #   --url https://hooks.slack.com/services/{token-part-1}/{token-part-2}/{token-part-3} \
  #   --header 'cache-control: no-cache' \
  #   --data "{\"text\": \"Backend Status: \nBranch: ${BACKEND_BRANCH}\nDeployed to ${BACKEND_DEPLOY_PATH}. \"}"

else
    echo "invalid deploy path ${FRONTEND_DEPLOY_PATH}"
fi