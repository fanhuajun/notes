## mysql 储存过程 

- 循环语句
```sql

DROP PROCEDURE IF EXISTS `digtalservice`.`23`; # 删除 已有的 存储过程 
DELIMITER $$  # 定义结束符为 $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    PROCEDURE `digtalservice`.`23`()
    /*LANGUAGE SQL
    | [NOT] DETERMINISTIC
    | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
    | SQL SECURITY { DEFINER | INVOKER }
    | COMMENT 'string'*/
    BEGIN
      DECLARE i INT DEFAULT 1;
        while i < 3 do  # 循环体 
        select * from tbl_eba_signal_health;
        set i = i +1;
        end while;
	    select i;
    END$$

DELIMITER ;

CALL `digtalservice`.`23`();

 ```

 - 常用语句
 ```sql
 1.去重 distinct select distinct name from table1;
  ```
SQL语句执行顺序[http://www.cnblogs.com/Qian123/p/5669259.html](http://www.cnblogs.com/Qian123/p/5669259.html)
```sql
1、FROM：对FROM子句中的前两个表执行笛卡尔积（Cartesian product)(交叉联接），生成虚拟表VT1  <b\>
2、ON：对VT1应用ON筛选器。只有那些使<join_condition>为真的行才被插入VT2。 <b\>
3、OUTER(JOIN)：如 果指定了OUTER JOIN（相对于CROSS JOIN 或(INNER JOIN),保留表（preserved table：左外部联接把左表标记为保留表，右外部联接把右表标记为保留表，完全外部联接把两个表都标记为保留表）中未找到匹配的行将作为外部行添加到 VT2,生成VT3.如果FROM子句包含两个以上的表，则对上一个联接生成的结果表和下一个表重复执行步骤1到步骤3，直到处理完所有的表为止。
4、WHERE：对VT3应用WHERE筛选器。只有使<where_condition>为true的行才被插入VT4.
5、GROUP BY：按GROUP BY子句中的列列表对VT4中的行分组，生成VT5.
6、CUBE|ROLLUP：把超组(Suppergroups)插入VT5,生成VT6.
7、HAVING：对VT6应用HAVING筛选器。只有使<having_condition>为true的组才会被插入VT7.
8、SELECT：处理SELECT列表，产生VT8.
9、DISTINCT：将重复的行从VT8中移除，产生VT9.
10、ORDER BY：将VT9中的行按ORDER BY 子句中的列列表排序，生成游标（VC10).
11、TOP：从VC10的开始处选择指定数量或比例的行，生成表VT11,并返回调用者。1
 ```