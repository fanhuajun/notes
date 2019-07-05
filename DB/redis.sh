#乐观锁的实现，必须基于WATCH，然后利用redis的事务。
#WATCH生命周期，只是和事务关联的，一个事务执行完毕，相应的watch的生命周期即结束。

127.0.0.1:6379> watch hello
OK
127.0.0.1:6379> get hello
"4"
127.0.0.1:6379> multi
OK
127.0.0.1:6379> incr hello
QUEUED
#这一步执行完毕后，去另外一个窗口（ssh窗口2），对hello这个key做incr操作，
#将其值变成5。完成后，继续后面的exec指令
127.0.0.1:6379> incr hello
QUEUED
127.0.0.1:6379> exec
(nil)                       #注意，这是exec执行后返回的是nil，表示事务提交执行失败
127.0.0.1:6379>
#这个时候，查看hello对应的值，就是在另外一个窗口（ssh窗口2）执行incr后的值
127.0.0.1:6379> get hello   
"5"
