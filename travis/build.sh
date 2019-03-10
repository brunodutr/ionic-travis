set -e

# Build Ionic App for Android
npm run clean
npm run lint

if [[ "$TRAVIS_BRANCH" == "prod" ]]
then
    echo "Build APK para Produção"
    ionic cordova build android --prod --release
else
    echo "Build APK para Desenvolvimento"
    ionic cordova build android
fi