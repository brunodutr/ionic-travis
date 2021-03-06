#!/usr/bin/env bash

set -e 

export GITHUB=https://github.com/${TRAVIS_REPO_SLUG}
export SONAR_TRAVIS=https://travis-ci.com/${TRAVIS_REPO_SLUG}

echo "**********************************"
echo "*        Download Files          *"
echo "**********************************"
 
curl -O "${S3_URL}/build/${TRAVIS_BUILD_NUMBER}/lcov.info"
curl -O "${S3_URL}/build/${TRAVIS_BUILD_NUMBER}/version"

export VERSION=$(cat version)

echo "*********************************"
echo "*        Sonar Analisys         *"
echo "*********************************"

mkdir -p coverage

mv lcov.info coverage/lcov.info

sonar-scanner -Dsonar.projectVersion=${VERSION} \
-Dsonar.links.homepage=${GITHUB} \
-Dsonar.links.ci=${SONAR_TRAVIS} \
-Dsonar.links.scm=${GITHUB} \
-Dsonar.links.issue=${GITHUB}/issues

