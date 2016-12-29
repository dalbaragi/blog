---
title: VPS配置反向代理
date: 2016-12-28 16:58:50
tags:
    [vps, 反向代理]
categories:
    vps
---

### 环境
debian-8.0-x86_64-minimal

### 获取SSL证书
使用[Let's Encrypt](https://letsencrypt.org/)的证书，它提供了一种容易的方法来获取免费 SSL 证书，并且它的证书为绝大多数浏览器所信任。
首先安装需要的工具。
```
$ apt-get -y install git bc
``

获取Let's Encrypt客户端到`/opt/letsencrypt`目录中。
```
$ git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
```

关闭VPS中占用80端口的进程（如Nginx）。
```
$ service nginx stop
```

<!--more-->

可以通过下面指令查看80端口是否被占用，若无输出则表示没有被占用。
```
$ netstat -na | grep ':80.*LISTEN'
```

进入`/opt/letsencrypt`目录，执行下面命令。如果是第一次使用，软件会自动安装依赖。
```
$ ./letsencrypt-auto certonly --standalone
```
程序开始运行后，首先输入邮箱，便于接收通知和恢复忘记的key；之后选择同意Let's Encrypt的条款；最后输入域名，多个域名可以使用空格隔开。

证书获取成功后：
- 证书文件在`/etc/letsencrypt/live/域名/fullchain.pem`
- KEY文件在`/etc/letsencrypt/live/域名/privkey.pem` 



### 谷歌反向代理
#### 获取谷歌IP
Debian安装dig和nslookup
```
$ apt-get install dnsutils
```


```
$ dig www.google.com @8.8.8.8 +short
172.217.4.132
```

**或**

通过[OpenDNS](https://github.com/cuber/ngx_http_google_filter_module/blob/master/README.zh-CN.md)网站。

#### 参考
[Nginx Google 扩展](https://github.com/cuber/ngx_http_google_filter_module/blob/master/README.zh-CN.md)

### 其他

配置实例
- wiki.yourdomain.com 用于反代桌面版 Wikipedia
- m.wiki.yourdomain.com 用于反代移动版 Wikipedia

```
server {
  server_name wiki.yourdomain.com;#替换成你自己的域名
  listen 80;
  rewrite ^/(.*) https://$server_name/$1 permanent;
}
server {
  server_name wiki.yourdomain.com;#替换成你自己的域名
  listen 443;
  ssl on;
  ssl_certificate /etc/letsencrypt/live/google.yourdomain.com/fullchain.pem;#替换成你的证书路径
  ssl_certificate_key /etc/letsencrypt/live/google.yourdomain.com/privkey.pem;#替换成你的私钥路径
  location / {
    proxy_pass https://zh.wikipedia.org; proxy_buffering off;
    proxy_cookie_domain zh.wikipedia.org wiki.yourdomain.com;#替换成你自己的域名
    proxy_redirect https://zh.wikipedia.org/ /;
    proxy_redirect https://zh.m.wikipedia.org/ https://m.wiki.yourdomain.com/;#替换成你自己的域名
    proxy_set_header X-Real_IP $remote_addr;
    proxy_set_header User-Agent $http_user_agent;
    proxy_set_header Accept-Encoding '';
    proxy_set_header referer "https://zh.wikipedia.org$request_uri";
  }
  location https://zh.m.wikipedia.org/{
    rewrite ^/(.*) https://m.wiki.yourdomain.com/$1 permanent;#替换成你自己的域名
  }
}
server {
  server_name m.wiki.yourdomain.com;#替换成你自己的域名
  listen 80;
  rewrite ^/(.*) https://$server_name/$1 permanent;
}
server {
  server_name m.wiki.yourdomain.com;#替换成你自己的域名
  listen 443;
  ssl on;
  ssl_certificate /etc/letsencrypt/live/google.yourdomain.com/fullchain.pem;#替换成你的证书路径
  ssl_certificate_key /etc/letsencrypt/live/google.yourdomain.com/privkey.pem;#替换成你的私钥路径
  location / {
    proxy_pass https://zh.m.wikipedia.org;
    proxy_buffering off;
    proxy_redirect https://zh.m.wikipedia.org/ /;
    proxy_cookie_domain zh.m.wikipedia.org m.wiki.yourdomain.com;#替换成你自己的域名
    proxy_set_header X-Real_IP $remote_addr;
    proxy_set_header User-Agent $http_user_agent;
    proxy_set_header Accept-Encoding '';
    proxy_set_header referer "https://zh.m.wikipedia.org$request_uri";
  }
}
server {
  server_name up.wiki.yourdomain.com;#替换成你自己的域名
  listen 80;
  rewrite ^/(.*) https://$server_name/$1 permanent;
}
server {
  server_name up.wiki.yourdomain.com;#替换成你自己的域名
  listen 443;
  ssl on;
  ssl_certificate /etc/letsencrypt/live/google.yourdomain.com/fullchain.pem;#替换成你的证书路径
  ssl_certificate_key /etc/letsencrypt/live/google.yourdomain.com/privkey.pem;#替换成你的私钥路径
  location / {
    proxy_pass https://upload.wikimedia.org;
    proxy_cookie_domain upload.wikimedia.org up.wiki.yourdomain.com;#替换成你自己的域名
    proxy_buffering off;
    proxy_set_header X-Real_IP $remote_addr;
    proxy_set_header User-Agent $http_user_agent;
    proxy_set_header referer "https://upload.wikimedia.org$request_uri";
  }
}

```

#### 遇到的问题
每个域名都要申请ssl证书，否则可能无法打开网页，或打开网页时显示警告。


#### 参考
[利用Nginx反向代理GoogleWikipedia](利用 Nginx 反向代理 Google & Wikipedia)

