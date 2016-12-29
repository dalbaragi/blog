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
