#!/bin/bash

if [ -d $BACKEND_FOLDER ]; then
    cd $BACKEND_FOLDER
else
    cd $PROJECT_ROOT
    git clone $BACKEND_REPO $BACKEND_FOLDER
    cd $BACKEND_FOLDER
fi

# work but not standard
# git checkout "${ALT_BRANCH}" # ensure save fetch
# git fetch origin "${BACKEND_BRANCH}:${BACKEND_BRANCH}" # ensure content is latest

# start ensure content is latest
git checkout "${BACKEND_BRANCH}" # this is the branch to be built
git branch --set-upstream-to=origin/"${BACKEND_BRANCH}" "${BACKEND_BRANCH}" 
git reset --hard
git pull
# end
