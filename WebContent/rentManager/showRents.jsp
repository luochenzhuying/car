<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>查询出租单</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	function Delete(tableId,rentFlag,carId) {
		if (confirm("您确定要删除吗?")) {
			location.href = "rent/DeleteRent.do?tableId=" + tableId + "&rentFlag=" + rentFlag + "&carId=" + carId;
		}
	}

	function Update(id) {
		location.href = "rent/SelectRent.do?tableId=" + id;
	}

	function Select(id) {
		location.href = "rent/SelectRent.do?tableId=" + id;
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
	<form method="post" id="form1" action="rent/findRents.do">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 查询出租单</strong>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th>序号</th>
					<th>出租单编号</th>
					<th>客户身份证</th>
					<th>车号</th>
					<th>出租状态</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${requestScope.pageBean.list }" var="rent"
					varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${rent.tableId }</td>
						<td>${rent.custId }</td>
						<td>${rent.carId }</td>
						<td>
							<c:if test="${rent.rentFlag == 1 }">出租中</c:if>
							<c:if test="${rent.rentFlag == 0 }">已入库</c:if>
						</td>
						<td><div class="button-group">
								<a class="button border-green"
									href="javascript:Select('${rent.tableId }')"><span
									class="icon-search"></span> 查询</a>
							</div>
							<div class="button-group">
								<a class="button border-blue"
									href="javascript:Update('${rent.tableId }')"><span
									class="icon-edit"></span> 修改</a>
							</div>
							<div class="button-group">
								<a class="button border-red"
									href="javascript:Delete('${rent.tableId }','${rent.rentFlag }','${rent.carId }')"><span
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
					<td><input type="hidden" name="tableId"
						value="${requestScope.oldRent.tableId }" /> <input type="hidden"
						name="beginDate" value="<fmt:formatDate value='${requestScope.oldRent.beginDate}' pattern='yyyy-MM-dd'/>" /> <input
						type="hidden" name="shouldReturnDate"
						value="<fmt:formatDate value='${requestScope.oldRent.shouldReturnDate}' pattern='yyyy-MM-dd'/>" /> <input
						type="hidden" name="returnDate"
						value="<fmt:formatDate value='${requestScope.oldRent.returnDate}' pattern='yyyy-MM-dd'/>" /> <input
						type="hidden" name="rentFlag"
						value="${requestScope.oldRent.rentFlag }" /> <input type="hidden"
						name="custId" value="${requestScope.oldRent.custId }" /> <input
						type="hidden" name="carId" value="${requestScope.oldRent.carId }" />
						<input type="hidden" name="userId"
						value="${requestScope.oldRent.userId }" /> <input type="hidden"
						id="index" name="index" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>