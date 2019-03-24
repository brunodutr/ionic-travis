set -e 

echo "BRANCH: $TRAVIS_BRANCH | PREPARE DEPLOY"

curl -O ${S3_URL}/build/${TRAVIS_BUILD_NUMBER}/app.apk

ln -s app.apk ionictravis-${VERSION}.apk

git tag -f v${VERSION}
git remote add travis https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}
git push travis :v${VERSION} || true
git push -f travis v${VERSION}
git remote remove travis