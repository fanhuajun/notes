
#依据条件查询所有工单
   select
		t1.ID, t1.ORG_ID, t1.LINK_CODE, t1.FAILURE_ID, t1.DEVICE_ID, t1.CREATE_TIME,
		t1.PROCESS_USER_ID, t1.PROCESS_USER_NAME, t1.MAN_HAUR,
		t1.LAST_MAN_TIME, t1.TEMP_MAN_HAUR,
		t1.`STATUS`, t1.SUB_STATUS,
		t1.UPDATE_TIME,t2.FAULT_DESC,t2.DEVICE_NAME,t2.DEVICE_TYPE

		from eba_work.work_order_mend as t1, eba_work.device_failure as t2 where t2.ID =
		t1.FAILURE_ID
		<if test="query.linkCode != null">
			and t1.LINK_CODE like CONCAT(#{query.linkCode, jdbcType=VARCHAR}, '%')
		</if>
		<if test="query.status != null">
			and t1.`STATUS` = #{query.status, jdbcType=VARCHAR}
		</if>
		<if test="query.startTime != null">
			and t1.CREATE_TIME &lt;= #{query.startTime, jdbcType=TIMESTAMP}
		</if>
		<if test="query.endTime != null">
			and t1.CREATE_TIME &gt;= #{query.endTime, jdbcType=TIMESTAMP}
		</if>
		<if test="query.createUserName != null">
			and t2.CREATE_USER_NAME like CONCAT('%',#{query.createUserName,
			jdbcType=VARCHAR}, '%')
		</if>
		<if test="query.createUserId != null">
			and t2.CREATE_USER_ID = #{query.createUserId, jdbcType=BIGINT}
		</if>
		order by t1.CREATE_TIME desc


#七天有效工时  定时任务
orderMend.ID, orderMend.LINK_CODE orgCode, orderMend.SUB_STATUS, orderEvent.ORDER_ID, orderEvent.TRIGGER_TIME, orderEvent.SUB_TYPE, orderEvent.CAUSE
#
SELECT orderMend.ORG_ID, orderMend.LINK_CODE ORG_CODE, sum(orderMend.TEMP_MAN_HAUR)/7 ORDER_HOUR
FROM work_order_mend orderMend, work_order_event orderEvent
where SUB_STATUS in(9010,9020)
	and orderEvent.TRIGGER_TIME > date_sub(now(),INTERVAL 7 day) 
	and orderEvent.TRIGGER_TIME < now() 
    and orderMend.ID = orderEvent.ORDER_ID
    and orderEvent.SUB_TYPE = 6010
    and orderEvent.CAUSE not like "验收不通过%" 
group by orderMend.LINK_CODE

#七天有效工时  查询

SELECT  LINK_CODE, ORG_ID, ORDER_HOUR,level_type,
	(CASE WHEN ORG_ID IN (1) THEN 1 ELSE 0 END ) is_current_org
FROM work_order_hour_account
where level_type = 10
ORDER BY is_current_org DESC ,ORDER_HOUR ASC

#工单工时明细表



##################################
#删除维保工单
##################################
SELECT MAINTENANCE_ID FROM maintenance_info WHERE FM_ORDER_ID LIKE "%TEST%";
select ID from maintenance_event WHERE ORDER_ID IN(
	SELECT MAINTENANCE_ID FROM maintenance_info WHERE FM_ORDER_ID LIKE "%TEST%");

select count(*) FROM maintenance_info WHERE FM_ORDER_ID LIKE "%TEST%";



#删除附件表
DELETE FROM maintenance_event_attachment where id in(
	select ID from maintenance_event WHERE ORDER_ID IN(
		SELECT MAINTENANCE_ID FROM maintenance_info WHERE FM_ORDER_ID LIKE "%TEST%"));
#删除事件记录表
DELETE FROM maintenance_event_log where event_id id in(
	select ID from maintenance_event WHERE ORDER_ID IN(
		SELECT MAINTENANCE_ID FROM maintenance_info WHERE FM_ORDER_ID LIKE "%TEST%"));
#删除事件表
DELETE FROM maintenance_event WHERE ORDER_ID IN(
	SELECT MAINTENANCE_ID FROM maintenance_info WHERE FM_ORDER_ID LIKE "%TEST%");
#删除步骤表
DELETE FROM maintenance_step WHERE MAINTENANCE_ID NOT IN(
	SELECT MAINTENANCE_ID FROM maintenance_info WHERE FM_ORDER_ID LIKE "%TEST%");
#删除工单表
DELETE FROM maintenance_work_order WHERE MAINTENANCE_ID IN(
	SELECT MAINTENANCE_ID FROM maintenance_info WHERE FM_ORDER_ID LIKE "%TEST%");
#删除信息表
DELETE FROM maintenance_info WHERE FM_ORDER_ID LIKE "%TEST%";

#############################################
#删除历史表
#############################################
DELETE FROM maintenance_event_log_history
DELETE FROM maintenance_event_history
DELETE FROM maintenance_step_history
DELETE FROM maintenance_work_order_history
DELETE FROM maintenance_info_history




#################################
#数据迁移
#################################

SELECT COUNT(*) FROM maintenance_info WHERE FM_ORDER_ID LIKE "%test%";
DELETE FROM `eba_work`.`maintenance_info`;
DELETE FROM `eba_work`.maintenance_event;
DELETE FROM `eba_work`.maintenance_

#工单
SELECT * FROM `eba_work_test`.`maintenance_work_order` WHERE SUB_STATUS =1020;

#信息
SELECT * FROM `eba_work_test`.`maintenance_info` WHERE MAINTENANCE_ID IN(
SELECT MAINTENANCE_ID FROM `eba_work_test`.`maintenance_work_order` WHERE SUB_STATUS =1020
);
#事件
SELECT * FROM eba_work_test.maintenance_event WHERE ORDER_ID IN(
SELECT MAINTENANCE_ID FROM `eba_work_test`.`maintenance_work_order` WHERE SUB_STATUS =1020
);
#步骤
SELECT * FROM `eba_work_test`.`maintenance_step` WHERE MAINTENANCE_ID IN(
SELECT MAINTENANCE_ID FROM `eba_work_test`.`maintenance_work_order` WHERE SUB_STATUS =1020
);

INSERT INTO `eba_work`.maintenance_work_order(SELECT * FROM `eba_work_test`.`maintenance_work_order` WHERE SUB_STATUS =1020);
INSERT INTO `eba_work`.`maintenance_info`(SELECT * FROM `eba_work_test`.`maintenance_info` WHERE MAINTENANCE_ID IN(
SELECT MAINTENANCE_ID FROM `eba_work_test`.`maintenance_work_order` WHERE SUB_STATUS =1020
));
INSERT INTO `eba_work`.maintenance_event(SELECT * FROM eba_work_test.maintenance_event WHERE ORDER_ID IN(
SELECT MAINTENANCE_ID FROM `eba_work_test`.`maintenance_work_order` WHERE SUB_STATUS =1020
));

INSERT INTO `eba_work`.`maintenance_step`(SELECT * FROM `eba_work_test`.`maintenance_step` WHERE MAINTENANCE_ID IN(
SELECT MAINTENANCE_ID FROM `eba_work_test`.`maintenance_work_order` WHERE SUB_STATUS =1020
));

