set -e 

echo "BRANCH: $TRAVIS_BRANCH | TESTS - $VERSION"

npm run lint
npm run unit-ci
npm run e2e-ci
