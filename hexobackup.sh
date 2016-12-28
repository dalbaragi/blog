#!/bin/bash

#将Hexo文件夹下的内容备份并部署到GitHub
echo "Hexo backup............"
git add .
git commit -m "$1"
git push origin hexo
echo "-------------------------------------------------------------"
echo "Hexo deploy............"
hexo clean
hexo g -d
echo "-------------------------------------------------------------"
