#!/usr/bin/env bash

echo 'Fetching cache...'
        
curl -O https://s3-sa-east-1.amazonaws.com/ionic-travis/osx-cache/homebrew-cache.tar.gz

node -v
npm -v
if [ -f homebrew-cache.tar.gz ]; then
  if ! tar tf homebrew-cache.tar.gz &>/dev/null; then
    echo 'Cache was bad or empty'
    rm -v homebrew-cache.tar.gz
    echo 'Installing dependencies...'
    brew update
    brew install cocoapods || brew link --overwrite cocoapods
    brew install ios-sim jq ios-deploy  
  else
    echo 'Extracting dependencies...'
    tar xzf homebrew-cache.tar.gz -C /usr/local/Cellar

    echo 'Linking dependencies...'
    brew link ios-sim jq ios-deploy
    brew link --overwrite cocoapods
  fi
fi

rvm use system
# pod setup

npm install
npm rebuild node-sass
npm install -g ionic cordova
