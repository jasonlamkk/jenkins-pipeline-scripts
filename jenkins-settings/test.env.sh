export PROJECT_ROOT="/var/jenkins_home/workspace/pipeline-demo"
export HOST_ROOT="/home/pipeline-demo"

export D_NAME="jenkins-pipeline-scripts"
export D_REPO="https://github.com/jasonlamkk/${D_NAME}.git"
export D_BRANCH="develop"

export D_NETWORK="bridge"

export BACKEND_INSTANCE="jenkins-backend" 
export BACKEND_IMAGE="node/custom"
export BACKEND_DOCKERFILE_FOLDER="${PROJECT_ROOT}/{$D_NAME}/dockers/backend/"
export BACKEND_FOLDER="jenkins-pipeline-demo-backend"
export BACKEND_BRANCH="develop"
export BACKEND_REPO="https://github.com/jasonlamkk/${BACKEND_FOLDER}.git"
export BACKEND_FULL_FOLDER="$PROJECT_ROOT/$BACKEND_FOLDER"

export BACKEND_DEPLOY_PATH="/www/vhosts/api"
export BACKEND_DEPLOY_USER="user"

export FRONTEND_INSTANCE="jenkins-spa"
export FRONTEND_IMAGE="node/custom"
export FRONTEND_DOCKERFILE_FOLDER="${PROJECT_ROOT}/{$D_NAME}/dockers/frontend/"
export FRONTEND_FOLDER="jenkins-pipeline-demo-frontend"
export FRONTEND_BRANCH="develop"
export FRONTEND_REPO="https://github.com/jasonlamkk/${FRONTEND_FOLDER}.git"
export FRONTEND_FULL_FOLDER="$PROJECT_ROOT/$FRONTEND_FOLDER"

export FRONTEND_DEPLOY_PATH="/www/vhosts/spa"
export FRONTEND_DEPLOY_USER="user"
