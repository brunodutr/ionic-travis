set -e

# Build Ionic App for Android
npm run clean
npm run lint

if [[ "$TRAVIS_BRANCH" == "prod" ]]
then
    echo "Build APK para Produção"
    npm run build-prod
else
    echo "Build APK para Desenvolvimento"
    npm run build
fi