set -e

npm run lint
npm run test-travis

echo "BRANCH: $TRAVIS_BRANCH | BUILD - $VERSION"

ionic cordova build android --prod --release

