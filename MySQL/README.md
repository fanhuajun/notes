
```sql
-- 实例：
 CREATE PROCEDURE sum1(a INT) 
 BEGIN
     DECLARE SUM INT DEFAULT 0;  -- default 是指定该变量的默认值
     DECLARE i INT DEFAULT 1;
 WHILE i<=a DO -- 循环开始
     SET SUM=SUM+i;
     SET i=i+1;
 END WHILE; -- 循环结束
 SELECT SUM;  -- 输出结果
 END
 -- 执行存储过程
 CALL sum1(100);
 -- 删除存储过程
 DROP PROCEDURE IF EXISTS sum1
 ```