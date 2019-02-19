#!/bin/bash

my_dir="$(dirname $0)"
source "$my_dir/fetch-ip.bash"


cd ${PROJECT_ROOT}/${FRONTEND_FOLDER}

docker exec -i ${FRONTEND_INSTANCE} bash run-yarn-in-docker.bash

#check if the path is empty, which likely a misconfiguration
safecheck=`echo ${FRONTEND_DEPLOY_PATH} | wc -c`
if [ $safecheck -gt 10 ]; then

  echo "deploying ${PROJECT_ROOT}/${FRONTEND_FOLDER}/build/. \n with account ${FRONTEND_DEPLOY_USER} \n to server ${DEPLOY_HOST} "
  rsync -au -e ssh --exclude './.env' ${PROJECT_ROOT}/${FRONTEND_FOLDER}/build/. ${FRONTEND_DEPLOY_USER}@${DEPLOY_HOST}:${FRONTEND_DEPLOY_PATH}

#   curl --request POST \
#     --url https://hooks.slack.com/services/{token-part-1}/{token-part-2}/{token-part-3} \
#     --header 'cache-control: no-cache' \
#     --data "{\"text\": \"Frontend Status: \nBranch: ${FRONTEND_BRANCH}\nDeployed to https://developers:palo2009@uat.lancelotlam.com/login\"}"

else 
  echo "invalid deploy path ${FRONTEND_DEPLOY_PATH}"
fi 
