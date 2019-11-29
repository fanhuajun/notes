import requests
# ########################  esb同步  ########################################################

def esbUserAdd():
    url = "http://localhost:8681/ssoserver/esbTest"
    querystring = {"type":"111"}
    headers = {
        'User-Agent': "PostmanRuntime/7.20.1",
        'Accept': "*/*",
        'Cache-Control': "no-cache",
        'Postman-Token': "c7bf8799-c527-4dad-b719-4bfb55363207,f707c9bd-6a57-44bf-b0a6-109a8d2bfafa",
        'Host': "localhost:8681",
        'Accept-Encoding': "gzip, deflate",
        'Cookie': "sso_check_timeout=1; JSESSIONID=00BA5F6E20C1932D492C82AEFB3DCF6B",
        'Connection': "keep-alive",
        'cache-control': "no-cache"
        }

    response = requests.request("GET", url, headers=headers, params=querystring)

    print(response.text)

