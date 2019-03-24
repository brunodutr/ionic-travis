pip install --user awscli
mkdir -p ~/shared
aws s3 sync s3://ionic-travis/$TRAVIS_BUILD_NUMBER ~/shared
