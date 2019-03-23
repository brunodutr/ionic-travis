set -e 

echo "BRANCH: $TRAVIS_BRANCH | TESTS - $VERSION"

npm run lint

npm run unit-ci

cp coverage/lcov.info ~/$TRAVIS_REPO_SLUG/$TRAVIS_BUILD_NUMBER/lcov.info

sonar-scanner -Dsonar.projectVersion=${VERSION}          
                  -Dsonar.links.homepage=https://github.com/${TRAVIS_REPO_SLUG}
                  -Dsonar.links.ci=https://travis-ci.com/${TRAVIS_REPO_SLUG}
                  -Dsonar.links.scm=https://github.com/${TRAVIS_REPO_SLUG}
                  -Dsonar.links.issue=https://github.com/${TRAVIS_REPO_SLUG}/issues