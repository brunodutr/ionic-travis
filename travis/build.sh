set -e

# Build Ionic App for Android
npm run clean
npm run lint

if [[ "$TRAVIS_BRANCH" == "prod" ]]
then
    echo "Build APK para Produção"
    ionic cordova build android --prod --release -- -- --keystore=ionictravis.keystore --alias=ionic_travis_key 
else
    echo "Build APK para Desenvolvimento"
    ionic cordova build android
fi