set -e

echo "BRANCH: $TRAVIS_BRANCH | BUILD - $VERSION"

ionic cordova build android --prod --release

