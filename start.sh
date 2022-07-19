#!/bin/bash

echo "grabbing git repository"


FILE=/ssh/key
if test -f "$FILE"; then
    echo "$FILE exists."
fi
chmod 0600 /ssh/key
ssh-agent bash -c 'ssh-add /ssh/key; git clone $GIT_REPO .'
cd $WORKDIR

buildah build -f $DOCKERFILE -t $DOCKER_TAG:$DOCKER_VERSION .
