---
title: python学习笔记2-基本数据类型
date: 2017-01-05 15:13:42
tags:
    [python]
categories:
    [python]
---

### 参考
[runnoob Python3 基本数据类型](http://www.runoob.com/python3/python3-data-type.html)

### 简介
python中不需要声明变量，每个变量在使用前必须赋值，赋值后该变量才会被创建。python中，变量就是变量，这里所说的”类型“是变量所指的内存中对象的类型。等号`=`用来给变量赋值。

### 多个变量赋值
python允许同时为多个变量赋值，例如
```python
a = b = c = 1
```

上面的例子会创建一个整型对象，值为1，三个变量被分配到相同的内存空间上。

也可以为多个对象指定多个变量，例如
```python
a, b, c = 1, 2, "runoob"
```

上面的例子将两个整形对象分配给变量`a`和`b`，字符串对象`"runoob"`分配给变量`c`。

<!--more-->

### 标准数据类型
python3中有个标准数据类型
- Number（数字）
- String（字符串）
- List（列表）
- Tuple（元组）
- Sets（集合）
- Dictionary（字典）

#### Number（数字）
python3支持int、float、bool、complex等类型，其中复数可表示为`a+bj`或`complex(a,b)`。python3中只有一种整形int，没有python2中的Long。内置的`type()`函数可以用来查询变量所致的对象类型。
此外，在Python2中是没有布尔型的，它用数字0表示False，用1表示True。到Python3中，把True和False定义成关键字了，但它们的值还是1和0，它们可以和数字相加。
通过使用`del`语句，删除单个或多个对象，例如
```python
del var1
del var2,var3
```

#### 数值运算
```python
>>> 5 + 4  # 加法
9
>>> 4.3 - 2 # 减法
2.3
>>> 3 * 7  # 乘法
21
>>> 2 / 4  # 除法，得到一个浮点数
0.5
>>> 2 // 4 # 除法，得到一个整数
0
>>> 17 % 3 # 取余 
2
>>> 2 ** 5 # 乘方
32
```

#### String（字符串）
python中的字符串用单引号`'`或双引号`"`括起来，同时使用反斜杠`\`转义特殊字符。
截取字符串字符串的语法格式如下
```python
变量[头下标:尾下标]
```

索引值以0为开始值，-1为从末尾的开始位置。

加号`+`是字符串的连接符，星号`*`表示复制当前字符串，紧跟的数字为复制的次数。

```python
#!/usr/bin/python3

str = 'Runoob'

print (str)          # 输出字符串
print (str[0:-1])    # 输出第一个个到倒数第二个的所有字符
print (str[0])       # 输出字符串第一个字符
print (str[2:5])     # 输出从第三个开始到第五个的字符
print (str[2:])      # 输出从第三个开始的后的所有字符
print (str * 2)      # 输出字符串两次
print (str + "TEST") # 连接字符串
```

python使用反斜杠`\`转义特殊字符，如果不想让反斜杠发生转义，则可以在字符串前面添加一个`r`。反斜杠`\`同样表示下一行是上一行的延续，也可以使用`""..."""`或` ''...'''`跨越多行。此外，python没有单独的字符类型，一个字符就是长度为1的字符串。

#### List（列表）
列表是写在方括号`[]`之间、用逗号分隔开的元素列表。列表可以完成列表可以完成大多数集合类的数据结构实现。列表中元素的类型可以不相同，它支持数字，字符串甚至可以包含列表（所谓嵌套）。
和字符串一样，列表同样可以被索引和截取，列表被截取后返回一个包含所需元素的新列表。截取的语法格式为
```python
变量[头下标:尾下标]
```

索引值以0为开始值，-1为从末尾的开始位置。加号`+`是列表的连接符，星号`*`表示复制当前列表，紧跟的数字为复制的次数。

#### Tuple（元组）
元组与列表类似，不同之处在于元组的元素不能修改，元组写在圆括号`()`之间，用逗号分隔元素，元组中的元素类型也可以不相同，其他操作与列表相同。

#### Set（集合）
集合是一个无序不重复元素的序列，基本功能是进行成员关系测试和删除重复元素。可以使用大括号`{}`或`set()`函数创建集合，当创建空集合时必须使用`set()`，因为`{}`被用来创建空字典。
下面是关于集合的一些例子
```python
#!/usr/bin/python3

student = ({'Tom', 'Jim', 'Mary', 'Tom', 'Jack', 'Rose'})

print(student)   # 输出集合，重复的元素被自动去掉

# 成员测试
if('Rose' in student) :
    print('Rose 在集合中')
else :
    print('Rose 不在集合中')

# set可以进行集合运算
a = set('abracadabra')
b = set('alacazam')

print(a)
print(a - b)     # a和b的差集
print(a | b)     # a和b的并集
print(a & b)     # a和b的交集
print(a ^ b)     # a和b中不同时存在的元素
```

#### Dictionary（字典）
列表时有序的对象结合，字典是无序的对象集合。两者的区别在于，字典当中的元素是通过键来存取的，而不是通过偏移存取。字典是一种映射类型，用`{}`标识，是一个无序的**键(key):值(value)**对集合。其中，键(key)为不可变类型，且同一个字典中必须是唯一的。

```python
#!/usr/bin/python3

dict = {}
dict['one'] = "1 - 菜鸟教程"
dict[2]     = "2 - 菜鸟工具"

tinydict = {'name': 'runoob','code':1, 'site': 'www.runoob.com'}

print (dict['one'])       # 输出键为 'one' 的值
print (dict[2])           # 输出键为 2 的值
print (tinydict)          # 输出完整的字典
print (tinydict.keys())   # 输出所有键
print (tinydict.values()) # 输出所有值
```

此外，还可以使用`dict()`构造函数构造字典
```python
>>> dict([('Runoob', 1), ('Google', 2), ('Taobao', 3)])
{'Taobao': 3, 'Runoob': 1, 'Google': 2}

>>> {x: x**2 for x in (2, 4, 6)}
{2: 4, 4: 16, 6: 36}

>>> dict(Runoob=1, Google=2, Taobao=3)
{'Taobao': 3, 'Runoob': 1, 'Google': 2}
```

### 数据类型转换
|函数|描述|
|:---|:---|
|int(x [,base])             |将x转换为一个整数                                      |
|float(x)                   |将x转换到一个浮点数                                    |
|complex(real [,imag])      |创建一个复数                                           |
|str(x)                     |将对象 x 转换为字符串                                  |
|repr(x)                    |将对象 x 转换为表达式字符串                            |
|eval(str)                  |用来计算在字符串中的有效Python表达式,并返回一个对象    |
|tuple(s)                   |将序列 s 转换为一个元组                                |
|list(s)                    |将序列 s 转换为一个列表                                |
|set(s)                     |转换为可变集合                                         |
|dict(d)                    |创建一个字典。d 必须是一个序列 (key,value)元组。       |
|frozenset(s)               |转换为不可变集合                                       |
|chr(x)                     |将一个整数转换为一个字符                               |
|unichr(x)                  |将一个整数转换为Unicode字符                            |
|ord(x)                     |将一个字符转换为它的整数值                             |
|hex(x)                     |将一个整数转换为一个十六进制字符串                     |
|oct(x)                     |将一个整数转换为一个八进制字符串                       |






















