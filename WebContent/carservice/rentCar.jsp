<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>汽车出租</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 汽车出租</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="customer/queryCustomer.do">
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div >
						<label>第一步：请输入客户身份证号码</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label" align="center">
						<label>客户身份证号码：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="identity" data-validate="required:请输入客户身份证编号" />
						<div style="color: red;"><span>${requestScope.message }</span></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field" >
						<button class="button bg-main icon-check-square-o" type="submit">
							继续</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>