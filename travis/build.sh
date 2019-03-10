set -e

# Build Ionic App for Android
npm run clean
npm run lint

if [[ "$TRAVIS_BRANCH" == "prod" ]]
then
    echo "Build APK para Produção"
    ionic cordova build android --prod --release
    
    echo "Sign APK para Produção"
    cd platforms/android/app/build/outputs/apk
    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -storepass $KEYSTORE_PASSWORD -keystore /home/travis/build/$TRAVIS_REPO_SLUG/ionictravis.keystore app-release-unsigned.apk ionic_travis_key
    zipalign -v 4 app-release-unsigned.apk app-release.apk
else
    echo "Build APK para Desenvolvimento"
    ionic cordova build android
fi