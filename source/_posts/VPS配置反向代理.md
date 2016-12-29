---
title: VPS配置反向代理
date: 2016-12-28 16:58:50
tags:
    [vps, 反向代理]
categories:
    vps
---


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
#### 参考
[利用Nginx反向代理GoogleWikipedia](利用 Nginx 反向代理 Google & Wikipedia)

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
移动端的域名设置好后，访问会提示证书有问题，可能是因为主机名为`m.wiki`，所以之前的签名无效（不确定）。之后将地址设为`mwiki.yourdomain.com`则可以登录，但是使用chrome打开网页时会提示不安全。
