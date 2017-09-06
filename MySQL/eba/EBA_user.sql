
#给角色配置资源权限
INSERT INTO t_ref_websource_role  SELECT 1,t.s_id FROM t_web_source AS t;

#查询角色列表
SELECT  
		r.R_ID,r.R_NAME,
		(CASE WHEN app.name IS NULL THEN '-' ELSE app.name END ) APP_SOURCE,
		(CASE WHEN web.name IS NULL THEN '-' ELSE web.name END ) WEB_SOURCE,
		(CASE WHEN cou.num IS NULL THEN  0 ELSE cou.num END ) NUM
	FROM  t_role  r
	LEFT JOIN(
		SELECT  ar.R_ID,GROUP_CONCAT(am.S_NAME) NAME 
		  FROM  t_ref_appsource_role  ar LEFT JOIN  T_APP_SOURCE  am
		    ON  am.S_ID = ar.S_ID
		 WHERE  S_STATUS=1  AND  am.S_TYPE <![CDATA[ < ]]> 3 
		 GROUP  BY  ar.R_ID
	)  app ON  app.R_ID = r.R_ID
	LEFT JOIN ( 
		SELECT  wr.R_ID,GROUP_CONCAT(wm.S_NAME) NAME 
		  FROM  t_ref_websource_role wr LEFT JOIN  T_WEB_SOURCE wm
		    ON  wm.S_ID = wr.S_ID
		 WHERE  S_STATUS=1  AND  wm.S_TYPE <![CDATA[ < ]]> 3 
		 GROUP  BY  wr.R_ID
	) web  ON  web.R_ID = r.R_ID
	LEFT JOIN ( 
		SELECT  R_ID,COUNT(1) num FROM  t_ref_role_user GROUP BY r_ID
	) cou  ON  cou.R_ID = r.R_ID



#根据工单id查询处理步骤
SELECT 
    ur.U_ID, ur.R_ID, u.username, account
FROM
    eba_user.t_ref_role_user ur
WHERE ur = 1
LEFT JOIN (SELECT * FROM eba_user.t_user) u on u.U_ID=ur.U_ID; 


#work_order_mend, device_failure
SELECT w.status, w.org_id ,w.device_id , d.id, d.device_position, 
       d.fault_desc, d.fault_picture,d.failure_cause, d.maintenance_method
FROM work_order_mend
LEFT JOIN (SELECT * FROM device_failure) d ON w.device_id=d.id;




#系统自动派单筛选 id="selectAssignOrderUsers"
SELECT t1.`U_ID`, t1.`USERNAME` FROM eba_user.t_user AS t1 WHERE t1.`U_ID` IN 
     (SELECT U_ID FROM eba_user.t_ref_role_user WHERE R_ID IN (
        1,100
     )) 
     AND t1.`U_ID` IN (SELECT U_ID FROM eba_user.t_ref_user_skill WHERE skill_id IN (
        1000,1001
      ))
     AND t1.`U_ID` IN (SELECT U_ID FROM eba_user.t_ref_user_organization WHERE OR_ID = 21)
     AND  t1.`USERNAME` LIKE '%赵%'


#根据资源ID查角色ID列表
select DISTINCT(t1.R_ID) 
    from T_REF_APPSOURCE_ROLE as t1, t_app_source as t2 
        where t1.S_ID = t2.S_ID and t2.S_STATUS = 1 and t2.S_ID = #{sId}


#查询派单用户列表
SELECT  u.u_id,username,
	( SELECT  GROUP_CONCAT(kil.SKILL_NAME) SKILL_NAME FROM  t_ref_user_skill kiRef, t_skill_dictionary kil  
	   WHERE  kiRef.SKILL_ID = kil.SKILL_ID AND  kiRef.U_ID = u.U_ID ) skills,
       
	( SELECT  org.OR_ID FROM  t_ref_user_organization  org WHERE  org.U_ID=u.U_ID ) jgs    
FROM 
     t_user u
    ,( SELECT  U_id FROM   

			( SELECT DISTINCT(t1.R_ID)rId FROM T_REF_APPSOURCE_ROLE AS t1, t_app_source AS t2 
	           WHERE t1.S_ID = t2.S_ID AND t2.S_STATUS = 1 AND t2.S_ID = 2 )  tt1, t_ref_role_user  r 
           
 	WHERE  r.`R_ID`=tt1.rId ) ui
 
	,( SELECT U_ID FROM   `t_ref_user_organization`  WHERE COMBINATION_CODE = 10 ) orgUser

	,( SELECT U_ID FROM  t_ref_user_skill  WHERE skill_id = 9 or skill_id IN 
                  (SELECT P_SKILL_ID FROM t_skill_dictionary where SKILL_ID = 9) ) skillUser

WHERE  u.u_id = ui.U_id   
AND    u.u_id = orgUser.U_ID 
AND    u.u_id = skillUser.U_ID
AND   username LIKE '%%'

#人员总数查询
SELECT count(distinct  user.u_id) totalUser
FROM t_ref_user_organization userOrg, t_user user
where userOrg.u_id = user.U_ID
and STATUS = 1
and (
     userOrg.COMBINATION_CODE like concat("000001-000021-000022","%")
     or userOrg.COMBINATION_CODE like concat("000001-000035-000036-000050","%")
)