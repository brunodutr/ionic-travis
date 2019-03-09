set -e

# Build Ionic App for Android
npm run clean
npm run lint

if [[ "$TRAVIS_BRANCH" == "prod" ]]
then
    echo "Build APK para Produção"
    ionic cordova build android --prod
    git checkout -- .
    export VERSION=$(npm version patch)
    export TRAVIS_TAG="v${$VERSION}"
else
    echo "Build APK para Desenvolvimento"
    ionic cordova build android
    export VERSION=$(node -p -e "require('./package.json').version")
    export TRAVIS_TAG="v${VERSION}-SNAPSHOT"
fi