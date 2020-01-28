<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>汽车出租详情</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 汽车出租详情---出租单信息</strong>
		</div>
		<div class="body-content">
			<form class="form-x">
				<div class="form-group">
					<div class="label">
						<label>出租单编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" disabled="disabled"
							name="tableId" value="${requestScope.rentTable.tableId}" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>预付金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="imprest"
							disabled="disabled" value="${requestScope.rentTable.imprest}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>应付金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="shouldPayPrice"
							disabled="disabled"
							value="${requestScope.rentTable.shouldPayPrice}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>实际交付金额：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="price"
							disabled="disabled" value="${requestScope.rentTable.price}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>起租日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="beginDate"
							disabled="disabled" value="<fmt:formatDate value='${requestScope.rentTable.beginDate}' pattern='yyyy-MM-dd'/>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>应归还日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="shouldReturnDate"
							disabled="disabled"
							value="<fmt:formatDate value='${requestScope.rentTable.shouldReturnDate}' pattern='yyyy-MM-dd'/>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>实际归还日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="returnDate"
							disabled="disabled" value="未归还" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>出租单状态：</label>
					</div>
					<div class="field">
						<select name="rentFlag" class="input w50" disabled="disabled">
							<c:if test="${requestScope.rentTable.rentFlag == 1}">
								<option value="1" selected="selected">出租中</option>
							</c:if>
							<c:if test="${requestScope.rentTable.rentFlag == 0}">
								<option value="0" selected="selected">已入库</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>车号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carId"
							disabled="disabled" value="${requestScope.rentTable.carId}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>客户编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="custId"
							disabled="disabled" value="${requestScope.rentTable.custId}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>服务人员编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="userId"
							disabled="disabled" value="${requestScope.rentTable.userId}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button type="button" class="button bg-yellow"
							onclick="history.back()">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 汽车出租详情---车辆信息</strong>
		</div>
		<div class="body-content">
			<form class="form-x">
				<div class="form-group">
					<div class="label">
						<label>车号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carNumber"
							disabled="disabled" value="${requestScope.car.carNumber }" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>车型：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carType"
							disabled="disabled" value="${requestScope.car.carType }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>颜色：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="color"
							disabled="disabled" value="${requestScope.car.color }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>价格：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="price"
							disabled="disabled" value="${requestScope.car.price }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>租金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="rentPrice"
							disabled="disabled" value="${requestScope.car.rentPrice }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>押金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="deposit"
							disabled="disabled" value="${requestScope.car.deposit }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>租用情况：</label>
					</div>
					<div class="field">
						<select id="isRenting" name="isRenting" class="input w50"
							disabled="disabled">
							<c:if test="${requestScope.car.isRenting == '未出租'}">
								<option value="未出租" selected="selected">未出租</option>
							</c:if>
							<c:if test="${requestScope.car.isRenting == '已出租'}">
								<option value="已出租" selected="selected">已出租</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>图片：</label>
					</div>
					<div class="field">
						<img id="img" src="carImg/${requestScope.car.carImg}" width="300px" alt="此图片不存在" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>简介：</label>
					</div>
					<div class="field">
						<textarea class="input w50" name="carDesc" disabled="disabled">${requestScope.car.carDesc }</textarea>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 汽车出租详情---用户信息</strong>
		</div>
		<div class="body-content">
			<form class="form-x">
				<div class="form-group">
					<div class="label">
						<label>身份证：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="identity"
							disabled="disabled" value="${requestScope.user.identity }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="fullName"
							disabled="disabled" value="${requestScope.user.fullName }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>性别：</label>
					</div>
					<div class="button-group radio">
						<label class="button active"> <input type="radio"
							name="sex" disabled="disabled" value="${requestScope.user.sex}" />${ requestScope.user.sex }
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>地址：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="address"
							disabled="disabled" value="${requestScope.user.address }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>联系电话：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="phone"
							disabled="disabled" value="${requestScope.user.phone }" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>职位：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="position"
							disabled="disabled" value="${requestScope.user.position }" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>