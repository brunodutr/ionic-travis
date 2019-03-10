set -e 


git add .
git commit -am "[skip travis] PREPARANDO PROJETO PARA A PRÓXIMA VERSÃO: $(npm version patch --no-git-tag-version)"
git remote rm origin
git remote add origin https://github.com/${TRAVIS_REPO_SLUG};
git push origin master


