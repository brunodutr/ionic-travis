#!/usr/bin/env bash

echo 'Fetching cache...'
        
curl -O https://s3-sa-east-1.amazonaws.com/ionic-travis/osx-cache/homebrew-cache.tar.gz

if [ -f homebrew-cache.tar.gz ]; then
  if ! tar tf homebrew-cache.tar.gz &>/dev/null; then
    echo 'Cache was bad or empty'
    rm -v homebrew-cache.tar.gz
    echo 'Installing dependencies...'
    brew update
    brew install cocoapods || brew link --overwrite cocoapods
    brew install yarn ios-sim jq ios-deploy  
  fi

  echo 'Extracting dependencies...'
  tar xzf homebrew-cache.tar.gz -C /usr/local/Cellar

  echo 'Linking dependencies...'
  brew link yarn ios-sim jq ios-deploy
  brew link --overwrite cocoapods
fi

rvm use system
pod setup
yarn install
yarn global add ionic cordova
