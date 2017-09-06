# encoding: UTF-8
import re
# 将正则表达式编译成Pattern对象
# p=re.compile(r'(?P<folder>(\w+/)*)(?P<filename>\w+\.png)')
p = re.compile(r'(?P<folder>(\w+/)*)(?P<filename>\w+\.png)')
# 使用Pattern匹配文本，获得匹配结果，无法匹配时将返回None
# match = pattern.match('<key>xxx/duobaojiemian_L/yangpizi.png</key>')
the_str = """<key>XXXX/duobaojiemian2222_L/duobaojiemian_L/yangpizi.png</key>
  <key>yangpizi2.png</key>
  <key>yangpizi3.png</key> """

for m in p.finditer(the_str):
    # 使用Match获得分组信息
    print(m.groupdict())
    print("@@@@@@@")
print('-------------------------------')
# f = lambda m: m.group().find('XXXX/') == -1 and'XXXX/'+m.group() or m.group()
# def f(m):
#   s = m.group()
#   return s.find('XXXX/') == -1 and 'XXXX/'+s or s


def f2(m2):
    d = m2.groupdict()
    print(d)
    print("=========================")
    return d['folder'] + 'the_' + d['filename']


print(p.sub(f2, the_str))
