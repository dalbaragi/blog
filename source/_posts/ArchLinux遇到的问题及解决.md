---
title: ArchLinux遇到的问题及解决
date: 2016-11-10 18:06:31
tags:
  [archlinux,linux]
categories:
  [archlinux]
---

## 无法调整亮度

一次更新后键盘及XFCE界面都无法调节屏幕亮度。后发现是因为`xbacklight`只调节`/sys/class/backlight/intel_backlight`中的`brghtness`文件，但是真正起作用的是`/sys/class/backlight/acpi_video0/brghtness`文件。之后根据[xbacklight](https://wiki.archlinux.org/index.php/backlight#xbacklight)中的说明，如下建立修改了`/etc/X11/xorg.conf`文件，重启后可以正常改变亮度。

```
Section "Device"
    Identifier  "Card0"
    Driver      "intel"
    Option      "Backlight"  "acpi_video0"
EndSection
```

<!--more-->
