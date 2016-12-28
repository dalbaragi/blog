---
title: pacman源设置
date: 2016-11-25 22:54:26
tags:
    [archlinux, pacman]
categories:
    archlinux
---










## 出错
```
error: package: signature from "User <email@archlinux.org>" is invalid
error: failed to commit transaction (invalid or corrupted package (PGP signature))
Errors occured, no packages were upgraded.
```

解决办法，参考(https://my.oschina.net/sukai/blog/603638)


```
 rm -R  /etc/pacman.d/gnupg/      # 删除gnupg目录及其文件
 pacman-key --init
 pacman-key --populate archlinux
 pacman-key --populate archlinuxcn    # 启用了archlinux中文软件库的还要执行这个
```

## 设置镜像

[这里](https://www.archlinux.org/mirrorlist/)可以生成最新的镜像，之后将其拷贝至`/etc/pacman.d/mirrorlist`文件，执行`sudo pacman -Syyu`即可。
