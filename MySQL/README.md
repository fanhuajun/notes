
```sql
DROP PROCEDURE IF EXISTS `digtalservice`.`23`; # 删除 已有的 存储过程 
DELIMITER $$

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
	  set i = i +1;
	  SELECT i;
    END$$

DELIMITER ;

CALL `digtalservice`.`23`();
 ```