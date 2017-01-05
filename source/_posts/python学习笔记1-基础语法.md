---
title: python学习笔记1-基础语法
date: 2017-01-05 13:23:22
tags:
    [python]
categories:
    [python]
---

### 参考
[runnoob Python3 基础语法](http://www.runoob.com/python3/python3-basic-syntax.html)

### 编码
python3源码文件默认以UTF-8编码，所有字符串都为unicode字符串。可以为源码文件指定不同的编码，如
```python
# -*- coding: cp-1252 -*-
```

### 保留字
保留字可以通过，下列代码得到
```python
>>> import keyword
>>> keyword.kwlist
['False', 'None', 'True', 'and', 'as', 'assert', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']
```

<!--more-->

### 行与缩进
python使用缩进表示代码块，缩进的空格数可变，但是同一个代码块的语句必须包含相同的缩进空格数。

### 多行语句
python中，若语句很长，可以使用反斜杠(\)来实现多行语句，例如
```python
total = item_one + \
        item_two
```

在`[]`、`{}`、`()`中的多行语句不需要使用反斜杠，例如
```python
total = ['item_one', 'item_two', 'item_three',
        'item_four', 'item_five']
```

### 数据类型
- 整数
- 长整数
- 浮点数：如1.23\3E-2
- 复数：如1+2j、1.1+2.2j

### 字符串
- python中单引号和双引号使用完全相同
- 使用三引号（`'''`或`"""`）可以指定一个多行字符串
- 转义符`\`
- 自然字符串，通过在字符串前加`r`或`R`，如`r"this is a line with \n"`则`\n`会显示，并不是换行。
- python允许处理unicode字符串，加前缀`u`或`U`，如`u"this is an unicode string"`。
- 字符串是不可变的
- 按字面意义级联字符串，如`"this""is""string"`会被自动转换为`this is string`。

例子如下：
```python
word = '字符串'
sentence = "这是一个句子。"
paragraph = """这是一个段落，
可以由多行组成"""
```

### 注释
单行注释使用`#`
多行注释用三个单引号`'''`或三个双引号`"""`

### 等待用户输入
```python
#!/usr/bin/python3

input("按下 enter 键后退出。")
```

### 同一行使用多条语句
python可以在同一行中使用多条语句，语句之间用分号`;`分割。


