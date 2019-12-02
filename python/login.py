import requests
import json
import constant
import time

'''
curl -X GET \
  'http://szwb.sz.gov.cn:8101/ssoserver/LoginServlet?uuuacount=ssoroot&ppptoken=Q0pXR0MBAgM%3D&service=&timestamp=1574865011000&smp=0.4827080552081422&systemCode=&captcha_check_code=b3a072' \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cookie: JSESSIONID=f9bd6b9c-2399-4d08-8fb5-6ef3391337e5' \
  -H 'Host: szwb.sz.gov.cn:8101'
'''
headers = {
        'User-Agent': "PostmanRuntime/7.20.1",
        'Accept': "*/*",
        'Cache-Control': "no-cache",
        'Postman-Token': "a3063988-6e1a-4343-9cf3-1a60813d6a6c,4eb4cc77-84b5-44e6-9078-f78c6489bbf8",
        'Host': "localhost:8681",
        'Accept-Encoding': "gzip, deflate",
        'Cookie': "sso_check_timeout=1; JSESSIONID=3CD8BFC18E139D44158D205E44EC3C66; ssokey=03feccc6-5d03-467b-abdf-e20497444fcc",
        'Connection': "keep-alive",
        'cache-control': "no-cache"
    }

loginUrl = "http://localhost:8681/ssoserver/LoginServlet"
# yexiang 的账号
loginQuery = {"uuuacount":"yexiang","ppptoken":"V0dDYXFqAQIDEw==","service":"","timestamp":"1574855458000","smp":"0.13257719932556555","systemCode":"","captcha_check_code":"a2735c"}
loginQueryError = {"uuuacount":"yexiang","ppptoken":"D0dDYXFqAQIDEw==","service":"","timestamp":"1574855458000","smp":"0.13257719932556555","systemCode":"","captcha_check_code":"a2735c"}
# ssoroot 的账号
ssorootLoginQuery = {"uuuacount":"ssoroot","ppptoken":"Q0pXR0MBAgM=","service":"","timestamp":"1574865011000","smp":"0.4827080552081422","systemCode":"","captcha_check_code":"b3a072"}





def login():
    response = requests.request("GET", loginUrl, headers=headers, params=loginQuery)
    print(response, response.text)
    print(response.cookies)

def ssorootLogin():
    response = requests.request("GET", loginUrl, headers=headers, params=ssorootLoginQuery)
    constant.headers = response.headers
    print(response, response.text)
    print(response.cookies)

def login_error():
    response = requests.request("GET", loginUrl, headers=headers, params=loginQueryError)
    print(response, response.text)
    json_obj = json.loads(response.text)
    return json_obj["message"]

def errorLogin():
    response = requests.request("GET", loginUrl, headers=headers, params=loginQueryError)
    print(response)
    print(response.text)



def errorToFreeze():
    unLockedUsers()
    msg = "";
    i = 0
    while("该账户已冻结" not in msg):
        response = requests.request("GET", loginUrl, headers=constant.headers, params=loginQueryError)
        json_obj = json.loads(response.text)
        msg = json_obj['message']
        if constant.freezeTip[i] not in msg:
            raise RuntimeError("冻结提示错误： "+constant.freezeTip[i]+"-----"+msg)
        print(response.text)
        i = i+1

    return json_obj['message']

# ########################  解锁、解冻  ########################################################

def unLockedUsers():
    url = "http://localhost:8681/ssoserver/unLockedUsers"
    querystring = {"accounts": "yexiang"}
    response = requests.request("GET", url, headers=constant.headers, params=querystring)

    print("解锁、解冻", response, response.text)
    if response.status_code != 200:
        raise RuntimeError("无权限")


# 人工冻结 --> 等待超时 --> 查看提示
def freezeTimeTest():
    errorToFreeze()
    print("Start : %s" % time.ctime())
    time.sleep(33)
    print("End : %s" % time.ctime())
    errorToFreeze()

# 人工冻结 --> 人工错误密码 --> 查看提示
def freezeInTimeTest():
    errorToFreeze()
    msg = login_error()
    if "该账户已冻结" not in msg:
        raise RuntimeError("冻结时间内提示错误")

# 人工冻结 --> 解冻按钮 --> 人工输入错误密码 --> 查看提示
def freezeSuccess():
    errorToFreeze()
    unLockedUsers()
    msg = login_error()
    if "用户名或密码不正确" not in msg:
        raise RuntimeError("解冻失败 msg="+msg)