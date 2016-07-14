<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>spring + springmvc + mybatis Demo -- personList</title>
<script type="text/javascript">
	/*
	 * 点击编辑按钮执行此函数
	 * 	函数功能：把选中的一行改为可编辑状态
	 */
	function editFun(id) {
		$("#personList_table td input").attr("disabled", true);

		$("#personList_table td #name_" + id).attr("disabled", false);
		$("#personList_table td #age_" + id).attr("disabled", false);
		$("#personList_table td #birthday_" + id).attr("disabled", false);
	}
	/*
	 * 点击修改按钮执行此函数
	 * 	函数功能：提交编辑后的内容	ajax请求
	 */
	function modifyFun(id) {
		var name = $("#name_" + id).val();
		var age = $("#age_" + id).val();
		var birthday = $("#birthday_" + id).val();
		var action = "person/update.action";
		var params = {
			"id" : id,
			"name" : name,
			"age" : age,
			"birthday" : birthday
		};
		$.post(action, params, modifyPerson_success_callback);
	}
	/*
	 * 修改成功后的回调函数
	 */
	function modifyPerson_success_callback(returnData) {
		$("#personList_table td input").attr("disabled", true);

		//alert(returnData);
		var obj = $.parseJSON(returnData);
		alert(obj.result);
	}
	/*
	 * 点击删除按钮执行此函数
	 * 	函数功能：提交	ajax请求
	 */
	function deleteFun(id) {
		var action = "person/delete.action";
		var params = {
			"id" : id
		};
		$.post(action, params, deletePerson_success_callback);
	}
	/*
	 * 删除成功后的回调函数
	 */
	function deletePerson_success_callback(returnData) {
		//alert(returnData);
		var obj = $.parseJSON(returnData);
		if (obj.result == "success") {
			$("#person_tr_" + obj.personId).remove();
		} else {
			alert(obj.result);
		}
	}
</script>
</head>

<body>

	<h3>All Person</h3>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
			
				<table class="table" id="personList_table">
					<thead>
						<tr>
						
							<td>ID</td>
							<td>姓名</td>
							<td>年龄</td>
							<td>生日</td>
							<td>编辑</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagehelper.list }" var="person">

							<tr id="person_tr_${person.id }">
								<td><input type="text" id="id_${person.id }" name="id"
									value="${person.id }" disabled /></td>
								<td><input type="text" id="name_${person.id }" name="name"
									value="${person.name }" disabled /></td>
								<td><input type="text" id="age_${person.id }" name="age"
									value="${person.age }" disabled /></td>
								<td><input type="text" id="birthday_${person.id }"
									name="birthday" class="Wdate" value="${person.birthdayStr}"
									onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" disabled
									readOnly /></td>
								<td>
									<button id="edit_btn" onclick="editFun('${person.id }');">编辑</button>
									<button id="modify" onclick="modifyFun('${person.id }');">修改</button>
									<button id="modify" onclick="deleteFun('${person.id }');">删除</button>
								</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<div id="page_div">
					<%@ include file="/jsp/common/pagehelper.jsp" %>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
