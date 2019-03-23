sign_apk () {

    file=$1
    path=$2

    echo "BRANCH: $TRAVIS_BRANCH | SIGN APK"

    openssl aes-256-cbc -K $encrypted_be66c6f932df_key -iv $encrypted_be66c6f932df_iv -in ionictravis.keystore.enc -out ionictravis.keystore -d

    echo "FILE: ${file}"
    echo "PATH: ${path}"

    cd $path
    
    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -storepass $KEYSTORE_PASSWORD -keystore /home/travis/build/$TRAVIS_REPO_SLUG/ionictravis.keystore $file ionic_travis_key
    
    ${ANDROID_HOME}/build-tools/28.0.3/zipalign -v 4 $file app.apk
    
    rm $file

}

sign_apk app-release-unsigned.apk platforms/android/app/build/outputs/apk/release