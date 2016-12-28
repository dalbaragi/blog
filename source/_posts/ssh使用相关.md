---
title: ssh使用相关
date: 2016-12-27 08:44:45
tags:
    [ssh]
categories:
    [ssh]
---
### 参考
[SSH原理与运用（一）：远程登录](http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html)
[如何的退出无响应的 SSH 连接](http://www.vpsee.com/2013/08/how-to-kill-an-unresponsive-ssh-connection/)
[解决SSH自动断线，无响应的问题](https://www.coder4.com/archives/3751)

### 建立ssh链接
```
$ ssh -p 2222 user@host
```
端口号、用户名、主机地址根据需要自行填写。

<!--more-->

### 公钥登录
在客户机生成一个自己的公钥,一路回车即可。
```
$ ssh-keygen
```

将公钥传送到远程主机host上。
```
$ ssh-copy-id user@host
```

之后即可不用输入密码登录ssh
```
$ ssh user@host
```

### 更换ssh端口号
可以将默认的ssh端口号22更换为不知名端口号，防止被暴力破解。
首先登录ssh，修改服务器中的ssh配置文件。
```
$ vim /etc/ssh/sshd_config
```
修改`Port 22`为自定义的端口号，重启ssh服务。
```
$ service ssh restart
```
再次登录ssh时，需要加上端口参数。
```
$ssh user@host -p portnum
```

### 退出无响应的ssh链接
在没退出的ssh会话中用`~.`断开连接。

### 解决SSH自动断线，无响应问题
在服务器端，修改ssh配置文件，使其每隔一定时间向客户端发送一次心跳。

首先打开配置文件。
```
$ vim /etc/ssh/sshd_config
```

在其中添加
```
ClientAliveInterval 30
ClientAliveCountMax 6
```
表示没30秒发送一次心跳，在66次心跳结束之后还无响应则断开链连接。
