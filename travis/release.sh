set -e 


git add .
git commit -m "[skip travis] PREPARANDO PROJETO PARA A PRÓXIMA VERSÃO: $(npm version patch --no-git-tag-version)"
git push https://github.com/${TRAVIS_REPO_SLUG} master


