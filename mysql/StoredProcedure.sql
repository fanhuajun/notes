BEGIN
	DECLARE ls_identityId varchar(50);
	DECLARE ls_manage_code varchar(100);
	DECLARE ls_manager_name varchar(100);
	DECLARE ld_month_date TIMESTAMP;
	DECLARE ld_create_date TIMESTAMP;
	
	DECLARE ln_cnt INTEGER;
	DECLARE ls_current varchar(100);
	DECLARE ld_startdate TIMESTAMP;
	DECLARE ld_enddate TIMESTAMP;
	
	DECLARE ls_currentmonth varchar(50) default CONCAT(DATE_FORMAT(NOW(),'%Y-%m') , '-01');
	DECLARE ld_currentdate TIMESTAMP DEFAULT CONCAT(DATE_FORMAT(NOW(),'%Y-%m') , '-01');
	DECLARE done int;

	DECLARE cur_identity CURSOR for select distinct manager_idcard from tbl_manage_manager_change;

	DECLARE cur_positions_hisotry cursor for 
			select t.manage_code, manager_name, month_date  
			from tbl_manage_manager_change t where manager_idcard = ls_identityId
			group by t.manage_code, month_date order by t.manage_code, month_date;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	delete from tbl_logs;
	commit;
	SET AUTOCOMMIT=0;
	delete from tbl_manage_project_parter_change where parter_level = li_parterlevel;
	
	OPEN cur_identity;
	identity_loop:LOOP  -- loop manager identity codes
		FETCH cur_identity INTO ls_identityId;
		IF done = 1 THEN
				LEAVE identity_loop;
		END IF;
		
		SELECT COUNT(*) INTO ln_cnt FROM TBL_USER_INFO WHERE IDENTITYID = ls_identityId;
		IF ln_cnt > 0 THEN
			-- process each managers position history
			-- 根据身份证查询当前用户的任职历史
			set ls_current = null;
			OPEN cur_positions_hisotry;
			position_loop:LOOP
				FETCH cur_positions_hisotry INTO ls_manage_code, ls_manager_name, ld_month_date;
				IF done=1 THEN
						LEAVE position_loop;
				END IF;
				call log(concat(ls_manager_name,',',ls_identityId, ',',ls_manage_code,  ',', DATE_FORMAT(ld_month_date,'%Y-%m-%d'),  ',',DATE_FORMAT(ld_startdate,'%Y-%m-%d'), ',', DATE_FORMAT(ld_enddate,'%Y-%m-%d')));
				IF (ls_current is null) THEN
					set ls_current = ls_manage_code;
			-- 开始日期置为空
					set ld_startdate = ld_month_date; 
					set ld_enddate = ld_month_date;

				ELSEIF ls_current = ls_manage_code THEN -- 任职相同的管理中心，但是日期不连续，日期重新计算
						IF ld_month_date = ld_enddate or (ld_month_date = date_add(ld_enddate, interval 1 month) )  then  
							-- 结束日期+1个月 或结束日期 == 当前日期，则表示连续的任职
							set ld_enddate = ld_month_date;
						ELSE
							IF ld_enddate = ls_currentmonth then  -- 结束日期为当月，则设置ld_enddate为空
								set ld_enddate = null;
							END IF;
							call log(concat('commit---',ls_manager_name,',',ls_identityId, ',',ls_current,  ',', DATE_FORMAT(ld_month_date,'%Y-%m-%d'),  ',',DATE_FORMAT(ld_startdate,'%Y-%m-%d'), ',', DATE_FORMAT(ld_enddate,'%Y-%m-%d')));
							
							-- insert 数据
							insert into tbl_manage_project_parter_change
								( parter_level, target_code, staff_code, staff_name, identity_card, position_name, 
										start_time, end_time, parter_changes, create_time ,update_time)
								values 
								(li_parterlevel, ls_current, MD5(ls_identityId), ls_manager_name, ls_identityId, null,
									ld_startdate, ld_enddate, 0, ld_currentdate, ld_currentdate
								);
								-- 将开始日期置为当前日期，将结束日期置null
								set ld_startdate = ld_month_date;
								set ld_enddate = ld_month_date;
						END IF;
				ELSE   -- 任职不同的管理中心，日期重新计算
							IF ld_enddate = ls_currentmonth then  -- 结束日期为当月，则设置ld_enddate为空
								set ld_enddate = null;
							END IF;
							call log(concat('commit---',ls_manager_name,',',ls_identityId, ',',ls_current,  ',', DATE_FORMAT(ld_month_date,'%Y-%m-%d'),  ',',DATE_FORMAT(ld_startdate,'%Y-%m-%d'), ',', DATE_FORMAT(ld_enddate,'%Y-%m-%d')));
							-- insert 数据
							insert into tbl_manage_project_parter_change
								( parter_level, target_code, staff_code, staff_name, identity_card, position_name, 
										start_time, end_time, parter_changes, create_time ,update_time)
								values 
								(li_parterlevel, ls_current, MD5(ls_identityId), ls_manager_name,ls_identityId, null,
									ld_startdate, ld_enddate, 0, ld_currentdate, ld_currentdate
								);
								-- 将开始日期置为当前日期，将结束日期置null
								set ld_startdate = ld_month_date;
								set ld_enddate = ld_month_date;
								set ls_current = ls_manage_code;
				END IF;
			END LOOP position_loop;
			CLOSE cur_positions_hisotry;
			call log(concat('commit---',ls_manager_name,',',ls_identityId, ',',ls_current,  ',', DATE_FORMAT(ld_month_date,'%Y-%m-%d'),  ',',DATE_FORMAT(ld_startdate,'%Y-%m-%d'), ',', DATE_FORMAT(ld_enddate,'%Y-%m-%d')));
			IF ld_enddate = ls_currentmonth then  -- 结束日期为当月，则设置ld_enddate为空
				set ld_enddate = null;
			END IF;
			-- insert 数据
			insert into tbl_manage_project_parter_change
				( parter_level, target_code, staff_code, staff_name, identity_card, position_name, 
						start_time, end_time, parter_changes, create_time ,update_time)
				values 
				(li_parterlevel, ls_current, MD5(ls_identityId), ls_manager_name,ls_identityId, null,
					ld_startdate, ld_enddate, 0, ld_currentdate, ld_currentdate
				);
				
			-- end process each managers position history
		END IF;
		
    set done = 0;
	END LOOP identity_loop;
	CLOSE cur_identity;
	commit;
	SET AUTOCOMMIT=1;

end