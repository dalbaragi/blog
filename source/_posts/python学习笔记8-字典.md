---
title: python学习笔记8-字典
date: 2017-01-06 10:06:55
tags:
    [python]
categories:
    [python]
---

### 参考
[runoob Python3 字典](http://www.runoob.com/python3/python3-dictionary.html)

### 介绍
字典是另一种可变容器模型，且可存储任意类型对象。字典的每个键值对(key=>value)用冒号`:`分割，每个对之间用逗号`,`分割，整个字典包括在花括号`{}`中，如
```python
d = {key1 : value1, key2 : value2 }
```

其中，键必须是唯一的，值则不需要。值可以取任何数据类型，但是键必须是不可变的，如字符串、数字、元组。如
```python
dict = {'Alice': '2341', 'Beth': '9102', 'Cecil': '3258'}
dict1 = { 'abc': 456 };
dict2 = { 'abc': 123, 98.6: 37 };
```

<!--more-->

### 访问字典里的值
把相应的键放入熟悉的方括弧，如
```python
#!/usr/bin/python3

dict = {'Name': 'Runoob', 'Age': 7, 'Class': 'First'}

print ("dict['Name']: ", dict['Name'])
print ("dict['Age']: ", dict['Age'])
```

### 修改字典
向字典添加新内容的方法是增加新的键/值对，修改已有键/值对，如
```python
#!/usr/bin/python3

dict = {'Name': 'Runoob', 'Age': 7, 'Class': 'First'}

dict['Age'] = 8;             # 更新 Age
dict['School'] = "菜鸟教程"  # 添加信息
```

### 删除字典元素
能删单一的元素也能清空字典，清空只需一项操作。删除一个字典用del命令，如
```python
#!/usr/bin/python3

dict = {'Name': 'Runoob', 'Age': 7, 'Class': 'First'}

del dict['Name'] # 删除键 'Name'
dict.clear()     # 删除字典
del dict         # 删除字典
```

### 字典键的特性
字典值可以没有限制地取任何python对象，既可以是标准的对象，也可以是用户定义的，但键不行。
两个重要的点需要记住：
1. 不允许同一个键出现两次。创建时如果同一个键被赋值两次，后一个值会被记住，如
```python
#!/usr/bin/python3

dict = {'Name': 'Runoob', 'Age': 7, 'Name': '小菜鸟'}

print ("dict['Name']: ", dict['Name'])

输出为：

dict['Name']:  小菜鸟
```

2. 键必须不可变，所以可以用数字，字符串或元组充当，而用列表就不行。

### 字典可用内置函数

| 函数           | 描述                                               |
|----------------|----------------------------------------------------|
| len(dict)      | 计算字典元素个数，即键的总数。                     |
| str(dict)      | 输出字典以可打印的字符串表示。                     |
| type(variable) | 返回输入的变量类型，如果变量是字典就返回字典类型。 |

### 字典内置方法

| 函数                                      | 描述                                                                   |
|-------------------------------------------|------------------------------------------------------------------------|
| radiansdict.clear()                       | 删除字典内所有元素                                                     |
| radiansdict.copy()                        | 返回一个字典的浅复制                                                   |
| radiansdict.fromkeys()                    | 创建一个新字典，以序列seq中元素做字典的键，val为字典所有键对应的初始值 |
| radiansdict.get(key, default=None)        | 返回指定键的值，如果值不在字典中返回default值                          |
| key in dict                               | 如果键在字典dict里返回true，否则返回false                              |
| radiansdict.items()                       | 以列表返回可遍历的(键, 值) 元组数组                                    |
| radiansdict.keys()                        | 以列表返回一个字典所有的键                                             |
| radiansdict.setdefault(key, default=None) | 和get()类似, 但如果键不存在于字典中，将会添加键并将值设为default       |
| radiansdict.update(dict2)                 | 把字典dict2的键/值对更新到dict里                                       |
| radiansdict.values()                      | 以列表返回字典中的所有值                                               |
