import requests

url = "http://szwb.sz.gov.cn:8073/permission/api/permission/getUserPermission"

payload = "{\"loginName\": \"yexiang\",\"systemCode\":\"permission\",\"menuCode\":\"authority\"}"
headers = {
    'Content-Type': "application/json",
    'User-Agent': "PostmanRuntime/7.20.1",
    'Accept': "*/*",
    'Cache-Control': "no-cache",
    'Postman-Token': "6bcbc2b6-516d-4cf7-b16d-f783e80118e9,88b6557a-24b8-4353-ae30-117157d9dd8f",
    'Host': "szwb.sz.gov.cn:8073",
    'Accept-Encoding': "gzip, deflate",
    'Content-Length': "73",
    'Connection': "keep-alive",
    'cache-control': "no-cache"
    }

response = requests.request("POST", url, data=payload, headers=headers)

print(response.text)