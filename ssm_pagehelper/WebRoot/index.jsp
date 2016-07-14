v<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1">
<meta http-equiv="description" content="This is my page">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="bootstrap/3.3.5/css/bootstrap.min.css">
<!-- link font icon -->
<!-- <link rel="stylesheet" href="awesome/css/font-awesome.min.css"> -->


<title>spring + springmvc + mybatis Demo -- insertPerson</title>

<script type="text/javascript" charset="utf-8"
	src="./jquery/1.11.3/jquery-1.11.3.min.js"></script>
<!-- 日历 -->
<script type="text/javascript" src="calendar/WdatePicker.js"></script>
<script type="text/javascript">
	$(function() {
		/*
		 * 查询所有人
		 */
		$("#query_all_person").click(function() {
			var pageNum = "1";
			var pageSize = "2";
			queryAllPerson(pageNum, pageSize);
		});
		/*
		 * 增加人
		 */
		$("#add_person").click(function() {
			$("#edit_area_div").html("数据正在玩命加载中......");
			$("#edit_area_div").load("jsp/insertPerson.jsp");
		});
	});
	/*
	 * 分页查询所有人
	 */
	function queryAllPerson(pageNum, pageSize){
		$("#edit_area_div").html("数据正在玩命加载中......");
		$("#edit_area_div").load("person/query.action?pageNum="+pageNum+"&pageSize="+pageSize);
	}
</script>
</head>

<body>


	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3>spring + springmvc + mybatis Demo</h3>
				<button id="query_all_person">query all person</button>
				<button id="add_person">add person</button>

				<br /> <br />
				<div id="edit_area_div"></div>
			</div>
		</div>
	</div>

</body>
</html>
