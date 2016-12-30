title: Next配置
tags:
  - hexo
categories:
  - hexo
date: 2016-11-04 15:54:00
---
## Next主题安装配置

为了方便说明，下面将Hexo根目录的_config.yml文件称为**站点配置文件**，将Next主题文件夹下的_config.yml文件称为**主题配置文件**。

### 安装

定位到Hexo站点目录～/blog下，执行下列命令。之后可以使用`git pull`进行更新。

```
$ cd ～/blog
$ git clone https://github.com/iissnan/hexo-theme-next themes/next
```

### 配置

#### 生效Next主题

将**站点配置文件**中的`theme`字段进行更改

`theme: next`

切换主题后最好使用`hexo clean`清除一下Hexo缓存。

#### 中文设置

将**站点配置文件**中的`language`字段进行更改

`language: zh-Hans`


<!--more-->

## 在首页隐藏指定文章

**参考文章**
https://forwardkth.github.io/2016/05/08/next-theme-post-visibility/。

打开`hexo根目录/themes/next/layout/index.swig`文件。将`post_template.render(post, true)`相关字段修改为

![](http://ww1.sinaimg.cn/mw690/005XH4aygw1f9gj6j45buj309s04bdg6.jpg)

也就是添加一个条件，当`visible`字段不为`hide`时在主页显示，为实现功能需要在头部添加`visible`字段。


## 添加「标签」页面

### 新建页面

在Hexo根目录下，使用`hexo new page`新建一个页面，命名为`tags`：

```
$ hexo new page tags
```

### 设置页面类型

在新建页面目录下的`~/blog/source/tags/index.md`文件添加`type: "tags"`，修改后结果如下

```
---
title: tags
date: 2016-11-13 00:43:33
type: "tags"
---
```

### 修改菜单

在**主题配置文件**中的`menu:`中添加`tags: /tags`。


## 添加「分类」页面

### 新建页面

在Hexo根目录下，使用`hexo new page`新建一个页面，命名为`categories`：

```
$ hexo new page categories
```

### 设置页面类型

在新建页面目录下的`~/blog/source/tags/index.md`文件添加`type: "tags"`，修改后结果如下

```
---
title: tags
date: 2016-11-13 00:43:33
type: "categories"
---
```

### 修改菜单

在**主题配置文件**中的`menu:`中添加`categories: /categories`。


## 添加本地搜索
安装`hexo-generator-searchdb`，在Hexo根目录下执行；
```
$ npm install hexo-generator-searchdb --save
```

编辑站点配置文件，添加：
```
search:
  path: search.xml
  field: post
  format: html
  limit: 10000
```


## 参考

[Next官网](http://theme-next.iissnan.com/)。
