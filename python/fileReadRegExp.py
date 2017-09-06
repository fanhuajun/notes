# coding:utf-8
import re


def mytoSCS(path):  # my转换为开思的函数
    p = '\/{1}[a-z]+[a-z/]*'
    myfile = open(path, 'r', encoding='utf-8')
    fileread = myfile.read()
    myfile.close()
    data = re.findall(p, fileread)
    print(data)


mytoSCS('testFile/url.txt')
