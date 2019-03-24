set -e 

mkdir -p coverage

mv ~/shared/lcov.info coverage/lcov.info

cat ~/shared/version | while read LINE; do
    export VERSION=$LINE
    echo $VERSION
done

sonar-scanner -Dsonar.projectVersion=${VERSION}
    -Dsonar.links.homepage=https://github.com/${TRAVIS_REPO_SLUG}
    -Dsonar.links.ci=https://travis-ci.com/${TRAVIS_REPO_SLUG}
    -Dsonar.links.scm=https://github.com/${TRAVIS_REPO_SLUG}
    -Dsonar.links.issue=https://github.com/${TRAVIS_REPO_SLUG}/issues

