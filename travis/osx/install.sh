#!/usr/bin/env bash

HOMEBREW_YARN_INSTALLED="$(brew ls | grep -c yarn)"

if ! [[ $HOMEBREW_EMACS_INSTALLED -eq 1 ]]; then
  echo 'Installing dependencies...'
  brew update
  brew install cocoapods || brew link --overwrite cocoapods
  brew install yarn ios-sim jq ios-deploy  
fi

rvm use system
pod setup
yarn install
yarn global add ionic cordova
