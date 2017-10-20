#!/bin/bash -e
if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST == 'false' ]]; then
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
  docker push ${REPO}:${TRAVIS_BUILD_NUMBER}
  docker tag ${REPO}:${TRAVIS_BUILD_NUMBER} ${REPO}:latest 
  docker push ${REPO}:latest
fi
