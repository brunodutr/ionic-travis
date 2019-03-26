#!/usr/bin/env bash

echo 'Creating cache...'
tar czf homebrew-cache.tar.gz -C /usr/local/Cellar node ios-sim jq ios-deploy cocoapods

mkdir -pv s3-cache
mv -v homebrew-cache.tar.gz s3-cache