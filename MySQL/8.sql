CREATE PROCEDURE `new_procedure` ()
BEGIN
INSERT INTO t_ref_websource_role  SELECT 1,t.s_id FROM t_web_source AS t;
END
