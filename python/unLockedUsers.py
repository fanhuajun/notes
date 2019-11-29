import requests

# unLockedUsers.py

unLock_url = "http://localhost:8681/ssoserver/unLockedUsers"
unLock_querystring = {"accounts":"yexiang"}
unLock_headers = {
    'User-Agent': "PostmanRuntime/7.20.1",
    'Accept': "*/*",
    'Host': "localhost:8681",
    'Cookie': "sso_check_timeout=1; ssokey=17229f41-4f2d-49ec-b821-b3c4338d90d0; JSESSIONID=05AFEEBC535B8D0E8E5BD7DC5C27E88F",
    }

def unLockedUsers():
    response = requests.request("GET", unLock_url, headers=unLock_querystring, params=unLock_headers)
    print(response)
    print(response.text)