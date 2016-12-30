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
#### 配置文件概述
.vimrc是控制vim行为的配置文件，位于`~/.vimrc`,可设置vim窗口外观、显示字体、操作方式、快捷键、插件属性等。

<!--more-->

#### 前缀键
可以设定前缀键`<leader>`，这里将前缀键设为`;`。
```
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
```

#### 部分快捷键定义（非插件）
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

#### vim 快捷键映射和模式
**map递归映射**
如果键b映射为键a，然后键c映射为键b，那么当按键c时会产生按键a的效果。

**noremap非递归映射**
不会产生递归映射一样的效果。

**不同模式下快捷键映射**
在map与noremap前分别可以加`n, v, x, s, o, i, l, c`以及`map!`和`noremap!`。
- `n`表示在普通模式下生效，如`nmap, nnoremap`
- `v`表示在可视模式下生效，如`vmap, vnoremap`
- `s`表示在选择模式下生效，如`smap, snoremap`
- `i`表示在插入模式下生效，如`imap, inoremap`
- `c`表示在命令行模式下生效，如`cmap, cnoremap`
`map`和`noremap`不加任何前缀的话，是mapmode-nvo。会在普通模式，可视模式，操作符等待模式下生效。

#### 配置变更立即生效
一般情况下，要让`.vimrc`内容生效，需要保存后重启`vim`，增加下面设置后可以实现保存`.vimrc`时自动重启加载。
```
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
```

#### 其他，搜索、vim 命令补全等设置
```
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
```

