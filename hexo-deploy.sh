#!/usr/bin/env sh

#generate and deploy to vps
hexo clean
hexo generate
hexo deploy

#backup blog to github
cd ~/blog
git add .
git commit -m "备份"
git push origin hexo
cd -
