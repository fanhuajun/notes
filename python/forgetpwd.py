import requests
import json

def forgetPwd(codeIn):
    url = "http://localhost:8681/ssoserver/ModifyNextServlet"
    querystring = {"code":codeIn,"phone":"18729968867","spm": "0.1798988093245859","username":"fanhuajun"}
    headers = {
        'User-Agent': "PostmanRuntime/7.20.1",
        'Accept': "*/*",
        'Cache-Control': "no-cache",
        'Postman-Token': "27fc6c54-c6a0-48f5-a90a-def5a48fe202,b528eaec-0d9e-47a9-aa8a-ac36eca2c7a1",
        'Host': "szwb.sz.gov.cn:8007",
        'Accept-Encoding': "gzip, deflate",
        'Cookie': "JSESSIONID=B46AD113600F7C45B8C2E5BA4A2074C6",
        'Connection': "keep-alive",
        'cache-control': "no-cache"
        }

    response = requests.request("GET", url, headers=headers, params=querystring)

    print(response.text)


def getCode(username, phone):
    url = "http://localhost:8681/ssoserver/SendCode"
    querystring = {"phone": phone, "spm": "0.3767032002035844", "username": username}
    headers = {
        'User-Agent': "PostmanRuntime/7.20.1",
        'Accept': "*/*",
        'Cache-Control': "no-cache",
        'Host': "szwb.sz.gov.cn:8007",
        'Cookie': "JSESSIONID=B46AD113600F7C45B8C2E5BA4A2074C6",
    }

    response = requests.request("GET", url, headers=headers, params=querystring)

    print(response, response.text)
    json_obj = json.loads(response.text)
    return json_obj["error"]


def sendCodeTip():
    message = getCode("fanhuajun","")
    # time.sleep(66)
    if "手机号码不对" not in message:
        raise RuntimeError("手机号码不对--提示有问题")
