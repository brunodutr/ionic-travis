set -e

npm run clean
npm run lint

echo "BRANCH: $TRAVIS_BRANCH | BUILD"

ionic cordova build android --prod --release

