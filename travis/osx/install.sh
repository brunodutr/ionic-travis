brew update
brew link --overwrite cocoapods || brew install yarn ios-sim jq ios-deploy cocoapods
rvm use system
pod setup