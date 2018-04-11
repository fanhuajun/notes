<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/base.jsp" %>

<div class="pagemain" >
    <div class="container">
        <div class="row">
            <div class="x_title">
                <h5>考勤管理</h5>
                <div class="clearfix"></div>
            </div>
            <div class="x_content" style="margin-top:0px !important;">
                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                        <li role="presentation" class="active"><a href="javascript:void(0);" data-url="${ctx}/attendance/month/list" id="tab1"onclick="loadPage(this)">考勤记录</a>
                        </li>
                        <li role="presentation" class=""><a href="javascript:void(0);" data-url="${ctx}/attendance/signInfo/list" id="tab2" onclick="loadPage(this)">签到记录</a>
                        </li>
                        <li role="presentation" class=""><a href="javascript:void(0);" data-url="${ctx}/attendance/leaveMsg/list" id="tab3" onclick="loadPage(this)">请假知会</a>
                        </li>
                    </ul>
                    <div id="tabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="" style="margin-bottom:0px;">
                                    <div class="form-group" id="selects">
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">所属城市</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <select id="province" class="selectpicker show-tick form-control" data-size="10">
                                            </select>
                                        </div>
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">所属片区</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <select id="city" class="selectpicker show-tick form-control" data-size="10">
                                            </select>
                                        </div>
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">所属项目</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <select id="county" class="selectpicker show-tick form-control" data-size="10">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12 ">考勤时间</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <div class="input-group date form_date" data-date="" data-date-format="yyyy年mm月" data-link-field="attendanceMonth" data-link-format="yyyymm">
                                                <input id="monthTime" class="form-control" size="16" type="text" value="" readonly>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                            <input type="hidden" id="attendanceMonth" value="" />
                                        </div>
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">考勤人</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <input id="userName" class="form-control col-md-7 col-xs-12" required="required" type="text">
                                        </div>
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">考勤状态</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <select id="county" class="selectpicker show-tick form-control" data-size="10">
                                            </select>
                                        </div>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <button type="button" onclick="changeSearchCondition()" class="btn btn-primary">查 询</button>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12 col-xs-12 mystyle">
                                            <button type="submit" class="btn btn-primary btn-xs">导出报表</button>
                                            <span class="pull-right" id="totalNum">共 10386 条记录</span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table id="datatable-buttons" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>考勤月份</th>
                                    <th>考勤人</th>
                                    <th>考勤状态</th>
                                    <th>所属城市</th>
                                    <th>所属片区/项目</th>
                                    <th>出勤天数</th>
                                    <th>请假知会天数</th>
                                    <th>迟到次数</th>
                                    <th>早退次数</th>
                                    <th>旷工天数</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- <tr>
                                    <td>9月</td>
                                    <td>张三</td>
                                    <td>正常</td>
                                    <td>深圳</td>
                                    <td>深圳金色家园</td>
                                    <td>21</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td class="mystyle parentIframe"><a id="test" href="#" data-toggle="modal" data-target="#myModal">考勤详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="" href="#" data-toggle="modal" data-target="#myModal">异常记录</a></td>
                                </tr> -->
                                <!-- <tr>
                                    <td>9月</td>
                                    <td>张三</td>
                                    <td>正常</td>
                                    <td>深圳</td>
                                    <td>深圳金色家园</td>
                                    <td>21</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td class="mystyle parentIframe"><a id="test" href="#" data-toggle="modal" data-target="#myModal">考勤详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="" href="#" data-toggle="modal" data-target="#myModal">异常记录</a></td>
                                </tr> -->
                                </tbody>
                            </table>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="page pull-right">
                                        <ul class="pagination pagination-sm pull-right" style="margin:0px">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width:850px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">考勤详情</h4>
                    </div>
                    <div class="modal-body">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">保存</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
