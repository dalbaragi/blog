---
title: vps搭建hexo
date: 2016-12-27 16:40:47
tags:
    [vps, hexo]
categories:
    [vps]
---

### 前提
参考{% post_link Hexo配置 Hexo配置 %}

### 环境
VPS系统：debian-8.0-x86_64-minimal
以下命令全部以root身份执行。

### 安装Git和NodeJS
```
$ apt-get install git
$ curl -sL https://deb.nodesource.com/setup_6.x | bash -
$ apt-get install nodejs
```
安装Node.js，参考[这里](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)。

<!--more-->

### Git相关配置
#### 新建Git用户并添加sudo权限
```
$ adduser git
$ chmod 740 /etc/sudoers
$ vim /etc/sudoers
```
修改如下字段
```
## Allow root to run any commands anywhere
root    ALL=(ALL)     ALL
git   ALL=(ALL)     ALL
```
保存退出后修改回文件权限
```
chmod 440 /etc/sudoers
```
#### 创建Git仓库,并配置ssh登录
```
$ su git
$ cd ~
$ mkdir .ssh & cd .ssh
$ touch authorized_keys
$ vim authorized_keys  #将本地的~/.ssh/id_rsa.pub文件中的key复制进来
$ cd ~
$ mkdir hexo.git && cd hexo.git
$ git init --bare
```
若通过ssh能够登录到vps，则表示设置成功。
#### 创建网站目录
```
$ cd /var/www
$ mkdir hexo
$ chown git:git -R /var/www/hexo
```
#### 配置Git hooks
```
$ su git
$ cd /home/git/hexo.git/hooks
$ vim post-receive
```
添加文件内容。
```
#!/bin/bash
GIT_REPO=/home/git/hexo.git #git仓库
TMP_GIT_CLONE=/tmp/hexo
PUBLIC_WWW=/var/www/hexo #网站目录
rm -rf ${TMP_GIT_CLONE}
git clone $GIT_REPO $TMP_GIT_CLONE
rm -rf ${PUBLIC_WWW}/*
cp -rf ${TMP_GIT_CLONE}/* ${PUBLIC_WWW}
```
之后富裕执行权限。
```
$ chmod +x post-receive
```
### 安装配置nginx
#### 安装
```
$ apt-get install nginx
```
#### 配置
```
$ vim /etc/nginx/conf.d/hexo.conf
```
添加配置内容。
```
server {
    listen         80 ;
    root /var/www/hexo;                             //这里可以改成你的网站目录地址，我将网站放在/var/www/hexo
    server_name example.com www.example.com;        //这里输入你的域名或IP地址
    access_log  /var/log/nginx/hexo_access.log;
    error_log   /var/log/nginx/hexo_error.log;
    location ~* ^.+\.(ico|gif|jpg|jpeg|png)$ {
            root /var/www/hexo;
            access_log   off;
            expires      1d;
    }
    location ~* ^.+\.(css|js|txt|xml|swf|wav)$ {
        root /var/www/hexo;
        access_log   off;
        expires      10m;
    }
    location / {
        root /var/www/hexo;                         //这里可以改成你的网站目录地址，我将网站放在/var/www/hexo
        if (-f $request_filename) {
            rewrite ^/(.*)$  /$1 break;
        }
    }
}
```
### 配置本机
打开Hexo目录下的`_config.yml`文件，修改下列字段。
```
deploy:
    type: git
    repo: git@VPS的ip地址或域名:git仓库地址
    branch: master
```
### 配置ssh端口
当vps的ssh修改为其他端口号，需要进行下列操作。
修改`~/.ssh/config`文件。
```
host example
hostname example.com
port 1234
```
修改项目文件夹下的`.git/config`文件。
```
url = git@VPS的ip地址或域名:git仓库地址
```


### 参考
[在VPS上搭建hexo博客，利用git更新](http://tiktoking.github.io/2016/01/26/hexo/)
[git配置ssh非默认端口](http://xu1347.blog.163.com/blog/static/161378861201171425838327/)
