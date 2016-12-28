title: Hexo配置
author: Dalbaragi
tags:
  - hexo
categories:
  - hexo
date: 2016-11-13 00:10:00
---
## Hexo安装配置

### 安装环境

```
OS: Arch Linux Kernel: x86_64 Linux 4.8.4-1-ARCH nodejs: 6.9.1-1 npm: 3.10.9-1 git: 2.10.1-1
```

### 安装环境

安装Hexo

```
$ sudo npm install -g hexo-cli
```

安装过程中出现下面的警告，原因还不清楚。

```
npm WARN optional Skipping failed optional dependency /hexo-cli/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.15
```

<!--more-->

### 建站

Hexo安装好后，执行下列命令在指定文件夹中新建需要的文件，这里使用的目录是`～/blog`。

```
$ hexo init ~/blog
$ cd ~/blog
$ npm install
```

执行`$ hexo init ~/blog`后出现下列警告，原因还不清楚。

```
执行$ hexo init ~/blog后出现下列警告，原因还不清楚。
```

执行`$ npm install`后出现下列警告，原因还不清楚。

```
npm WARN optional Skipping failed optional dependency /chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.15
```

### 文件夹说明

**_config.yml** 网站的配置信息，您可以在此配置大部分的参数。

**package.json** 应用程序的信息。EJS, Stylus 和 Markdown renderer 已默认安装，可以自由移除。

**scaffolds **模版文件夹，新建文章时，Hexo 会根据 scaffold 来建立文件。

**source** 资源文件夹是存放用户资源的地方。除 posts 文件夹之外，开头命名为 (下划线)的文件或文件夹和隐藏的文件将会被忽略。Markdown 和 HTML 文件会被解析并放到 public 文件夹，而其他文件会被拷贝过去。

**themes **主题文件夹，Hexo 会根据主题来生成静态页面。

## 部署到GitHub

### 建立仓库

在 GitHub 中新建一个仓库，名字必须为`GitHub用户名.github.io`。执行`hexo deploy`后等待10分钟左右，可在 **setting** 页面下的 **GitHub Pages** 标签中看到`Your site is published at https://dalbaragi.github.io`，之后则可通过此地址访问网页。

### 安装git功能

安装 `hexo-deployer-git`，在Hexo根目录 `～/blog` 下执行下列命令，`–save`参数可以将依赖写入 `package.json`文件中。

```
$ npm install hexo-deployer-git --save
```

执行命令后出现下列警告，原因暂不清楚。

```
npm WARN optional Skipping failed optional dependency /chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.15
```

### 修改配置文件

修改配置文件

```
deploy:
    type: git
    repository: https://github.com/dalbaragi/dalbaragi.github.io.git   (仓库地址)
    branch: master
```

### 配置SSH（免输入密码）

先生成`id_rsa`和`id_rsa.pub`文件，若没有`.ssh`文件夹直接建立即可。

```
$ cd ~/.ssh
$ git config --global user.name "用户名"
$ git config --global user.email "用户email地址"
$ ssh-keygen -t rsa -C "用户email地址"
(之后直接回车继续就可以)
```

复制`id_rsa.pub`文件中的全部内容，在setting页面下的SSH and GPG keys标签页中添加SSH key。

使用`$ ssh -T git@github.com`命令可检查设置是否成功，若出现`Hi dalbaragi! You've successfully authenticated, but GitHub does not provide shell access.`则表示成功。

将`_config.yml`中的`deploy:`字段下的`repository:`改为

```
repository: git@github.com:dalbaragi/dalbaragi.github.io.git
```

### 部署命令

```
$ hexo deploy
```

### 域名绑定

**前提：** 在阿里云购买了域名。 在 Hexo 根目录下的`source`文件夹中建立一个名为`CNAME`文件，文件中添加购买的域名，不包括加`http://`，并部署到GitHub。 在购买网址的域名解析页面中添加新的域名解析，记录类型选择`CNAME`，记录值填写`GitHub用户名.github.io`，即网址。

### 指令

#### 插件管理

安装插件

```
$ npm install 插件名 --save
```

卸载插件

```
$ npm uninstall 插件名
```

#### generate

生成。

```
$ hexo generate
或
$ hexo g
```

选项|	语法
------|------
生成后直接部署	-d |  或 --deploy
查看变更 |	-w 或 --watch

#### server

生成并启动服务器。

选项	| 语法
-----|-----
重设端口 |	-p, --port
只使用静态文件 |	-s, --static
启动日记记录，使用覆盖记录格式 | 	-l, --log

#### deploy

部署网站。

```
$ hexo deploy
或
$ hexo d
```


选项 |	语法
----|----
部署之前预先生成静态文件 |	-g, --generate

#### render

渲染文件。

```
$ hexo render [file2] ...
```

选项 |	语法
----|----
设置输出路径 |	-o, --output

#### clean

清除缓存文件 `db.json` 和已生成的静态文件 `public`。

```
$ hexo clean
```

### 自动刷新

使用下面的命令安装 Browsersync

```
$ sudo npm install -g browser-sync
```

进入 Hexo 根目录，使用下列命令安装 Hexo 插件

```
$ npm install hexo-browsersync --save
```

安装时产生了下列警告，原因暂时不清楚。

```
npm WARN deprecated tough-cookie@2.2.2: ReDoS vulnerability parsing Set-Cookie        https://nodesecurity.io/advisories/130

npm WARN optional Skipping failed optional dependency /browser-sync/chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.15
npm WARN optional Skipping failed optional dependency /chokidar/fsevents:
npm WARN notsup Not compatible with your operating system or architecture: fsevents@1.0.15
```

**不确定推测**

*使用Next主题时，安装hexo-browsersync后，文章超过一定行数可能会导致本地页面**http://localhost:4000**空白，若文章显示在主页，则主页也会空白。*


## 插件

### hexo-admin

[hexo-admin](https://github.com/jaredly/hexo-admin)是一个管理UI插件，可以通过本地网页管理编辑Hexo文件。

安装

```
npm install --save hexo-admin
```

启用hexo-admin

```
hexo server -d
open http://localhost:4000/admin/
```

[配置`Deploy`功能](https://github.com/jaredly/hexo-admin/issues/70)

在Hexo根目录下建立脚本文件

```
$ touch hexo-deploy.sh
$ chmod a+x hexo-deploy.sh
```

在`hexo-deploy.sh`中添加

```
#!/usr/bin/env sh
hexo g -d   #generate and deploy
```

在`_config.yml`文件中添加

```
admin:
  deployCommand: './hexo-deploy.sh'
```


## 参考

[Hexo官网](https://hexo.io/)
[Hexo常见问题解决方案](https://xuanwo.org/2014/08/14/hexo-usual-problem/)
