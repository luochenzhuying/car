<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>查询用户</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	function Delete(id) {
		if (confirm("您确定要删除吗?")) {
			location.href = "user/DeleteUser.do?userName=" + id;
		}
	}
	
	function Update(id) {
		location.href = "user/SelectUser.do?userName=" + id;
	}
	
	function Select(id) {
		location.href = "user/SelectUser.do?userName=" + id;
	}

	function change(index) {
		//给表单index和size表单项赋值value
		$("#index").val(index);
		//提交表单
		$("#form1").submit();
	}
</script>
</head>
<body>
	<form method="post" id="form1" action="user/findUsers.do">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 用户查询</strong>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th>序号</th>
					<th>登录名</th>
					<th>姓名</th>
					<th>性别</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${requestScope.pageBean.list }" var="user"
					varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${user.userName }</td>
						<td>${user.fullName }</td>
						<td>${user.sex }</td>
						<td><div class="button-group">
								<a class="button border-green"
									href="javascript:Select('${user.userName }')"><span
									class="icon-search"></span> 查询</a>
							</div>
							<div class="button-group">
								<a class="button border-blue"
									href="javascript:Update('${user.userName }')"><span
									class="icon-edit"></span> 修改</a>
							</div>
							<div class="button-group">
								<a class="button border-red"
									href="javascript:Delete('${user.userName }')"><span
									class="icon-trash-o"></span> 删除</a>
							</div></td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="8"><div class="pagelist">
							<c:if test="${requestScope.pageBean.index == 1 }">
								<a href="javaScript:void();">上一页</a>
							</c:if>
							<c:if test="${requestScope.pageBean.index != 1 }">
								<a href="javaScript:change(${requestScope.pageBean.index-1 });">上一页</a>
							</c:if>
							<c:forEach items="${requestScope.pageBean.numbers }" var="i">
								<c:if test="${requestScope.pageBean.index == i }">
									<span class="current">${i }</span>
								</c:if>
								<c:if test="${requestScope.pageBean.index != i }">
									<a href="javaScript:change(${i});">${i }</a>
								</c:if>
							</c:forEach>
							<c:if
								test="${requestScope.pageBean.index == requestScope.pageBean.totalPageCount }">
								<a href="javaScript:void();">下一页</a>
							</c:if>
							<c:if
								test="${requestScope.pageBean.index != requestScope.pageBean.totalPageCount }">
								<a href="javaScript:change(${requestScope.pageBean.index+1 });">下一页</a>
							</c:if>

						</div></td>
					<td><input type="hidden" name="userName"
						value="${requestScope.oldUser.userName }" /> <input type="hidden"
						name="identity" value="${requestScope.oldUser.identity }" /> <input
						type="hidden" name="fullName"
						value="${requestScope.oldUser.fullName }" /> <input type="hidden"
						name="sex" value="${requestScope.oldUser.sex }" /> <input
						type="hidden" name="address"
						value="${requestScope.oldUser.address }" /> <input type="hidden"
						name="phone" value="${requestScope.oldUser.phone }" /> <input
						type="hidden" name="position"
						value="${requestScope.oldUser.position }" /> <input type="hidden"
						id="index" name="index" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>