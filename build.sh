#!/bin/bash -e
. .env
doker pull ${TRAVIS_REPO_SLUG}:latest || true
docker build -t ${TRAVIS_REPO_SLUG}:latest .
