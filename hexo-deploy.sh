#!/usr/bin/env sh

hexo g -d   #generate and deploy

git add .
git push origin hexo
