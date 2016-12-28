#!/usr/bin/env sh

cd ~/blog

#generate and deploy to vps
hexo clean
hexo generate
hexo deploy

#backup blog to github
git add .
git commit -m "备份"
git push origin hexo

cd -
