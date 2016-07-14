<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<title>spring + springmvc + mybatis Demo -- insertPerson</title>

<!-- <script type="text/javascript" charset="utf-8" src="./jquery/1.11.3/jquery-1.11.3.min.js"></script> -->
<!-- 日历 -->
<!-- <script type="text/javascript" src="calendar/WdatePicker.js"></script> -->
<script type="text/javascript">
	$(function() {
		$("#save_person").click(function() {
			var action = "person/save.action";
			var name = $("#name").val();
			var age = $("#age").val();
			var birthday = $("#birthday").val();
			var params = {
				"name" : name,
				"age" : age,
				"birthday" : birthday
			};
			//$("#person_form").serialize()
			$.post(action, params, savePerson_success_callback);
		});
		function savePerson_success_callback(returnData) {
			//alert(returnData);
			var obj = $.parseJSON(returnData);
			//alert(obj.username);
			$("#person").empty();
			var str = "<b>保存成功！</b><br /><br />";
			var htmlStr = "" + "<b>id:</b>" + obj.id + ";<br />"
					+ "<b>name:</b>" + obj.name + ";<br />" + "<b>age:</b>"
					+ obj.age + ";<br />" + "<b>saveDate:</b>"
					+ datetimeFormat(obj.birthday) + ";<br />";
			$("#person").append(str + htmlStr);
		}
		;
	});

	/*
	 * 转换为 yyyy-MM-dd HH:mm:ss 格式 
	 */
	function datetimeFormat(datetime) {
		var date = new Date(datetime);
		var y = date.getFullYear();
		var m = date.getMonth();
		var month = m + 1; // 月份是从0开始计数
		var d = date.getDate();
		if (month.toString().length == 1) {
			month = "0" + month.toString();
		}
		if (d.toString().length == 1) {
			d = "0" + d.toString();
		}
		var h = date.getHours();
		var m = date.getMinutes();
		var s = date.getSeconds();
		if (h.toString().length == 1) {
			h = "0" + h.toString();
		}
		if (m.toString().length == 1) {
			m = "0" + m.toString();
		}
		if (s.toString().length == 1) {
			s = "0" + s.toString();
		}
		return y + "-" + month + "-" + d + " " + h + ":" + m + ":" + s;
	};
</script>

</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3>Add Person</h3>
				<form id="person_form">
					<!-- <input type="text" id="id" name="person.id" value="" /> -->
					name:<input type="text" id="name" name="name" value="" /> age:<input
						type="text" id="age" name="age" value="" /> birthday:<input
						type="text" id="birthday" name="birthday" class="Wdate" value=""
						readonly onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				</form>
				<button id="save_person">save person</button>
				<br /> <br /> <span id="person"></span>
			</div>
		</div>
	</div>
</body>
</html>
