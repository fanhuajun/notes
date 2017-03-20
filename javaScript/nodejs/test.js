var http = require("http");  
  
http.createServer(function(request, response) {  
  response.writeHead(200, {"Content-Type": "text/plain"});  
  response.write("Hello World");  
  response.end();  
}).listen(8888);  
  
console.log("Server running at http://127.0.0.1:8888/");  

/*Ctrl+b编译这段代码之后，sublime text窗口中就会显示
Server running at http://127.0.0.1:8888/
到此，服务端算是启动成功，打开浏览器，输入http://127.0.0.1:8888/，页面显示
Hello World
则表示交互正常。*/