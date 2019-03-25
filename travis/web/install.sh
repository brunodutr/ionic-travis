set -e 

npm run build-prod
tar cvzf www.tar.gz www/
mkdir -pv build-web
mv -v www.tar.gz build-web