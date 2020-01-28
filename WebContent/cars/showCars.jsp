<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>查询汽车</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	function Delete(id) {
		if (confirm("您确定要删除吗?")) {
			location.href = "car/DeleteCar.do?carNumber=" + id;
		}
	}
	
	function Update(id) {
		location.href = "car/SelectCar.do?carNumber=" + id;
	}
	
	function Select(id) {
		location.href = "car/SelectCar.do?carNumber=" + id;
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
	<form method="post" id="form1" action="car/findCar.do">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 汽车查询</strong>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th>序号</th>
					<th>车号</th>
					<th>车型</th>
					<th>颜色</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${requestScope.pageBean.list }" var="car"
					varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${car.carNumber }</td>
						<td>${car.carType }</td>
						<td>${car.color }</td>
						<td><div class="button-group">
								<a class="button border-green"
									href="javascript:Select('${car.carNumber }')"><span
									class="icon-search"></span> 查询</a>
							</div>
							<div class="button-group">
								<a class="button border-blue"
									href="javascript:Update('${car.carNumber }')"><span
									class="icon-edit"></span> 修改</a>
							</div>
							<div class="button-group">
								<a class="button border-red"
									href="javascript:Delete('${car.carNumber }')"><span
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
					<td><input type="hidden" name="carNumber"
						value="${requestScope.oldCar.carNumber }" /> <input
						type="hidden" name="carType"
						value="${requestScope.oldCar.carType }" /> <input type="hidden"
						name="color" value="${requestScope.oldCar.color }" /> <input
						type="hidden" name="price"
						value="${requestScope.oldCar.price }" /> <input type="hidden"
						name="rentPrice" value="${requestScope.oldCar.rentPrice }" /> <input
						type="hidden" name="deposit"
						value="${requestScope.oldCar.deposit }" /> <input type="hidden"
						name="isRenting" value="${requestScope.oldCar.isRenting }" /> <input type="hidden"
						id="index" name="index" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>