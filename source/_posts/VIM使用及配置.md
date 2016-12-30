---
title: VIM使用及配置
date: 2016-11-20 22:24:51
id: 1479651891
tags:
  vim
categories:
  vim
---


## 参考
### VIM配置为IDE(本文主要参考)：
https://github.com/yangyangwithgnu/use_vim_as_ide#0.1

### VIM基本使用
https://github.com/BillWang139967/Vim/blob/master/doc/vim.md
[VIM复制粘贴探秘](http://www.worldhello.net/2010/12/08/2190.html)

### 如何在vim保存时获得sudo权限
https://segmentfault.com/q/1010000000151086

## 使用及配置
### 配置文件
.vimrc是控制vim行为的配置文件，位于`~/.vimrc`,可设置vim窗口外观、显示字体、操作方式、快捷键、插件属性等。

可以设定前缀键`<leader>`，这里将前缀键设为`;`。
```
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
```

把vim（非插件）常用操作设定为快捷键，提升效率；
```
" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
```


