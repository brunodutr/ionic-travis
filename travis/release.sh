set -e 

npm version patch --no-git-tag-version

git checkout $TRAVIS_BRANCH
git add .
git commit -m "[skip travis] PREPARANDO PROJETO PARA A PRÓXIMA VERSÃO: $(node -p -e "require('./package.json').version")"
git push https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG} prod:master


