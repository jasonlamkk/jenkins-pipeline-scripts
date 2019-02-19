export DEPLOY_HOST=`docker network inspect ${D_NETWORK} | jq '.[0].IPAM.Config[0].Gateway' | xargs`
echo "Demo deployment target's IP address is: ${DEPLOY_HOST}"