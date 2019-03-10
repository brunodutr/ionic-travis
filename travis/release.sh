set -e 

if [[ "$TRAVIS_BRANCH" == "prod" ]]
then

    npm version patch --no-git-tag-version

    git checkout master
    git add .
    git commit -m "[skip travis] PREPARANDO PROJETO PARA A PRÓXIMA VERSÃO: $(node -p -e "require('./package.json').version")"
    git push https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG} master

fi

