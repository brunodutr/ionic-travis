set -e

# Build Ionic App for Android
npm run clean
npm run lint

if [[ "$TRAVIS_BRANCH" == "prod" ]]
then
    echo "Build APK para Produção"
    ionic cordova build android --prod
    export VERSION = $(npm version patch)
    export TRAVIS_TAG= $('V' + $VERSION)
else
    echo "Build APK para Desenvolvimento"
    ionic cordova build android
    export VERSION = $(node -p -e "require('./package.json').version")
    export TRAVIS_TAG= $('V' + $VERSION + '-SNAPSHOT')
fi