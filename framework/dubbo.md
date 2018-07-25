## telnet
telnet localhost 20880
dubbo> 
dubbo> invoke com.test.DemoService.queryDemoPageList({"id":"100"}, 1, 2)