<script type="text/html" id="templateList">
    {{each sub as value i }}
                               <tr>
                                    <td>{{value.monthTime}}</td>
                                    <td>{{value.userName}}</td>
                                    <td>{{value.attendanceStatusStr}}</td>
                                    <td>{{value.city}}</td>
                                    <td>{{value.area}}</td>
                                    <td>{{value.attendanceDays}}</td>
                                    <td>{{value.leaveDays}}</td>
                                    <td>{{value.lateTimes}}</td>
                                    <td>{{value.earlyTimes}}</td>
                                    <td>{{value.absentDays}}</td>
                                    <td class="mystyle parentIframe"><a id="test" href="#" data-toggle="modal" data-target="#myModal">考勤详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="" href="#" data-toggle="modal" data-target="#myModal">异常记录</a></td>
                                </tr>
    {{/each}}
</script>	   


<script>

$(function(){
	selectFn.getData(seledata);
	selectFn.selRole(roledata);
	
	
    
    })




    //分页模板需要修改的数据
  	var onData;
  	var postUrl = "${ctx}/attendance/month/list/data";
  	function getCombineCode(){
	  	var combineCode = $('#county').find('option:selected').attr('data-code');
		    if(combineCode == -1 || combineCode == null || combineCode == '-1'){
		    	combineCode = $('#city').find('option:selected').attr('data-code');
		    	if(combineCode == -1 || combineCode == null || combineCode == '-1'){
		    		combineCode = $('#province').find('option:selected').attr('data-code');
		    		if(combineCode == -1 || combineCode == null || combineCode == '-1'){
		    			//debugger;
		    			alert("城市不能为空！");
		    			return ;
		    		}
		    	}
		    }
		    return combineCode;
  	}
  	
  	function init(){
  		onData = {
  				"pageSize" : 10,
  				"currentPage": 1,   //默认配置的当前页和每页显示条数
  				"monthTime" : $("#monthTime").val(),
  				"userName" : $("#userName").val(),
  				"attendanceStatusStr" : $("#attendanceStatusStr").val(),
  				"orgNo":getCombineCode()
  			}
  		console.log("getCombineCode():"+getCombineCode());
  	  	}
  	 //修改模板js id
	   //初始条件
	   init();
	   
	   //随机产生模板id
    var bannerListTmp = "List"+Math.random(100000);
	   $("#templateList").attr("id",bannerListTmp);
    //页面加载默认加载数据
    onlineOperate(1,onData,bannerListTmp,'data.json','tbody');
 
	    //点击查询 改变查询条件
	  	function changeSearchCondition(){
	  		init();
	  	  	onlineOperate(1,onData,bannerListTmp,'data.json','tbody');
	  	}
	
 //点击分页执行的方法 传递当前点击的页面
 function onPageClick(event, originalEvent, type, page) { //点击li时传递的当前页和每页显示条数
    onlineOperate(page,onData,bannerListTmp,'data.json','tbody');
 };
 /*注意::::: <ul class="pagination"></ul> 类名一定为：pagination*/
 // 分页
 /*
      参数说明：
  page: 当前显示页码
  pageSize: 每页显示条数
  tmplId: 使用模板的id
  url: 接口地址
  domId: 存放渲染后数据的dom对应id
   */   
 function onlineOperate(page,onData,tmplId,url,domId){
     console.log('第' + page + '页');
     onData.currentPage = page;
     
     $.ajax({
         url: postUrl,
         async : false,
         type : 'POST',
         dataType: 'json',
         data: onData,
         success:function(res){
             // data={data:"返回的数据内容",count:返回数据总条数}
             var data={count:res.data.totalRow/*返回数据总条数*/}
             //生成分页
             commonFn.setAjaxPaginator($('.pagination'),data,{currentPage: onData.currentPage, pageSize:onData.pageSize,onPageClicked: onPageClick});
             //DOM操作显示装载的数据内容
             $(domId).html(template(tmplId,{sub:res.data.data}));
             console.log("分页完成");
         }
     })
  }
    
</script>