### 插件管理
默认情况下，vim的插件在`.vim`目录中的`doc/`与`plugin/`下，但是这样将会使插件管理比较困难，所以这里使用[vundle](https://github.com/VundleVim/Vundle.vim)。vundle会接管`.vim`目录下的所有原声目录，所以需要先清空目录，在通过下面的命令安装vundle，其中每一项对应一个插件。
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

之后在`.vimrc`中增加相关配置
```
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on
```

vundle支持源码托管在[github](https://github.com/) 的插件，同时[vim官网](http://www.vim.org/)上的所有插件均在[vim-scripts](https://github.com/vim-scripts/)有镜像，所以基本所有插件均能使用vundle进行管理。例如，`ctrlsf.vim`在`.vimrc`中配置信息为`dyng/ctrlsf.vim`，vundle很容易构造出真是下载地址(https://github.com/dyng/ctrlsf.vim.git)，然后借助git工具进行下载及安装。
此后，安装新的插件时，先遭到其在github.com的地址，再将配置信息加入`.vimrc`中的`call vundle#begin()`和`call vundle#end()`之间，最后进入vim执行
```
:PluginInstall
```

卸载插件时，现在`.vimrc`中删除对应的插件信息，然后在vim中执行
```
:PluginClean
```

插件更新频率较高，差不多一个月就要看看哪些插件有推出新的版本，新的版本。批量更新需要在vim中执行
```
:PluginUpdate
```

还需注意的是，通过vundle管理插件之后，切勿通过发行套件自带的管理工具安装任何插件，不然`.vim`又要混乱了。

### 美化
#### 主题
`.vimrc`中
```
" 配色方案
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd
```

#### 营造专注氛围
`.vimrc`中
```
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
```

#### 添加辅助信息
`.vimrc`中
```
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
```

#### 自动换行
每行超过n 个字的时候vim自动加上换行符
```
:set textwidth=n （n代表数字）
```

设置自动换行
```
:set wrap
```

不自动换行
```
:set nowrap
```

#### 其他美化
设置字体，自提名存在空壳，使用转义符`\`进行转义，最后设置字体大小。
```
" 设置 gvim 显示字体
set guifont=Dejavu\ Sans\ Mono\ 9
```

通过插件[Powerline](https://github.com/Lokaltog/vim-powerline)美化状态栏，在`.vimrc`中添加
```
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
```

为了在终端中显示出vim的主题，需要在`.bashrc`中加入
```
export TERM="screen-256color"
```

因为本人使用的是zsh，所以需要在`.zshrc`中加入
```
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
  else
    export TERM='xterm-color'
fi
```

### 代码分析
#### 语法高亮
启动vim自带的语法高亮，在`.vimrc`中添加
```
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
```

vim对于C++语法高亮支持地不够好（尤其是C++11/14新增元素），必须借由插件[vimvim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)进行增强。
vim-cpp-enhanced-highlight 主要通过`.vim/bundle/vim-cpp-enhanced-highlight/after/syntax/cpp.vim`控制高亮关键字及规则，所以发现某个STL容器类型未高亮，那么将该类型追加进`cpp.vim`即可。如，`initializer_list`默认并不会高亮，需要添加
```
syntax keyword cppSTLtype initializer_list
```

#### 代码缩进
设置缩进
```
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
```

vim可以使用`=`对代码进行自动缩进，使用`<`或`>`进行手动缩进。

通过安装[Indent Guides](https://github.com/nathanaelkane/vim-indent-guide)插件，可将相同缩进的代码关联起来，之后加入如下配置
```
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
```

#### 代码折叠
vim自身支持多种折叠，包括
- 手动折叠(manual)
- 给予缩进进行折叠(indent)
- 基于语法进行折叠(syntax)
- 未更改文本构成折叠(diff)

其中，indent和syntax比较适合编程，可根据需要进行选择。
```
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
```

通过下列命令控制
- `za`，打开或关闭当前折叠
- `zM`，关闭所有折叠
- `zR`，打开所有折叠

#### 接口与实现快速切换
通过安装[vim-fswitch](https://github.com/derekwyatt/vim-fswitch)，可以实现文件和接口文件之间进行切换。
```
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
```

通过`;sw`进行操作。

#### 代码收藏
通过在指定代码行键入`mm`，可以对此行进行收藏。但是vim默认不显示收藏的代码行，所以需要安装书签可视化插件[vim-signature](https://github.com/kshenoy/vim-signature)。此插件通过在书签所在行前添加字符对书签进行显示，这要求vim具备signs特性，可在vim命令模式下输入`:echo has('signs')`确认，若显示1则表示具备该特性。
vim书签分为独立书签和分类书签。
- 独立书签：书签名只能由字母（a-zA-Z）组成，长度最多不超过2个字母，并且，同个文件中，不同独立书签名中不能含有相同字母，比如，a和bD可以同时出现在同个文件在，而Fc和c则不行。
- 分类书签：书签名只能由可打印特殊字符（!@#$%^&*()）组成，长度只能有1个字符，同个文件中，你可以把不同行设置成同名书签，这样，这些行在逻辑上就归类成相同类型的书签了。

两种形式的书签完全分布在各自不同的空间中，所以对这两类书签的操作是不同的，比如，遍历时只能在独立书签中遍历，或只能在分类书签中遍历。
对于独立书签，重新打开文件时，上次设置的独立书签仍然有效，而分类书签则不可以。
vim-signature快捷键设定：
```
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }
```

常用操作：
- `mx`：书签设定，设定/取消当前行名为 x 的标签
- `m,`：自动设定下一个可用书签名
- `mda`：删除当前文件中的所有独立书签
- `m?`：书签罗列，罗列出当前文件中所有书签，选中后回车可直接跳转
- `mn`：书签跳转，按行号前后顺序跳转至下个独立书签
- `mp`：按行号前后顺序跳转至前一个独立书签

vim-signature还存在一些不足，就是无法再不同文件的书签间进行跳转。

此外，可以通过[BOOKMARKS--Mark-and-Highlight-Full-Lines](https://github.com/vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines)插件使书签行高亮。

#### 标识符列表
[tagbar](https://github.com/majutsushi/tagbar)是一款基于标签的标识符列表插件，它自动周期性调用ctags获取标签信息（仅保留在内存），安装之后添加如下配置。
```
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
```

输入`<leader>ilt`后就可以在左侧的tagbar窗口中看到标签列表。
tagbar有以下特点：
- 按作用域归类不同标签。按名字空间n_foo、类Foo进行归类，在内部有声明、有定义
- 显示标签类型，名字空间、类、函数等
- 显示完整函数原型
- 图形化显示公有成员（+）、私有成员（-）、保护成员（#）

此外
- 在标识符列表中选中对应标识符后回车即可跳至源码中对应位置
- 在源码中停顿几秒，tagbar将高亮对应标识符
- 每次保存文件时或者切换到不同代码文件时tagbar自动调用ctags更是标签数据库
- tagbar有两种排序方式，一是按标签名字母先后顺序、一是按标签在源码中出现的先后顺序，在`.vimrc`中我配置选用后者，键入s切换不同不同排序方式

#### 生命/定义跳转
                        



### 代码开发
#### 智能补全
YCM ArchLinux设置
首先下载并安装clang
```
$ pacman -S clang (编译会得到/usr/lib/libclang.so)
```
建立一个文件夹
```

$ mkdir ycm_build
$ cd ycm_build
```

编译
```
$ cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=/usr/lib/libclang.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
$ cmake --build . --target ycm_core
```







