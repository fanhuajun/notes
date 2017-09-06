
#页面跳转：3
#ajax:   4

#regularExpression
#(?<=')\w*?(?=')


INSERT  INTO  t_web_source (S_ID,P_S_ID,S_NAME,S_TYPE,S_URL,S_STATUS,S_ORDER,S_TRACE)VALUES


#人员管理--人员列表
(3101,310,'用户列表dom',3,'/man/user/list',0,1,'-1-300-310-3101-'),
(3102,310,'用户列表表格数据ajax',4,'/man/user/list/data',0,2,'-1-300-310-3102-'),
(3103,310,'锁定用户请求ajax',4,'/man/user/lock',0,3,'-1-300-310-3103-'),
(3104,310,'修改用户dom',3,'/man/user/update/page',0,4,'-1-300-310-3103-'),
(3105,310,'修改用户获取用户数据ajax',4,'/man/user/update/detail',0,5,'-1-300-310-3103-'),
(3106,310,'添加用户页面dom',3,'/man/user/update/page',0,6,'-1-300-310-3103-'),
(3107,310,'添加用户页面ajax',4,'/man/user/add',0,7,'-1-300-310-3103-'),
(3108,310,'用户详情页面dom',3,'/man/user/detail',0,8,'-1-300-310-3103-'),
(3109,310,'用户操作日志表格数据ajax',4,'/man/user/opLogList/data',0,9,'-1-300-310-3103-'),
(31010,310,'修改密码页面dom',3,'/man/user/passwd/page',0,10,'-1-300-310-3103-'),
(31011,310,'修改密码ajax',4,'/man/user/passwd/data',0,11,'-1-300-310-3103-'),
(31012,310,'模板导入用户ajax',4,'/man/user/import/excel',0,12,'-1-300-310-3103-'),
(31013,310,'导出用户ajax',4,'/man/user/export/excl',0,13,'-1-300-310-3103-'),
(31014,310,'所有技能列表ajax',4,'/man/user/skill/allList',0,14,'-1-300-310-3103-'),
(31015,310,'当前登录用户组织机构下拉列表ajax',4,'/man/user/orgTree',0,15,'-1-300-310-3103-'),
(31016,310,'所有技能列表ajax',4,'/man/user/allOrgTree',0,16,'-1-300-310-3103-'),

#人员管理--考勤管理 
(3201,320,'月度考勤页面dom',3,'/man/attendance/month/list',0,1,'-1-300-320-3201-'),
(3202,320,'月度考勤页面表格数据获取ajax',4,'/man/attendance/month/list/data',0,2,'-1-300-320-3202-'),
(3203,320,'每日考勤页面dom',3,'/man/attendance/day/list',0,3,'-1-300-320-3203-'),
(3204,320,'每日考勤页面表格数据获取ajax',4,'/man/attendance/day/list/data',0,4,'-1-300-320-3204-'),
(3205,320,'导出考勤excel',4,'/man/attendance/month/export/excl',0,5,'-1-300-320-3205-'),
(3206,320,'签到记录页面dom',3,'/man/attendance/signInfo/list',0,6,'-1-300-320-3206-'),
(3207,320,'签到记录表格数据获取ajax',4,'/man/attendance/signInfo/list/data',0,7,'-1-300-320-3207-'),
(3208,320,'请假知会页面dom',3,'/man/attendance/leaveMsg/list',0,8,'-1-300-320-3208-'),
(3209,320,'请假知会列表数据ajax',4,'/man/attendance/leaveMsg/list/data',0,9,'-1-300-320-3109-'),

#人员管理--值班
(3501,350,'值班表dom',3,'/man/attendance/duty',0,1,'-1-300-350-3501-'),
(3502,350,'值班表数据获取ajax',4,'/man/attendance/duty/data',0,2,'-1-300-350-3502-'),
(3503,350,'添加值班表页面dom',3,'/man/attendance/duty/add/page',0,3,'-1-300-350-3503-'),
(3504,350,'添加值班表信息ajax',4,'/man/attendance/duty/add/data',0,4,'-1-300-350-3504-'),
(3505,350,'值班表选择用户浮层页面dom',3,'/man/attendance/duty/userList',0,5,'-1-300-350-3505-'),
(3506,350,'值班表选择用户浮层页面表格数据ajax',4,'/man/attendance/duty/userList/data',0,6,'-1-300-350-3506-'),
(3507,350,'删除值班表ajax',4,'/man/attendance/duty/delete',0,7,'-1-300-350-3507-'),
(3508,350,'修改值班表dom',3,'/man/attendance/duty/update/page',0,8,'-1-300-350-3508-'),
(3509,350,'修改值班表ajax',4,'/man/attendance/duty/update/data',0,9,'-1-300-350-3509-'),
(35010,350,'修改值班表获取数据ajax',4,'/man/attendance/duty/update/detail',0,10,'-1-300-350-35010-'),
(35011,350,'导出值班excel ajax',4,'/man/attendance/duty/export/excl',0,11,'-1-300-350-35011-'),



