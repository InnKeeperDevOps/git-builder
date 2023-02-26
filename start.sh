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
if [[ -z "${GIT_BRANCH}" ]]; then
    git checkout $GIT_BRANCH
fi
if [[ -z "${GIT_COMMIT}" ]]; then
    git commit $GIT_COMMIT
fi

echo "==="
echo "branch:"`git rev-parse --abbrev-ref HEAD`
git log -1 --pretty="hash:%H, author:%an, date:%ct"
echo "==="

buildah build --storage-driver overlay -f $DOCKERFILE -t $REGISTRY_HOST/$DOCKER_TAG:$DOCKER_VERSION $WORKDIR

echo $REGISTRY_PASSWORD | buildah login -u $REGISTRY_USERNAME --password-stdin $REGISTRY_HOST

buildah push --storage-driver overlay $REGISTRY_HOST/$DOCKER_TAG:$DOCKER_VERSION

