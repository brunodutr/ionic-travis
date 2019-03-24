#!/usr/bin/env bash

echo 'Fetching cache...'
        
curl -O https://s3-sa-east-1.amazonaws.com/ionic-travis/osx-cache/homebrew-cache.tar.gz

if [ -f homebrew-cache.tar.gz ]; then
  if ! tar tf homebrew-cache.tar.gz &>/dev/null; then
    rm -v homebrew-cache.tar.gz
    echo 'Cache was bad or empty'
    exit 0
  fi

  echo 'Extracting dependencies...'
  tar xzf homebrew-cache.tar.gz -C /usr/local/Cellar

  echo 'Linking dependencies...'
  brew link yarn ios-sim jq ios-deploy
  brew link --overwrite cocoapods
fi