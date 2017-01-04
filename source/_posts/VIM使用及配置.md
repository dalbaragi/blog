---
title: VIM使用及配置
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

#### 声明/定义跳转
需要安装[YCM插件与C++编译器clang](#ycm)，之后在`.vimrc`中添加
```
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
```

#### 内容查找
vim支持正则表达式，通过[grep.vim](https://github.com/yegappan/grep)与[ack.vim](https://github.com/mileszs/ack.vim)这两个插件可以在vim中使用高度整合的grep或ack两个外部命令，但是查询时不会首先是上下文。

通过[ctrlsf.vim](https://github.com/dyng/ctrlsf.vim)可以显示上下文。首先需要安装ack，之后使光标定位在想查找的词上，之后在命令模式下键入
```
:CtrlSF
```

在`.vimrc`中定义了快捷键
```
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
```

通过回车可以选择查找的内容，按`q`可以直接退出。

#### 内容替换
##### 快捷替换
通过crtlsf进行查找时，在左侧窗口中可以直接进行编辑操作。通过[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)插件可以选择多个相同的词i，设置下列快捷键
```
let g:multi_cursor_next_key='<S-x>'
let g:multi_cursor_skip_key='<S-k>' 
```

##### 精确替换
vim的替换命令：
```
:[range]s/{pattern}/{string}/[flags]
```

[range]表示检索范围，省略时表示当前行。

几种相关用法：
- `1,20`表示从第1行到20行
- `%`表示整个文件，与`1,$`相同
- `.,$`表示从当前行到文件尾

[flags]表示操作类型，省略时仅对每行第一个匹配串进行替换。

几种相关用法：
- `g`表示全局替换
- `c`表示进行确认
- `p`表示替代记过逐行显示（`ctrl+L`恢复屏幕）
如果字符串中出现特殊字符用`\`进行转义。

{pattern} 用于指定匹配模式。如果需要整词匹配，则该字段应由 < 和 > 修饰待替换字符串（如，<iFoo>）；无须整词匹配则不用修饰，直接给定该字符串即可。

下面定义快捷键
```
 " 替换函数。参数说明：
 " confirm：是否替换前逐一确认
 " wholeword：是否整词匹配
 " replace：被替换字符串
 function! Replace(confirm, wholeword, replace)
     wa
     let flag = ''
     if a:confirm
         let flag .= 'gec'
     else
         let flag .= 'ge'
     endif
     let search = ''
     if a:wholeword
         let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
     else
         let search .= expand('<cword>')
     endif
     let replace = escape(a:replace, '/\&~')
     execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
 endfunction
 " 不确认、非整词
 nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
 " 不确认、整词
 nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
 " 确认、非整词
 nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
 " 确认、整词
 nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
 nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
```

### 代码开发
#### 快速开关注释
通过[NERD Commenter](https://github.com/scrooloose/nerdcommenter)可以进行设置，添加配置
```
<leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /、/；
<leader>cu，取消选中文本块的注释。
```

此外，通过[DrawIt!](https://github.com/vim-scripts/DrawIt)插件可以使用方向键绘制出ASCLL art风格的注释。通过`:Distart`开始绘制，用方向键绘制线条，空格键绘制或擦除字符，`:Distop`停止绘制。

#### 模板补全
使用[UltiSnips](https://github.com/SirVer/ultisnips)可以自动进行模板补全。使用时，先键入模板名（如if），接着键入补全快捷键（默认tab），然后UltiSnips根据键入的模板名在代码模板文件中搜索匹配的“模板名-模板”，找到对应模板后，将模板在光标当前位置展开。

UltiSnips 有一套自己的代码模板语法规则，类似：
```
snippet if "if statement" i
if (${1:/* condition */}) { 
    ${2:TODO} 
} 
endsnippet
```

其中，`snippet`和`endsnippet`用于表示模板的开始和结束；`if`是模板名；`if statement`是模板描述，你可以把多个模板的模板名定义成一样（如，`if () {}`和`if () {} else {}`两模板都定义成相同模板名`if`），在模板描述中加以区分（如，分别对应`if statement`和`if-else statement`），这样，在 YCM（重量级智能补全插件） 的补全列表中可以根据模板描述区分选项不同模板；`i`是模板控制参数，用于控制模板补全行为，具体参见“快速编辑结对符”一节；`${1}、${2}`是`<tab>`跳转的先后顺序。

UltiSnips并未自带预定义的代码模板，可以从(https://github.com/honza/vim-snippets)获取各类语言的代码模板，也可以重写一套符合自己编码风格的模板。此外，需要在`.vimrc`中设定该模板所在的目录名。模板目录名不能取为snippets，这是UltiSnips 内部保留关键字，且目录一定要是`~/.vim/bundle/`下的子目录，也就是VIM运行时的目录。

`cpp.snippets`内容如下：
```
#================================= 
#预处理 
#================================= 
# #include "..." 
snippet INC 
#include "${1:TODO}"${2} 
endsnippet 
# #include <...> 
snippet inc 
#include <${1:TODO}>${2} 
endsnippet 
#================================= 
#结构语句 
#================================= 
# if 
snippet if 
if (${1:/* condition */}) { 
    ${2:TODO} 
} 
endsnippet 
# else if 
snippet ei 
else if (${1:/* condition */}) { 
    ${2:TODO} 
} 
endsnippet 
# else 
snippet el 
else { 
    ${1:TODO} 
} 
endsnippet 
# return 
snippet re 
return(${1:/* condition */}); 
endsnippet 
# Do While Loop 
snippet do 
do { 
    ${2:TODO} 
} while (${1:/* condition */}); 
endsnippet 
# While Loop 
snippet wh 
while (${1:/* condition */}) { 
    ${2:TODO} 
} 
endsnippet 
# switch 
snippet sw 
switch (${1:/* condition */}) { 
    case ${2:c}: { 
    } 
    break; 

    default: { 
    } 
    break; 
} 
endsnippet 
# 通过迭代器遍历容器（可读写） 
snippet for 
for (auto ${2:iter} = ${1:c}.begin(); ${3:$2} != $1.end(); ${4:++iter}) {
    ${5:TODO} 
} 
endsnippet 
# 通过迭代器遍历容器（只读） 
snippet cfor 
for (auto ${2:citer} = ${1:c}.cbegin(); ${3:$2} != $1.cend(); ${4:++citer}) { 
    ${5:TODO} 
} 
endsnippet 
# 通过下标遍历容器 
snippet For 
for (decltype($1.size()) ${2:i} = 0; $2 != ${1}.size(); ${3:++}$2) { 
    ${4:TODO} 
} 
endsnippet 
# C++11风格for循环遍历（可读写） 
snippet F 
for (auto& e : ${1:c}) { 
} 
endsnippet 
# C++11风格for循环遍历（只读） 
snippet CF 
for (const auto& e : ${1:c}) { 
} 
endsnippet 
# For Loop 
snippet FOR 
for (unsigned ${2:i} = 0; $2 < ${1:count}; ${3:++}$2) { 
    ${4:TODO} 
} 
endsnippet 
# try-catch 
snippet try 
try { 
} catch (${1:/* condition */}) { 
} 
endsnippet 
snippet ca 
catch (${1:/* condition */}) { 
} 
endsnippet 
snippet throw 
th (${1:/* condition */}); 
endsnippet 
#================================= 
#容器 
#================================= 
# std::vector 
snippet vec 
vector<${1:char}>   v${2}; 
endsnippet 
# std::list 
snippet lst 
list<${1:char}> l${2}; 
endsnippet 
# std::set 
snippet set 
set<${1:key}>   s${2}; 
endsnippet 
# std::map 
snippet map 
map<${1:key}, ${2:value}>   m${3}; 
endsnippet 
#================================= 
#语言扩展 
#================================= 
# Class 
snippet cl 
class ${1:`Filename('$1_t', 'name')`} 
{ 
    public: 
        $1 (); 
        virtual ~$1 (); 

    private: 
}; 
endsnippet 
#================================= 
#结对符 
#================================= 
 # 括号 bracket 
snippet b "bracket" i 
(${1})${2} 
endsnippet 
# 方括号 square bracket，设定为 st 而非 sb，避免与 b 冲突
snippet st "square bracket" i 
[${1}]${2} 
endsnippet 
# 大括号 brace 
snippet br "brace" i 
{ 
    ${1} 
}${2} 
endsnippet 
# 单引号 single quote，设定为 se 而非 sq，避免与 q 冲突
snippet se "single quote" I
'${1}'${2}
endsnippet
# 双引号 quote
snippet q "quote" I
"${1}"${2}
endsnippet
# 指针符号 arrow 
snippet ar "arrow" i 
->${1} 
endsnippet 
# dot 
snippet d "dot" i 
.${1} 
endsnippet 
# 作用域 scope 
snippet s "scope" i 
::${1} 
endsnippet
```

UltiSnips 模板补全快捷键是`<tab>`，与后面介绍的YCM快捷键有冲突，所有须在`.vimrc`中重新设定：
```
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
```

#### 自动添加结对符
使用[delimitMate](https://github.com/Raimondi/delimitMate)插件能够实现自动添加结对符，此插件不需要进行额外配置。

#### 选中结对符内容
通过诸如`vi[`的命令可以选中当前结对符`[]`内的所有文本，这虽谈不上麻烦，但每次都得去看下是`]`、`)`、`>`还是`}`，总是有点别扭。通过[wildfire.vim](https://github.com/gcmt/wildfire.vim)插件可以选中光标所在区域最近的一层结对符内的文本，如果没有结对符，则选择最近的一个段落。添加如下配置
```
" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <leader><SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]
```

这样，在VIM的命令模式下，一次空格选中最近一层结对符内的文本，两次则选中近两层内的文本，三次三层，依此类推；或者键入`3space`，直接选中三层内的文本；若要取消，键入`shift-space`即可。另外，结对符类型也可以在`wildfire_objects`变量中指定。


<span id="ycm"></span>
#### 智能补全
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)(YCM)，一个随键而全的、支持模糊搜索的、高速补全的插件，太棒了！YCM 由 google 公司搜索项目组的软件工程师 Strahinja Val Markovic 所开发，YCM 后端调用 libclang（以获取 AST，当然还有其他语言的语义分析库，我不关注）、前端由 C++ 开发（以提升补全效率）、外层由 python 封装（以成为 vim 插件），它可能是我见过安装最复杂的 vim 插件了。有了 YCM，基本上 clang_complete、AutoComplPop、Supertab、neocomplcache、UltiSnips、 Syntastic 可以再见了。

[ArchLinux安装YouCompleteMe](https://edmondburnett.com/post/youcompleteme-archlinux)步骤如下
安装clang
```
$ sudo pacman -Sy clang
```

在VIM中安装YCM，在.vimrc中添加
```
Plugin 'valloric/YouCompleteMe'
```

VIM中执行
```
:PluginUpdate
```

执行YCM安装脚本，使其使用clang
```
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install --clang-completer --system-libclang
```

YCM需要在配置文件中进行配置，插件的默认配置文件为`./.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py`。YCM运行时会依次在项目目录及其父目录中查找，若找不到则会在.vimrc中指定的目录中搜索配置文件。

不同工程只需调整`.ycm_extra_conf.py`文件的`flags`部分，用于YCM调用libclang时指定的参数，通常与构建脚本保持一致（如`CMakeLists.txt`）。`flags`会产生两方面影响，分别是YCM的不全内容与代码静态分析插件syntastic的显示结果。

之后，还需要在`.vimrc`中增加如下配置信息
```
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1
```

YCM还有OmniCppComplete补全引擎，只要在当前代码中`#include`了该标识符所在头文件即可通过。OmniCppComplete补全无法使用YCM的随键而全的特性，需要手动进行补全，默认补全快捷键为`<C-x><C-o>`，这里设为`<leader>;`,添加相应配置
```
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
```

#### 库信息参考
首先安装Linux系统函数man，下载[压缩包](https://www.kernel.org/doc/man-pages/download.html)，解压后将`man1/`至`man8/`拷贝至`/usr/share/man/`，运行`$ man fork`确认是否安装成功。安装C++标准库man，先下载[压缩包](ftp://GCC.gnu.org/pub/GCC/libstdc++/doxygen/)，选择最新`libstdc++-api-X.X.X.man.tar.bz2`，解压后将`man3/`拷贝至`/usr/share/man/`，运行`$ man std::vector`确认是否安装成功；

vim 内置的 man.vim 插件可以查看已安装的 man，需在 .vimrc 中配置启动时自动加载该插件：
```
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>
```

并设定快捷键`<Leader>man`，将光标所在单词传递给`:Man`命令，不用再手工输入。

此外，C++标准库中所有man文件名均有`std::`前缀。所以使用时可以批量去掉`libstdc++-api-X.X.X.man/man3/`中的`std::`前缀，在该目录下执行
```
rename "std::" "" std::\* 
```

Linux的系统函数man可以提供函数使用范例，但是C++标准库还不可以，这些可以通过网络在线查找。下面是一些相关网站。
http://www.cplusplus.com/reference/
http://en.cppreference.com/w/Cppreference:Archives 
http://pubs.opengroup.org/onlinepubs/9699919799/functions/contents.html
http://man7.org/linux/man-pages/dir_all_alphabetic.html

### 工程管理
#### 工程文件浏览
通过[NERDtree](https://github.com/scrooloose/nerdtree)插件可以查看文件列表，安装好插件后在`.vimrc`中添加
```
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1"
```

常用操作:
- `回车`：打开选中文件
- `r`：刷新工程目录文件列表
- `I（大写）`：显示/隐藏隐藏文件
- `m`：出现创建/删除/剪切/拷贝操作列表 

#### 多文档编辑
>vim 的多文档编辑涉及三个概念：buffer、window、tab，这三个事物与我们常规理解意义大相径庭。vim 把加载进内存的文件叫做 buffer，buffer 不一定可见；若要 buffer 要可见，则必须通过 window 作为载体呈现；同个看面上的多个 window 组合成一个 tab。一句话，vim 的 buffer、window、tab 你可以对应理解成视角、布局、工作区。

通过[MiniBufExplorer](https://github.com/fholgado/minibufexpl.vim)插件，可以把所有buffer罗列出来，并可以显示多个buffer对应的window。

安装后添加如下配置
```
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>

" buffer 切换快捷键
map <Leader>bbn :MBEbn<cr>
map <Leader>bbp :MBEbp<cr> " <<
```

此外，可以通过选定buffer，对其进行下列操作
- 键入`d`：删除光标所在的buffer
- 键入`s`：将该buffer对应window与先前window上下排列
- 键入`v`：将该buffer对应window与先前window左右排列

#### 环境恢复
通过VIM自带的viminfo特性可以恢复书签，通过session特性可以恢复书签处的其他项，通过下列指令确定VIM是否支持这两个特性。
```
$ vim --version | grep viminfo
$ vim --version | grep mksession
```

保存/恢复环境步骤如下：
1. 保存所有文档
```
:wa
```
2. 借助viminfo和session保存当前环境
```
:mksession! my.vim
:wviminfo! my.viminfo
```
3. 退出VIM
```
:qa
```
4. 恢复环境，进入 vim 后执行
```
:source my.vim
:rviminfo my.viminfo
```

具体保存的内容可由，sessionoptions指定，前面几步也可以设定快捷键。此外，sessionoptions无法包含undo历史，需要先手工创建存放undo历史的目录，在通过开启undofile进行单独设置，开启后，每次写文件时会自动保存undo历史，下载加载文件时自动恢复所有undo历史，不由命令控制。添加下列配置
```
" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存 undo 历史
set undodir=~/.undo_history/
set undofile
" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>"
```

### 工具链集成
#### 编译器/构建工具集成
##### 代码编译
对于C/C++编译器，可选gcc或clang，这里选择clang，他们的比较参考[Comparison of Diagnostics between GCC and Clang](http://gcc.gnu.org/wiki/ClangDiagnosticsComparison)与[Clang vs Other Open Source Compilers](http://clang.llvm.org/comparison.html)。clang在2005年由苹果电脑发起，是LLVM编译器工具集的前端（front-end），目的是输出代码对应的抽象语法树（Abstract Syntax Tree, AST），并将代码编译成LLVM Bitcode。接着在后端（back-end）使用LLVM编译成平台相关的机器语言。Clang支持C、C++、Objective C。

首先需要安装clang，ArchLinux下安装clang的命令为
```
$ sudo pacman -Sy clang
```

之后，需要安装C/C++标准库，gcc配套的标准库涉及libstdc++ 和 libsupc++ 两个子库，前者是接口层（即，上层的封装），后者是实现层（即，底层的具体实现），对应实物文件，你得需要两个子库的头文件和动态链接库（*.so）。对应到 clang 的标准库，libc++（接口层）和 libc++abi（实现层）也需要安装头文件和动态链接库（*.so）。下面进行源码安装
```
$ cd ~/Downloads/ 
$ svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx（需要安装subversion） 
$ cd libcxx/lib 
$ ./buildit 
```

头文件已经生成到`~/downloads/libcxx/include/`，要让clang找到，则必须复制到`/usr/include/c++/v1/`
```
$ sudo cp -r ~/downloads/libcxx/include/ /usr/include/c++/v1/
```

`*.so`文件已生成`~/downloads/libcxx/lib/libc++.so.1.0`，要让clang访问必须复制到`/usr/lib/`，并创建软链接
```
$ ln -s ~/downloads/libcxx/lib/libc++.so.1.0 ~/downloads/libcxx/lib/libc++.so.1
$ ln -s ~/downloads/libcxx/lib/libc++.so.1.0 ~/downloads/libcxx/lib/libc++.so
$ ln cp ~/downloads/libcxx/lib/libc++.so* /usr/lib/
```

类似，源码安装`libc++abi`的头文件和动态链接库：
```
$ cd ~/Downloads/ 
$ svn co http://llvm.org/svn/llvm-project/libcxxabi/trunk libcxxabi 
$ cd libcxxabi/lib 
$ ./buildit 
```

安装时，遇到编译错误，出现很多重定义错误，解决方法是删除`libcxxabi/lib/cxa_noexception.o`文件。

头文件已经生成到`~/downloads/libcxxabi/include/`，要让 clang 找到必须复制到`/usr/include/c++/v1/`
```
$ sudo cp -r ~/downloads/libcxxabi/include/ /usr/include/c++/v1/
```

`*.so`文件已生成`~/downloads/libcxx/lib/libc++abi.so.1.0`，要让clang访问必须复制到`/usr/lib/`，并创建软链接
```
$ ln -s ~/downloads/libcxxabi/lib/libc++abi.so.1.0 ~/downloads/libcxxabi/lib/libc++abi.so.1
$ ln -s ~/downloads/libcxxabi/lib/libc++abi.so.1.0 ~/downloads/libcxxabi/lib/libc++abi.so
$ sudo cp ~/downloads/libcxxabi/lib/libc++abi.so\* /usr/lib/
```

##### 系统构建
这里采用CMake进行系统构建，通过建立`CMakeLists.txt`构建脚本，之后执行`$ cmake CMakeLists.txt`命令生成`Makefile`文件，最后执行`$ make`命令即可编译可执行程序。之后每次代码调整只需要再次执行`$ make`即可。

##### 一键编译
vim进行编译的过程如下
1. 创建`cmakelists.txt`文件
2. 执行`$ cmake CMakeLists.txt`，生成`Makefile`
3. 在VIM中执行`:make`
4. 在VIM中执行`:cw`，显示quickfix

为实现一键编译，将前面的步骤映射为VIM快捷键，添加配置
```
map <Leader>m :call CompileRunGpp()<cr>
func! CompileRunGpp()
exec "wa"                               " 保存编辑的文件
exec "cd build/"                        “ 进入build文件夹
exec "silent !rm -rf main"              ” 删除之前生成的可执行文件
exec "silent !cmake CMakeLists.txt"     “ 通过cmake生成Makefile
exec "silent make"                      ” 编译
exec "cw"                               “ 显示quickfix
exec "cd .."                            ” 返回代码目录
endfunc
```

上面配置中的`silent`可以防止出现“Press ENTER or type command to continue”。

### 其他
#### 添加/替换/删除结对符
通过[surround](https://github.com/tpope/vim-surround)插件可以快速对结对符进行操作。
下面是surround.vim插件支持的快捷键的列表：
```
Normal mode
-----------
ds  - delete a surrounding
cs  - change a surrounding
ys  - add a surrounding
yS  - add a surrounding and place the surrounded text on a new line + indent it
yss - add a surrounding to the whole line
ySs - add a surrounding to the whole line, place it on a new line + indent it
ySS - same as ySs

Visual mode
-----------
s   - in visual mode, add a surrounding
S   - in visual mode, add a surrounding but place text on new line + indent it

Insert mode
-----------
<CTRL-s> - in insert mode, add a surrounding
<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
<CTRL-g>s - same as <CTRL-s>
<CTRL-g>S - same as <CTRL-s><CTRL-s>
```

#### 支持分支的undo
通过[gundo.vim](https://github.com/sjl/gundo.vim)插件，可以实现分支undo。gundo.vim采用树这种数据结构来实现undo，每一次编辑操作均放在树的叶子上，每次undo后，先回到主干，新建分支继续后续操作，而不是直接覆盖，从而实现支持分支的undo功能。
添加快捷方式
```
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>"
```

gundo.vim非常贴心，调用它后，你会在左侧看到一个分割为上下两个区域的子窗口。上半区域以可视化方式显示了整颗undo树，同时，用@标识最后一步编辑操作，用序号标识各步编辑操作的先后顺序，用时长显示每步操作距离当前消耗时间。下半区域展示了各个操作间的diff信息及其上下文，默认为选中那步操作与前一步操作间的diff，键入p可以查看选中那步操作与最后一步操作（即有 @ 标识的那步）间的diff，这对于找回多次编辑操作之前的环境非常有用。

#### 快速移动
VIM有两类快速移动光标的方式：一类是以单词为单位的移动，比如，`w`正向移动到相邻单词的首字符、`b`逆向移动到相邻单词的首字符、`e`正向移动到相邻单词的尾字符、`ge`逆向移动到相邻单词的尾字符；一类是配合查找字符的方式移动，比如，`fa`正向移动到第一个字符`a`处、`Fa`逆向移动到第一个字符`a`处。你要在非相邻的单词或字符间移动，你可以配合数字参数，比如，正向移动到相隔八个单词的首字符执行`8w`、逆向移动到第四个`a`字符处执行`4Fa`。

[easymotion](https://github.com/Lokaltog/vim-easymotion)插件会将移动时满足条件的位置用[;A~Za~z]间的标签字符标出来，找到所要移动到的位置再键入对应标签字符即可快速到达。为避免按键冲突，easymotion 采用两次`<leader>`作为前缀键。前面提过的`w`、`e`、`b`、`ge`、`f`、`F`、`j`、`k` 等命令在easymotion作用下也能实现快速移动，其中，`j`和`k`可跨行移动。同时，还可以搭配`v`选中命令、`d`删除命令、`y`拷贝命令，比如，`v<leader><leader>fa`，快速选中光标当前位置到指定字符`a`之间的文本，`d<leader><leader>fa`，快速删除光标当前位置到指定字符`a`之间的文本

#### 中/英输入平滑切换
[fcitx.vim](https://github.com/lilydjwg/fcitx.vim)插件支持从插入模式转到普通模式后自动切换为英文，再转换为插入模式后恢复为中文输入法，此插件只支持fcitx输入法。

终端下设置 Vim 'ttimeoutlen' 选项为较小值（如100），否则退出插入模式时会有较严重的延迟。同样会造成延迟的还有screen的maptimeout选项以及tmux的escape-time选项。

-----------------------------------------------
待完善...
