---definde function
DELIMITER $$  
DROP FUNCTION IF EXISTS `warn`.`getdate`$$  
CREATE FUNCTION `warn`.`warnGetdate`(gdate datetime) RETURNS varchar(255)  
BEGIN  
DECLARE x VARCHAR(255) DEFAULT '';  
SET x= date_format(gdate,'%Y年%m月%d日%h时%i分%s秒');  
RETURN x;  
END $$  
DELIMITER ;  

----test
SELECT warnGetdate('2009-06-23 00:00:00');