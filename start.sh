#!/bin/bash

echo "grabbing git repository"


FILE=/ssh/key
if test -f "$FILE"; then
    echo "$FILE exists."
fi

git clone $GIT_REPO . -key "/ssh/key"
cd $WORKDIR

buildah build -f $DOCKERFILE -t $DOCKER_TAG:$DOCKER_VERSION .