#系统设置--城市和项目管理
(4101,410,'机构列表dom',3,'/man/org/list/page',0,1,'-1-400-410-4101-'),
(4102,410,'机构列表表格数据ajax',4,'/man/org/list/data',0,2,'-1-400-410-4102-'),
(4103,410,'地图dom',3,'/man/org/map',0,3,'-1-400-410-4103-'),
(4104,410,'查询机构名称是否重复ajax',4,'/man/org/name',0,4,'-1-400-410-4104-'),
(4105,410,'删除机构ajax',4,'/man/org/delete',0,5,'-1-400-410-4103-'),
(4106,410,'新增项目机构dom',3,'/man/org/project/add/page',0,6,'-1-400-410-4105-'),
(4107,410,'新增项目机构ajax',4,'/man/org/project/add/data',0,7,'-1-400-410-4106-'),
(4108,410,'查询项目机构信息ajax',4,'/man/org/project/data',0,8,'-1-400-410-4107-'),
(4109,410,'修改项目机构dom',3,'/man/org/project/update/page',0,9,'-1-400-410-4108-'),
(41010,410,'修改项目机构ajax',4,'/man/org/project/update/data',0,10,'-1-400-410-4109-'),
(41011,410,'新增城市机构dom',3,'/man/org/city/add/page',0,11,'-1-400-410-41010-'),
(41012,410,'新增城市机构ajax',44,'/man/org/city/add/data',0,12,'-1-400-410-41011-'),
(41013,410,'查询城市机构信息ajax',3,'/man/org/city/data',0,13,'-1-400-410-41012-'),
(41014,410,'修改城市机构dom',3,'/man/org/city/update/page',0,14,'-1-400-410-41013-'),
(41015,410,'修改城市机构ajax',4,'/man/org/city/update/data',0,15,'-1-400-410-41014-'),
(41016,410,'级联菜单：城市列表',4,'/man/org/cascade/city',0,16,'-1-400-410-41015-'),
(41017,410,'级联菜单：下级机构',4,'/man/org/cascade/sub',0,17,'-1-400-410-41016-'),

#系统设置--角色管理
(4201,420,'角色管理页面dom',3,'/man/role/list',0,1,'-1-300-420-4201-'),
(4202,420,'角色管理数据ajax',4,'/man/role/list/data',0,2,'-1-300-420-4202-'),
(4203,420,'修改角色页面dom',3,'/man/role/update/page',0,3,'-1-300-420-4203-'),
(4204,420,'修改角色ajax',4,'/man/role/update/data',0,4,'-1-300-420-4204-'),
(4205,420,'获取修改角色的所有资源ajax',4,'/man/role/user/resource',0,5,'-1-300-420-4205-'),
(4206,420,'新增角色页面dom',3,'/man/role/add/page',0,6,'-1-300-420-4206-'),
(4207,420,'新增角色ajax',4,'/man/role/add/ajax',0,7,'-1-300-420-4207-'),
(4208,420,'删除角色ajax',4,'/man/role/delete',0,8,'-1-300-420-4208-'),
(4209,420,'获取所有的资源信息ajax',4,'/man/role/allResource',0,9,'-1-300-420-4209-'),
(42010,420,'所有角色列表ajax',4,'/man/role/all',0,10,'-1-300-420-42010-'),

#系统设置--考勤设置
(4301,430,'考勤设置查看页面ajax',4,'/man/attendance/setting/data',0,1,'-1-300-430-4301-'),
(4302,430,'考勤设置查看页面dom',3,'/man/attendance/setting',0,2,'-1-300-430-4302-'),
(4303,430,'考勤设置更新ajax',4,'/man/attendance/setting/update',0,3,'-1-300-430-4303-'),

#appsource
#app--签到
(601,6,'附近项目列表',4,'man/app/signInfo/projectList',0,1,'-1-6-601-'),
(602,6,'','man/app/signInfo/sign',0,2,'-1-6-601-'),
(604,6,'发送签到知会',4,'man/app/signInfo/sendMsg',0,3,'-1-6-601-'),
(605,6,'个人签到记录',4,'man/app/signInfo/userSignList',0,4,'-1-6-601-'),
(606,6,'用户当前签到状态',4,'man/app/signInfo/state',0,5,'-1-6-601-'),
(607,6,'获取人员管理中每天签到记录数和每天旷工人数',4,'man/app/signInfo/count',0,6,'-1-6-601-'),

#app--人员管理
(701,7,'管理员获取人员列表',4,'man/app/user/userList',0,1,'-1-7-701-'),
(702,7,'用户操作日志',4,'man/app/user/opLogList',0,2,'-1-7-701-'),
(703,7,'修改用户信息',4,'man/app/user/userInfoUpdate',0,3,'-1-7-701-'),
(704,7,'冻结解冻用户',4,'man/app/user/lock',0,4,'-1-7-701-'),
(705,7,'获取用户组织机构树',4,'man/app/user/orgTree',0,5,'-1-7-701-'),

#app--考勤管理
(901,9,'月度考勤管理',4,'man/app/attendance/monthList',0,1,'-1-9-901-'),
(902,9,'个人月度考勤',4,'man/app/attendance/userMonthList',0,2,'-1-9-902-'),



#意见反馈
/*(3101,310,'意见反馈dom',3,'/man/suggest/page',0,1,'-1-300-310-3101-'),
(3101,310,'意见反馈ajax',3,'/man/suggest/add',0,1,'-1-300-310-3101-'),

#消息 (3101,310,'',3,'/man/',0,1,'-1-300-310-3101-'),
(3101,310,'消息列表页面dom',3,'/man/message/list',0,1,'-1-300-310-3101-'),
(3101,310,'消息列表数据ajax',3,'/man/message/list/data',0,1,'-1-300-310-3101-'),
(3101,310,'更新消息的阅读情况ajax',3,'/man/message/update/readFlag',0,1,'-1-300-310-3101-'),
(3101,310,'新消息数量ajax',3,'/man/message/newCount',0,1,'-1-300-310-3101-'),
(3101,310,'发布知会页面dom',3,'/man/message/publish/page',0,1,'-1-300-310-3101-'),
(3101,310,'发布知会ajax',3,'/man/message/publish/data',0,1,'-1-300-310-3101-'),

#工作记录
(3101,310,'工作记录返回ajax',3,'/man/workrecord/data',0,1,'-1-300-310-3101-'),
*/

