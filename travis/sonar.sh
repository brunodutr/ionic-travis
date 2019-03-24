set -e 

mkdir -p coverage

mv ~/shared/lcov.info coverage/lcov.info

cat ~/shared/version | while read LINE; do
    export VERSION=$LINE
    echo $VERSION
done

export GITHUB=https://github.com/${TRAVIS_REPO_SLUG}
export SONAR_TRAVIS=https://travis-ci.com/${TRAVIS_REPO_SLUG}

sonar-scanner -Dsonar.projectVersion=${VERSION} \
-Dsonar.links.homepage=${GITHUB} \
-Dsonar.links.ci=${SONAR_TRAVIS} \
-Dsonar.links.scm=${GITHUB} \
-Dsonar.links.issue=${GITHUB}/issues

