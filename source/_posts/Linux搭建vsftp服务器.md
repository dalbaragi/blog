---
title: Linux搭建vsftpd服务器
date: 2017-01-07 11:19:53
tags:
    [linux, ftp, vsftpd]
categories:
    [ftp]
---

### 参考
[UBUNTU 16.04 FTP服务器（VSFTPD）的安装和配置](http://www.weihailan.com/article/374)

### 环境
ArchLinux

### 介绍
**vsftpd**的全称为Very Secure FTP Daemon，是一个轻量级、稳定切安全的FTP服务器

### 安装
```
$ sudo pacman -S vsftpd
```

<!--more-->

### 启动vsftpd服务
```
$ sudo systemctl start vsftpd
```

### 新建ftp用户
为vsftpd新建一个本地用户，用户名设为vsftpd。
```
$ sudo useradd vsftpd -m -d /home/vsftpd -s /bin/zsh
```

为此用户设定密码
```
$ sudo passwd vsftpd
```

### 修改配置文件
vsftpd的配置文件为`/etc/vsftpd.conf`，这里配置为允许本地用户登录，允许上传文件，修改配置文件中的下列字段，去掉其注释
```
# Uncomment this to allow local users to log in.
local_enable=YES

# Uncomment this to enable any form of FTP write command.
write_enable=YES
```

此外，设置只允许特定用户登录，需要在此配置文件中添加
```
#Limiting user login
#Only want to allow certain users to login
userlist_deny=NO
userlist_enable=YES
userlist_file=/etc/vsftpd.user_list
```

其中，`/etc/vsftpd.user_list`为配置文件路径，需要自己建立。之后在`/etc/vsftpd.user_list`中添加允许的用户名即可。

### 重启vsftpd服务
```
$ sudo systemctl restart vsftpd
```
