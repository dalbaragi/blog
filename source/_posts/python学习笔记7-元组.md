---
title: python学习笔记7-元组
date: 2017-01-05 19:49:57
tags:
    [python]
categories:
    [python]
---

### 参考
[runoob Python3 元组](http://www.runoob.com/python3/python3-tuple.html)

### 介绍
Python 的元组与列表类似，不同之处在于元组的元素不能修改。元组使用小括号，列表使用方括号。访问元组与访问列表一直，元组不能修改，但是可以链接。元组同样不支持删除元素，但是可以使用`del`删除整个元组。

创建元组
```python
tup1 = ('Google', 'Runoob', 1997, 2000);
tup2 = (1, 2, 3, 4, 5 );
tup3 = "a", "b", "c", "d";
```

创建空元组
```python
tup1 = ();
```

元组中只包含一个元素时，需要在元素后面添加逗号
```python
tup1 = (50,);
```

### 元组运算符
元组运算符与{% post_link python学习笔记6-列表 列表运算符 %}一致。

### 元组内置函数
| 函数        | 描述                   |
|-------------|------------------------|
| len(tuple)  | 计算元组元素个数。     |
| max(tuple)  | 返回元组中元素最大值。 |
| min(tuple)  | 返回元组中元素最小值。 |
| tuple(list) | 将列表转换为元组。     |
