---
title: ArchLinux备份
tags:
    [arhclinux]
categories:
    [archlinux]
---

参考[Archlinux 备份策略](http://yaoyongpeng.me/2015/07/27/linux-backup/)

备份工具选择[rsync](https://rsync.samba.org/)，支持字节级的增量备份。

## 备份
创建备份目录`~/backup`，并建立`~/backup/exclude.list`文件，通过此文件可以排除不需要备份的内容
```
$ sudo mkdir ~/backup
$ sudo touch ~/backup/exclude.list
```

编辑`exclude.list`文件，添加不需要备份的内容
```
/proc/*
/dev/*
/sys/*
/tmp/*
/mnt/*
/media/*
/run/*
/var/lock/*
/var/run/*
/var/cache/pacman/pkg/*
/lost+found
~/backup/*
/swapfile
~/.local/share/Trash
```

对于将备份存储在本机系统的情况，需要排除存储路径本身（比如上文中`~/bakcup/*`这一行），否则会引发无限循环。

之后通过下面命令备份系统
```
$ rsync -avXAP --delete --exclude-from=/home/用户名/backup/exclude.list / ~/backup
```

## 还原
```
# rsync -avXAP SRC / #SRC是备份的目录
```

具体参考文章开头给出的参考文章。
