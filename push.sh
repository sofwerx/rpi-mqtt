#!/bin/bash -e
if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST == 'false' ]]; then
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
  set -x
  docker push ${REPO}:latest
  docker tag ${REPO}:latest ${REPO}:${TRAVIS_BUILD_NUMBER} 
  docker push ${REPO}:${TRAVIS_BUILD_NUMBER}
fi
