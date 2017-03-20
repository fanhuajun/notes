//发送Get请求
var http=require('http');
var querystring=require('querystring');
var data={
	age:13,
	time:new Date().getTime()
};
var content=querystring.stringify(data);
var options={
	hostname:'www.gongjuji.net',
	port:80,
	path:'/',
	method:'GET'
}
//创建请求
var req=http.request(options,function(res){
	console.log('STATUS:'+res.statusCode);
	console.log('HEADERS:'+JSON.stringify(res.headers));
	res.setEncoding('utf-8');
	res.on('data',function(chunk){
		console.log('数据片段分隔-----------------------\r\n');
		console.log(chunk);
	});
	res.on('end',function(){
		console.log('响应结束********');
	});
});
req.on('error',function(err){
    console.error(err);
});
req.end();