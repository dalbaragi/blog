---
title: vps上建立ss服务器
date: 2016-12-27 09:24:30
tags:
    [ss, vps]
categories:
    [ss]
---

### 参考
[在VPS上搭建shadowsocks来科学上网](http://www.waynechu.cn/shadowsocks/2016/08/14/%E5%9C%A8VPS%E4%B8%8A%E6%90%AD%E5%BB%BAshadowsocks%E6%9D%A5%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91.html)

### 环境
VPS系统为debian-8.0-x86_64-minimal

### 安装步骤
#### 安装pip包管理工具
```
apt-get install python-pip
pip install shadowsocks
```
<!--more-->

#### 配置shadowsocks服务
新建配置文件
```
vim /etc/shadowsocks.json
```

编辑为如下内容
```
{
    "server":"vps的IP地址",
    "server_port":9898,   #自定义shadowsocks端口号
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"password",  #自定义密码
    "timeout":300,
    "method":"aes-256-cfb"  #加密方式
}
```

#### 启动shadowsocks服务
```
ssserver -c /etc/shadowsocks.json -d start
```
