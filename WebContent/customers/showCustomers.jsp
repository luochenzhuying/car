<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>查询客户</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	function Delete(id) {
		if (confirm("您确定要删除吗?")) {
			location.href = "customer/DeleteCustomer.do?identity=" + id;
		}
	}

	function Update(id) {
		location.href = "customer/SelectCustomer.do?identity=" + id;
	}

	function Select(id) {
		location.href = "customer/SelectCustomer.do?identity=" + id;
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
	<form method="post" id="form1" action="customer/findCustomers.do">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 客户查询</strong>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th>序号</th>
					<th>身份证</th>
					<th>姓名</th>
					<th>性别</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${requestScope.pageBean.list }" var="cust"
					varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${cust.identity }</td>
						<td>${cust.custName }</td>
						<td>${cust.sex }</td>
						<td><div class="button-group">
								<a class="button border-green"
									href="javascript:Select('${cust.identity }')"><span
									class="icon-search"></span> 查询</a>
							</div>
							<div class="button-group">
								<a class="button border-blue"
									href="javascript:Update('${cust.identity }')"><span
									class="icon-edit"></span> 修改</a>
							</div>
							<div class="button-group">
								<a class="button border-red"
									href="javascript:Delete('${cust.identity }')"><span
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
					<td><input type="hidden" name="custName"
						value="${requestScope.oldCust.custName }" /> <input type="hidden"
						name="identity" value="${requestScope.oldCust.identity }" /> <input
						type="hidden" name="sex" value="${requestScope.oldCust.sex }" />
						<input type="hidden" name="address"
						value="${requestScope.oldCust.address }" /> <input type="hidden"
						name="phone" value="${requestScope.oldCust.phone }" /> <input
						type="hidden" name="carEer"
						value="${requestScope.oldCust.carEer }" /> <input type="hidden"
						id="index" name="index" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>