<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>修改出租单信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		
		$("#Modify").click(function() {
			var rentFlag = ${requestScope.rent.rentFlag};
			if(rentFlag == 1){
				$(":input").removeAttr("disabled");
				$(":button").removeAttr("disabled");
				$("#rentFlag").attr("disabled",true);
			} else {
				alert("该出租单已完成，不可修改");
			}
		});
	});

</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 修改出租单信息</strong>
		</div>
		<div class="body-content">
			<div class="padding border-bottom">
				<ul class="search">
					<li>
						<button type="button" class="button border-green" id="Modify">
							<span class="icon-check-square-o"></span> 修改信息
						</button>
					</li>
					<li>
						<button type="button" class="button border-yellow"
							onclick="history.back()">返回</button>
					</li>
				</ul>
			</div>
			<form method="post" class="form-x" action="rent/ModifyRent.do">
				<div>
					<h5>&nbsp;</h5>
				</div>
				<div class="form-group">
					<div class="label">
						<label>出租单编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" readonly="readonly" name="tableId" value="${requestScope.rent.tableId}" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>预付金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="imprest" disabled="disabled" value="${requestScope.rent.imprest}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>应付金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="shouldPayPrice" disabled="disabled" value="${requestScope.rent.shouldPayPrice}"  />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>实际交付金额：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="price" disabled="disabled" value="${requestScope.rent.price}" data-validate="required:请输入实际交付金额,plusdouble:只能输入正小数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>起租日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="beginDate" name="beginDate" disabled="disabled" readonly="readonly" value="<fmt:formatDate value='${requestScope.rent.beginDate}' pattern='yyyy-MM-dd'/>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>应归还日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="shouldReturnDate" disabled="disabled" name="shouldReturnDate" value="<fmt:formatDate value='${requestScope.rent.shouldReturnDate}' pattern='yyyy-MM-dd'/>" onfocus="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'beginDate\')}'})" data-validate="required:请输入应归还日期" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>实际归还日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" readonly="readonly" value="${requestScope.rent.returnDate}" disabled="disabled"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>出租单状态：</label>
					</div>
					<div class="field">
						<select id="rentFlag" name="rentFlag" class="input w50" disabled="disabled">
							<c:if test="${requestScope.rent.rentFlag == 1}">
								<option value="1" selected="selected">出租中</option>
							</c:if>
							<c:if test="${requestScope.rent.rentFlag == 0}">
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
						<input type="text" name="carId" class="input w50" readonly="readonly" value="${requestScope.rent.carId}"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>客户编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="custId" readonly="readonly" value="${requestScope.rent.custId}"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>服务人员编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="userId" readonly="readonly" value="${sessionScope.user.userName}"/>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" id="Submit"
							type="submit" disabled="disabled">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>