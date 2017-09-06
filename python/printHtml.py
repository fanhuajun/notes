# from python352.chm
import urllib.request
f = urllib.request.urlopen('http://www.python.org/')
print(f.read(20000).decode('utf-8'))
