export VERSION=$(node -p -e "require('./package.json').version")

if [[ "$TRAVIS_BRANCH" == "prod" ]]; then
    export SNAPSHOT=false;
    fi

if [[ "$TRAVIS_BRANCH" != "prod" ]]; then
    export VERSION=${VERSION}-SNAPSHOT &&
    export SNAPSHOT=true ;
    fi

echo ${VERSION} | tee > ~/shared/version
echo ${SNAPSHOT} | tee > ~/shared/snapshot