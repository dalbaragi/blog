---
title: python学习笔记11-函数
date: 2017-01-06 11:43:05
tags:
    [python]
categories:
    [python]
---

### 参数
[runoob Python3 函数](http://www.runoob.com/python3/python3-function.html)

### 定义一个函数
- 函数代码块以`def`关键词开头，后接函数标识符名称和圆括号`()`。
- 任何传入参数和自变量必须放在圆括号中间，圆括号之间可以用于定义参数。
- 函数的第一行语句可以选择性地使用文档字符串—用于存放函数说明。
- 函数内容以冒号起始，并且缩进。
- `return [表达式]`结束函数，选择性地返回一个值给调用方。不带表达式的`return`相当于返回`None`。
```python
def 函数名（参数列表）:
    函数体
```

### 按值传递参数和按引用传递参数
python中，所有参数（变量）都是按引用传递。如果你在函数里修改了参数，那么在调用这个函数的函数里，原始的参数也被改变了。

### 参数
参数类型包括：
- 必需参数
- 关键字参数
- 默认参数
- 不定长参数

#### 必需参数
必需参数须以正确的顺序传入函数。调用时的数量必须和声明时的一样。

#### 关键字参数
关键字参数和函数调用关系紧密，函数调用使用关键字参数来确定传入的参数值。使用关键字参数允许函数调用时参数的顺序与声明时不一致，因为python解释器能够用参数名匹配参数值。
```python
#!/usr/bin/python3
 
#可写函数说明
def printinfo( name, age ):
   "打印任何传入的字符串"
   print ("名字: ", name);
   print ("年龄: ", age);
   return;
 
#调用printinfo函数
printinfo( age=50, name="runoob" ); #关键字参数
```

#### 默认参数
调用函数时，如果没有传递参数，则会使用默认参数。以下实例中如果没有传入age参数，则使用默认值：
```python
#!/usr/bin/python3
 
#可写函数说明
def printinfo( name, age = 35 ):
   "打印任何传入的字符串"
   print ("名字: ", name);
   print ("年龄: ", age);
   return;
 
#调用printinfo函数
printinfo( age=50, name="runoob" ); #关键字参数
print ("------------------------")
printinfo( name="runoob" );         #age为默认参数
```

#### 不定长参数
你可能需要一个函数能处理比当初声明时更多的参数。这些参数叫做不定长参数，和上述2种参数不同，声明时不会命名。基本语法如下：
```python
def functionname([formal_args,] *var_args_tuple ):
   "函数_文档字符串"
   function_suite
   return [expression]
```

加了星号`*`的变量名会存放所有未命名的变量参数。如果在函数调用时没有指定参数，它就是一个空元组。我们也可以不向函数传递未命名的变量。如下实例：
```python
#!/usr/bin/python3
 
# 可写函数说明
def printinfo( arg1, *vartuple ):
   "打印任何传入的参数"
   print ("输出: ")
   print (arg1)
   for var in vartuple:
      print (var)
   return;
 
# 调用printinfo 函数
printinfo( 10 );
printinfo( 70, 60, 50 );
```

输出结果为：
```python
输出:
10
输出:
70
60
5
```

### 匿名函数
python使用lambda来创建匿名函数。所谓匿名，意即不再使用 def 语句这样标准的形式定义一个函数。
- lambda只是一个表达式，函数体比 def 简单很多。
- lambda的主体是一个表达式，而不是一个代码块。仅仅能在lambda表达式中封装有限的逻辑进去。
- lambda函数拥有自己的命名空间，且不能访问自有参数列表之外或全局命名空间里的参数。
- 虽然lambda函数看起来只能写一行，却不等同于C或C++的内联函数，后者的目的是调用小函数时不占用栈内存从而增加运行效率。

#### 语法
lambda函数的语法只包含一个语句，如下：
```python
lambda [arg1 [,arg2,.....argn]]:expression
```

如下实例：
```python
#!/usr/bin/python3
 
# 可写函数说明
sum = lambda arg1, arg2: arg1 + arg2;
 
# 调用sum函数
print ("相加后的值为 : ", sum( 10, 20 ))
print ("相加后的值为 : ", sum( 20, 20 ))
```
