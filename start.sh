#!/bin/bash

echo "grabbing git repository"


FILE=/ssh/key
if test -f "$FILE"; then
    echo "$FILE exists."
fi

mkdir ~/.ssh/
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts


cp /ssh/key ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
git clone $GIT_REPO .
cd $WORKDIR

buildah build -f $DOCKERFILE -t $DOCKER_TAG:$DOCKER_VERSION .
