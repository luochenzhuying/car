<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>修改客户信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#Modify").click(function() {
			$(":input").removeAttr("disabled");
			$(":button").removeAttr("disabled");
		});
	});

</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 修改客户信息</strong>
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
			<form method="post" class="form-x" action="customer/ModifyCustomer.do">
				<div>
					<h5>&nbsp;</h5>
				</div>
				<div class="form-group">
					<div class="label">
						<label>身份证：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="identity"
							readonly="readonly" value="${requestScope.Customer.identity }"
							data-validate="required:请输入身份证" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="custName"
							value="${requestScope.Customer.custName }" disabled="disabled"
							data-validate="required:请输入姓名" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>性别：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="sex" id="sex"
							value="${requestScope.Customer.sex }" readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>地址：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="address"
							disabled="disabled" value="${requestScope.Customer.address }"
							data-validate="required:请输入地址" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>联系电话：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="phone"
							disabled="disabled" value="${requestScope.Customer.phone }"
							data-validate="required:请输入联系电话" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>职位：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carEer"
							disabled="disabled" value="${requestScope.Customer.carEer }"
							data-validate="required:请输入职位" />
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