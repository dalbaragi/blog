---
title: python学习笔记9-条件控制与循环语句
date: 2017-01-06 10:43:18
tags:
    [python]
categories:
    [python]
---

## 参考
[runoob Python3 条件控制](http://www.runoob.com/python3/python3-conditional-statements.html)
[runoob Python3 循环语句](http://www.runoob.com/python3/python3-loop.html)

## 条件控制
```python
if condition_1:
    statement_block_1
elif condition_2:
    statement_block_2
else:
    statement_block_3
```

**注意：**
1、每个条件后面要使用冒号（:），表示接下来是满足条件后要执行的语句块。
2、使用缩进来划分语句块，相同缩进数的语句在一起组成一个语句块。
3、在Python中没有switch – case语句。

## 循环语句
### while循环
```python
while 判断条件：
    语句
```

#### while循环使用else语句
在 while … else 在条件语句为 false 时执行 else 的语句块：
```python
while 判断条件：
    语句
else:
    语句
```

### for语句
Python for循环可以遍历任何序列的项目，如一个列表或者一个字符串。
```python
for <variable> in <sequence>:
    <statements>
else:
    <statements>
```

#### range()函数
如果你需要遍历数字序列，可以使用内置`range()`函数。它会生成数列，下面是一些相关用法。

```python
>>> for i in range(5):  print(i)
0
1
2
3
4
```

```python
>>> for i in range(5,9): print(i)
5
6
7
8
```

```python
>>> for i in range(0, 10, 3): print(i)
0
3
6
9
```

```python
>>> for i in range(-10, -100, -30): print(i)
-10
-40
-70
```

### break和continue语句及循环中的else子句
break及continue与C语言中的类似。需要说明的是，使用break后，不会继续执行循环语句的else部分，而是直接跳出。

### pass语句
Python pass是空语句，是为了保持程序结构的完整性。pass 不做任何事情，一般用做占位语句。
下面是一些用法
```python
>>> while True:
...     pass  # 等待键盘中断 (Ctrl+C)
```

```python
最小的类:
>>> class MyEmptyClass:
...     pass
```
