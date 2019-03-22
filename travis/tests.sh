set -e 

echo "BRANCH: $TRAVIS_BRANCH | TESTS - $VERSION"

npm run lint

npm run unit-ci

webdriver-manager update --standalone false --gecko false --versions.chrome 2.35
npm run e2e-ci

sonar-scanner -Dsonar.projectVersion=${VERSION}          
                  -Dsonar.links.homepage=https://github.com/${TRAVIS_REPO_SLUG}
                  -Dsonar.links.ci=https://travis-ci.com/${TRAVIS_REPO_SLUG}
                  -Dsonar.links.scm=https://github.com/${TRAVIS_REPO_SLUG}
                  -Dsonar.links.issue=https://github.com/${TRAVIS_REPO_SLUG}/issues