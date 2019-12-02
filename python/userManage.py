import requests
import constant


def list_user():

    url = constant.local+"/ssoserver/web/loginManage/listUser"

    payload = "{\"pageNum\":1,\"pageSize\":10,\"searchInput\":\"\",\"lockStatus\":\"\",\"userStatus\":\"\",\"userType\":\"\",\"onlineStatus\":\"\"}"
    headers = {
        'Content-Type': "application/json",
        'User-Agent': "PostmanRuntime/7.20.1",
        'Accept': "*/*",
        'Cache-Control': "no-cache",
        'Postman-Token': "bfdfff6a-82e7-407c-b270-ec3f435adf74,20659614-3cc5-4cb2-bcde-88e4ea6d2de8",
        'Host': "localhost:8681",
        'Accept-Encoding': "gzip, deflate",
        'Content-Length': "108",
        'Cookie': "sso_check_timeout=1; JSESSIONID=5A6D42AD7D6FDC34630B454D9C011DB2",
        'Connection': "keep-alive",
        'cache-control': "no-cache"
    }

    response = requests.request("POST", url, data=payload, headers=headers)

    print(response, response.text)


list_user()
