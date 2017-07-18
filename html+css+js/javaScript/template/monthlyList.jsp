<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/common/base.jsp" %>

<div class="pagemain" >
    <div class="container">
        <div class="row">
            <div class="x_title">
                <h5>���ڹ���</h5>
                <div class="clearfix"></div>
            </div>
            <div class="x_content" style="margin-top:0px !important;">
                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                        <li role="presentation" class="active"><a href="javascript:void(0);" data-url="${ctx}/attendance/month/list" id="tab1"onclick="loadPage(this)">���ڼ�¼</a>
                        </li>
                        <li role="presentation" class=""><a href="javascript:void(0);" data-url="${ctx}/attendance/signInfo/list" id="tab2" onclick="loadPage(this)">ǩ����¼</a>
                        </li>
                        <li role="presentation" class=""><a href="javascript:void(0);" data-url="${ctx}/attendance/leaveMsg/list" id="tab3" onclick="loadPage(this)">���֪��</a>
                        </li>
                    </ul>
                    <div id="tabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="" style="margin-bottom:0px;">
                                    <div class="form-group" id="selects">
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">��������</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <select id="province" class="selectpicker show-tick form-control" data-size="10">
                                            </select>
                                        </div>
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">����Ƭ��</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <select id="city" class="selectpicker show-tick form-control" data-size="10">
                                            </select>
                                        </div>
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">������Ŀ</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <select id="county" class="selectpicker show-tick form-control" data-size="10">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12 ">����ʱ��</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <div class="input-group date form_date" data-date="" data-date-format="yyyy��mm��" data-link-field="attendanceMonth" data-link-format="yyyymm">
                                                <input id="monthTime" class="form-control" size="16" type="text" value="" readonly>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                            <input type="hidden" id="attendanceMonth" value="" />
                                        </div>
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">������</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <input id="userName" class="form-control col-md-7 col-xs-12" required="required" type="text">
                                        </div>
                                        <label class="control-label col-md-1 col-sm-1 col-xs-12">����״̬</label>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <select id="county" class="selectpicker show-tick form-control" data-size="10">
                                            </select>
                                        </div>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <button type="button" onclick="changeSearchCondition()" class="btn btn-primary">�� ѯ</button>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12 col-xs-12 mystyle">
                                            <button type="submit" class="btn btn-primary btn-xs">��������</button>
                                            <span class="pull-right" id="totalNum">�� 10386 ����¼</span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table id="datatable-buttons" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>�����·�</th>
                                    <th>������</th>
                                    <th>����״̬</th>
                                    <th>��������</th>
                                    <th>����Ƭ��/��Ŀ</th>
                                    <th>��������</th>
                                    <th>���֪������</th>
                                    <th>�ٵ�����</th>
                                    <th>���˴���</th>
                                    <th>��������</th>
                                    <th>����</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- <tr>
                                    <td>9��</td>
                                    <td>����</td>
                                    <td>����</td>
                                    <td>����</td>
                                    <td>���ڽ�ɫ��԰</td>
                                    <td>21</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td class="mystyle parentIframe"><a id="test" href="#" data-toggle="modal" data-target="#myModal">��������</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="" href="#" data-toggle="modal" data-target="#myModal">�쳣��¼</a></td>
                                </tr> -->
                                <!-- <tr>
                                    <td>9��</td>
                                    <td>����</td>
                                    <td>����</td>
                                    <td>����</td>
                                    <td>���ڽ�ɫ��԰</td>
                                    <td>21</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td class="mystyle parentIframe"><a id="test" href="#" data-toggle="modal" data-target="#myModal">��������</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="" href="#" data-toggle="modal" data-target="#myModal">�쳣��¼</a></td>
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
                        <h4 class="modal-title" id="myModalLabel">��������</h4>
                    </div>
                    <div class="modal-body">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>
                        <button type="button" class="btn btn-primary">����</button>
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
                                    <td class="mystyle parentIframe"><a id="test" href="#" data-toggle="modal" data-target="#myModal">��������</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="" href="#" data-toggle="modal" data-target="#myModal">�쳣��¼</a></td>
                                </tr>
    {{/each}}
</script>	   


<script>

$(function(){
	selectFn.getData(seledata);
	selectFn.selRole(roledata);
	
	
    
    })




    //��ҳģ����Ҫ�޸ĵ�����
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
		    			alert("���в���Ϊ�գ�");
		    			return ;
		    		}
		    	}
		    }
		    return combineCode;
  	}
  	
  	function init(){
  		onData = {
  				"pageSize" : 10,
  				"currentPage": 1,   //Ĭ�����õĵ�ǰҳ��ÿҳ��ʾ����
  				"monthTime" : $("#monthTime").val(),
  				"userName" : $("#userName").val(),
  				"attendanceStatusStr" : $("#attendanceStatusStr").val(),
  				"orgNo":getCombineCode()
  			}
  		console.log("getCombineCode():"+getCombineCode());
  	  	}
  	 //�޸�ģ��js id
	   //��ʼ����
	   init();
	   
	   //�������ģ��id
    var bannerListTmp = "List"+Math.random(100000);
	   $("#templateList").attr("id",bannerListTmp);
    //ҳ�����Ĭ�ϼ�������
    onlineOperate(1,onData,bannerListTmp,'data.json','tbody');
 
	    //�����ѯ �ı��ѯ����
	  	function changeSearchCondition(){
	  		init();
	  	  	onlineOperate(1,onData,bannerListTmp,'data.json','tbody');
	  	}
	
 //�����ҳִ�еķ��� ���ݵ�ǰ�����ҳ��
 function onPageClick(event, originalEvent, type, page) { //���liʱ���ݵĵ�ǰҳ��ÿҳ��ʾ����
    onlineOperate(page,onData,bannerListTmp,'data.json','tbody');
 };
 /*ע��::::: <ul class="pagination"></ul> ����һ��Ϊ��pagination*/
 // ��ҳ
 /*
      ����˵����
  page: ��ǰ��ʾҳ��
  pageSize: ÿҳ��ʾ����
  tmplId: ʹ��ģ���id
  url: �ӿڵ�ַ
  domId: �����Ⱦ�����ݵ�dom��Ӧid
   */   
 function onlineOperate(page,onData,tmplId,url,domId){
     console.log('��' + page + 'ҳ');
     onData.currentPage = page;
     
     $.ajax({
         url: postUrl,
         async : false,
         type : 'POST',
         dataType: 'json',
         data: onData,
         success:function(res){
             // data={data:"���ص���������",count:��������������}
             var data={count:res.data.totalRow/*��������������*/}
             //���ɷ�ҳ
             commonFn.setAjaxPaginator($('.pagination'),data,{currentPage: onData.currentPage, pageSize:onData.pageSize,onPageClicked: onPageClick});
             //DOM������ʾװ�ص���������
             $(domId).html(template(tmplId,{sub:res.data.data}));
             console.log("��ҳ���");
         }
     })
  }
    
</script>

