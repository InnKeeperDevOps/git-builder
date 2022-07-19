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

buildah build -f $DOCKERFILE -t $REGISTRY_HOST/$DOCKER_TAG:$DOCKER_VERSION .

echo $REGISTRY_PASSWORD | buildah login -u $REGISTRY_USERNAME --password-stdin $REGISTRY_HOST

buildah push $REGISTRY_HOST/$DOCKER_TAG:$DOCKER_VERSION
