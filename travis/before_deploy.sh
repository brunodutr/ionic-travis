set -e 

echo "BRANCH: $TRAVIS_BRANCH | PREPARE DEPLOY"

ln -s ~/$TRAVIS_BUILD_NUMBER/*.apk ionictravis-${VERSION}.apk
git tag -f v${VERSION}
git remote add travis https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}
git push travis :v${VERSION} || true
git push -f travis v${VERSION}
git remote remove travis