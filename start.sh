#!/bin/bash

echo "grabbing git repository"


FILE=/ssh/key
if test -f "$FILE"; then
    echo "$FILE exists."
fi

ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts


cp /ssh/key /ssh_tmp_key
chmod 0600 /ssh_tmp_key
ssh-agent bash -c 'ssh-add /ssh_tmp_key; git clone $GIT_REPO .'
cd $WORKDIR

buildah build -f $DOCKERFILE -t $DOCKER_TAG:$DOCKER_VERSION .
