uglifyjs jquery-ui-scrollable.js --comments -o jquery-ui-scrollable.min.js

git add . && git commit -am "New Build"

git push origin master
git push -f origin master:gh-pages
