set -e 


curl -O ${S3_URL}/build/${TRAVIS_BUILD_NUMBER}/www.tar.gz

if [ -f wwww.tar.gz ]; then
  if ! tar tf www.tar.gz &>/dev/null; then
    rm -v www.tar.gz
    echo 'Cache was bad or empty'
    exit 1
  fi

  echo 'Extracting dependencies...'
  tar xzf www.tar.gz -C www

fi