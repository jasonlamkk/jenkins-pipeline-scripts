#!/bin/bash

if [ -d $FRONTEND_FOLDER ]; then
    cd $FRONTEND_FOLDER
else
    cd $PROJECT_ROOT
    git clone $FRONTEND_REPO $FRONTEND_FOLDER
    cd $FRONTEND_FOLDER
fi

# work but not standard
# git checkout "${ALT_BRANCH}" # ensure save fetch
# git fetch origin "${FRONTEND_BRANCH}:${FRONTEND_BRANCH}" # ensure content is latest

# start ensure content is latest
git checkout "${FRONTEND_BRANCH}" # this is the branch to be built
git branch --set-upstream-to=origin/"${FRONTEND_BRANCH}" "${FRONTEND_BRANCH}"
git reset --hard
git pull
# end
