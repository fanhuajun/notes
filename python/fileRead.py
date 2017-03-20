'''''
Created on Dec 17, 2012
读取文件
@author: liury_lab
'''
# 最方便的方法是一次性读取文件中的所有内容放到一个大字符串中：
# all_the_text = open('E:/pythonTest/read.txt').read()
# stringT = str(all_the_text)
# print(stringT)

# 打开一个文件
fo = open("testFile/read.txt", "r+")
str = fo.read(10)
print("读取的字符串是 : ", str)
# 关闭打开的文件
fo.close()
