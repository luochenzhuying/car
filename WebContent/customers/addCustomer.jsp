<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>添加客户</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	$(function() {
		
		var flag = true;
		
		//验证身份证非重复
		$('#identity').blur(function() {
			var identity = $("#identity").val();
			$.ajax({
				url : "customer/findIdentity.do",
				data : {
					"identity" : identity
				},
				type : "post",
				success : function(result) {
					flag = result;
					if(!flag){
						$("#tip").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户名已存在");
					} else {
						$("#tip").html("");
					}
				}
			});
		});
		
		//提交表单
		$('#form1').submit(function() {
			return flag;
		});
	});
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 添加客户</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" id="form1" action="customer/addCustomer.do">
				<div class="form-group">
					<div class="label">
						<label>身份证：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="identity" name="identity" data-validate="required:请输入身份证" />
						<div id="tip" style="color: red;"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="custName" data-validate="required:请输入姓名" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>性别：</label>
					</div>
					<div class="button-group radio">
						<label class="button active"> 
							<input type="radio" name="sex" value="男" checked="checked" />男 
						</label> 
						<label class="button"> 
							<input type="radio" name="sex" value="女" />女
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>地址：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="address" data-validate="required:请输入地址" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>电话：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="phone" data-validate="required:请输入电话" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>职业：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carEer" data-validate="required:请输入职业" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
						<button class="button bg-green icon-check-square-o" type="reset">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>