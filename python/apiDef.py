import requests
import json

url_unLock = "http://localhost:8681/ssoserver/unLockedUsers"
querystring_unLock = {"accounts":"yexiang"}
headers_unLock = {
    'User-Agent': "PostmanRuntime/7.20.1",
    'Accept': "*/*",
    'Host': "localhost:8681",
    'Cookie': "sso_check_timeout=1; ssokey=17229f41-4f2d-49ec-b821-b3c4338d90d0; JSESSIONID=05AFEEBC535B8D0E8E5BD7DC5C27E88F",
    }

url_login = "http://localhost:8681/ssoserver/LoginServlet"
# yexiang 的账号
query_login = {"uuuacount":"yexiang","ppptoken":"V0dDYXFqAQIDEw==","service":"","timestamp":"1574855458000","smp":"0.13257719932556555","systemCode":"","captcha_check_code":"a2735c"}
queryError_login = {"uuuacount":"yexiang","ppptoken":"D0dDYXFqAQIDEw==","service":"","timestamp":"1574855458000","smp":"0.13257719932556555","systemCode":"","captcha_check_code":"a2735c"}
# ssoroot
queryssoroot_login = {"uuuacount":"ssoroot","ppptoken":"Q0pXR0MBAgM=","service":"","timestamp":"1574865011000","smp":"0.4827080552081422","systemCode":"","captcha_check_code":"b3a072"}

def unLockedUsers():
    response = requests.request("GET", url_unLock, headers=headers_unLock, params=querystring_unLock)
    print(response)
    print(response.text)

# curl -X GET \
#   'http://localhost:8681/ssoserver/LoginServlet?uuuacount=yexiang&ppptoken=V0dDYXFqAQIDEw%3D%3D&service=&timestamp=1574855458000&smp=0.13257719932556555&systemCode=&captcha_check_code=a2735c' \
#   -H 'Accept: */*' \

headers = {
    'User-Agent': "PostmanRuntime/7.20.1",
    'Accept': "*/*"
    }

# response = requests.request("GET", url, headers=headers, params=querystring)
# jsonObj = json.loads(response.text)
# # print(response.text)
# print(response)
# print(jsonObj['message'])

# 输错密码
# http://localhost:8681/ssoserver/unLockedUsers?accounts=yexiang

def login():
    response = requests.request("GET", url_login, headers=headers, params=query_login)
    print(response)
    print(response.text)

def login_error():
    response = requests.request("GET", url_login, headers=headers, params=queryError_login)
    print(response)
    print(response.text)


def freeze():
    ret = "";
    while ("该账户已冻结" not in ret):
        response = requests.request("GET", url_login, headers=headers, params=queryError_login)
        jsonObj = json.loads(response.text)
        ret=jsonObj['message']
        print(response.text)