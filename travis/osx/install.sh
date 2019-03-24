brew update
brew install cocoapods || brew link --overwrite cocoapods
brew install yarn ios-sim jq ios-deploy
rvm use system
pod setup
yarn install
yarn global add ionic cordova
        