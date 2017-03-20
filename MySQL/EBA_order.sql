
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


