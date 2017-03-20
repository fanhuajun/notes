# coding=utf-8
from selenium import webdriver
import os

# firefoxBin = os.path.abspath(r"C:/Program Files (x86)/Mozilla Firefox/firefox.exe")
# os.environ["webdriver.firefox.bin"] = firefoxBin

driver = webdriver.Chrome()
url = 'http://www.baidu.com'
driver.get(url)
driver.close()
