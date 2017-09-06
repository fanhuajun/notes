<script>
	$(function() {
		console.log("daylist");
		var thisday;

		$("#attendanceStatusDay").change(function() {
			searchDayAttendance();
		})

		// 弹出层代码
		$(".userinfo").click(function() {
			console.log("daylist");

			var attendanceStatus = $(this).attr("attendanceStatus");
			$("#attendanceStatusDay").val(attendanceStatus);

			thisday = this;
			searchDayAttendance();

		})
		function searchDayAttendance() {
			postUrl = "${ctx}/attendance/day/list/data";
			bannerListTmp = "userDayListTmp";
			bannerList = "#Popuptable"
			pageList.init(onPageClick, '#dayListPage');
			var pageSize = 2;

			postData = {
				"userId" : $(thisday).attr("userid"),
				"attendanceMonthId" : $(thisday).attr("monthid"),
				"pageSize" : pageSize,
				"attendanceStatus" : $("#attendanceStatusDay").val()
			}
			onlineOperate();//页面加载默认加载数据
		}

		function onlineOperate() {

			postData.currentPage = pageList.getCurrentPage();

			var res = getDataAjax(postUrl, postData)
			if (!res) {
				return false;
			}

			//$("#totalRow").html("共 " + res.data.totalRow + " 条记录");
			pageList.setTotalPage(res.data.totalRow, pageSize);

			//DOM操作显示装载的数据内容
			$(bannerList).html(template(bannerListTmp, {
				sub : res.data.attendanceMonthList
			}));
		}

		//点击分页执行的方法 传递当前点击的页面
		function onPageClick(event, originalEvent, type, page) { //点击li时传递的当前页和每页显示条数
			onlineOperate();
		}
		function getDataAjax(url, postData) {
			var data = null;
			$.ajax({
				url : postUrl,
				data : JSON.stringify(postData),
				async : false,
				type : 'POST',
				dataType : 'JSON',
				contentType : "application/json; charset=utf-8",
				success : function(res) {
					if (res.status == '0') {
						console.log(res);
						return false;
					} else {
						data = res;
					}

				}
			});
			return data;
		}

	})
	$(function() {
		
		selectFn.getData(seledata);
		getCombineCode();

		var postData;//分页模板需要修改的数据
		var postUrl = "${ctx}/attendance/month/list/data";
		var bannerListTmp = "monthlyListTmp";
		var bannerList = "#monthlytable"
		pageList.init(onPageClick, '#monthlyListPage');
		var pageSize = 2;

		$("#templateList").attr("id", bannerListTmp);//修改模板js id
		init();//初始条件
		postData.currentPage = 1;

		onlineOperate(1, postData, bannerListTmp, 'data.json', bannerList);//页面加载默认加载数据

		var thisday;

		$("#attendanceStatusDay").change(function() {
			searchDayAttendance();
		})

		//点击查询 改变查询条件
		$("#changeSearchCondition").click(function() {
			init();

			onlineOperate();

		})

		//点击分页执行的方法 传递当前点击的页面
		function onPageClick(event, originalEvent, type, page) { //点击li时传递的当前页和每页显示条数
			onlineOperate();
		}

		function onlineOperate() {

			postData.currentPage = pageList.getCurrentPage();

			var res = getDataAjax(postUrl, postData)
			if (!res) {
				return false;
			}

			$("#totalRow").html("共 " + res.data.totalRow + " 条记录");
			pageList.setTotalPage(res.data.totalRow, pageSize);

			//DOM操作显示装载的数据内容
			$(bannerList).html(template(bannerListTmp, {
				sub : res.data.attendanceMonthList
			}));

		}

		function getDataAjax(url, postData) {
			var data = null;
			$.ajax({
				url : postUrl,
				data : JSON.stringify(postData),
				async : false,
				type : 'POST',
				dataType : 'JSON',
				contentType : "application/json; charset=utf-8",
				success : function(res) {
					if (res.status == '0') {
						console.log(res);
						return false;
					} else {
						data = res;
					}

				}
			});
			return data;
		}

		function getCombineCode() {
			var combineCode = $('#county').find('option:selected').attr(
					'data-code');
			if (combineCode == -1 || combineCode == null || combineCode == '-1') {
				combineCode = $('#city').find('option:selected').attr(
						'data-code');
				if (combineCode == -1 || combineCode == null
						|| combineCode == '-1') {
					combineCode = $('#province').find('option:selected').attr(
							'data-code');
					if (combineCode == -1 || combineCode == null
							|| combineCode == '-1') {
						//debugger;
						layer.alert("城市不能为空！");
						return;
					}
				}
			}
			return combineCode;
		}

		function init() {
			postData = {
				"pageSize" : pageSize,
				"monthTime" : $("#attendanceMonth").val(),
				"userName" : $("#userName").val(),
				"attendanceStatus" : $("#attendanceStatus").val(),
				"orgNo" : getCombineCode()
			}
		}

		$('.form_date').datetimepicker({
			language : 'zh-CN',
			autoclose : 1,
			todayHighlight : 1,
			startView : 3,
			minView : 3,
			forceParse : 0
		})
	})
</script>