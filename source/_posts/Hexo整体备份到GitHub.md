---
title: Hexo整体备份到GitHub
date: 2016-11-20 12:44:09
id: 1479617049
tags:
  hexo
categories:
  hexo
---

>通过hexo deploy部署到GitHub时，只会将public文件夹中生成的html文件上传至GitHub仓库，并不会备份配置文件、markdown文件等。下面的工作是为了将Hexo文件夹整个备份到GitHub中。

参考[备份 Hexo 源文件至 GitHub](http://www.leyar.me/backup-your-blog-to-github/)

## 前提

已经将hexo部署到了dalbragi.github.io。

## 步骤

### 初始化git

在Hexo根目录下执行

```
git init
```

<!--more-->

### 创建并切换分支

在Hexo根目录下执行
```
git checkout -b hexo
```

### 添加README

根目录下创建README.md，并添加。

```
git add README.md
```

### 创建忽略文件

根目录下创建`.gitignore`，添加忽略的内容。

在这里，只添加了`public/`，因为已经提交到了master分支下，其他部分可以按需选择备份。

### 添加内容到仓库并提交到远程仓库

#### 第一次提交：

```
git add .
git commit -m "说明内容"
git remote add origin git@github.com:dalbaragi/dalbaragi.github.io  #地址关联到自己的仓库
git push -u origin hexo
```

**[-u选项说明:](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/0013752340242354807e192f02a44359908df8a5643103a000)**
由于远程库是空的，我们第一次推送master分支时，加上了-u参数，Git不但会把本地的master分支内容推送的远程新的master分支，还会把本地的master分支和远程的master分支关联起来，在以后的推送或者拉取时就可以简化命令。

#### 之后提交：

```
git add .
git commit -m "说明内容"
git push origin hexo
```
#### 一些说明

```
git add -A  #stages ALL
git add .   #stages new and modified, without deleted
git add -u  #stages modified and deleted, without new
```
