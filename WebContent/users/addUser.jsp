<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>添加用户</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "role/FindRole.do",
			type : "post",
			success : function(result) {
				$(result).each(
						function(index, domEle) {
							$("#userLevel").append(
									"<option value='" + domEle.roleId + "'>"
											+ domEle.roleName + "</option>");

						});
			}
		});
		
		var flag1 = true;
		var flag2 = true;
		
		//验证登录名非重复
		$('#userName').blur(function() {
			var userName = $("#userName").val();
			$.ajax({
				url : "user/findName.do",
				data : {
					"userName" : userName
				},
				type : "post",
				success : function(result) {
					flag1 = result;
					if(!flag1){
						$("#tip1").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录名已存在");
					} else {
						$("#tip1").html(" ");
					}
				}
			});
		});
		
		//验证身份证非重复
		$('#identity').blur(function() {
			var identity = $("#identity").val();
			$.ajax({
				url : "user/findIdentity.do",
				data : {
					"identity" : identity
				},
				type : "post",
				success : function(result) {
					flag2 = result;
					if(!flag2){
						$("#tip2").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;身份证号已存在");
					} else {
						$("#tip2").html("");
					}
				}
			});
		});
		
		//提交表单
		$('#form1').submit(function() {
			return flag1 && flag2;
		});
	});
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 添加用户</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" id="form1" action="user/addUser.do">
				<div class="form-group">
					<div class="label">
						<label>登录名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="userName" name="userName"
							data-validate="required:请输入登录名" />
						<div id="tip1" style="color: red;"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>身份证：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="identity" name="identity"
							data-validate="required:请输入身份证" />
						<div id="tip2" style="color: red;"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="fullName"
							data-validate="required:请输入姓名" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>性别：</label>
					</div>
					<div class="button-group radio">
						<label class="button active"> <input type="radio"
							name="sex" value="男" checked="checked" />男
						</label> <label class="button"> <input type="radio" name="sex"
							value="女" />女
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>地址：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="address"
							data-validate="required:请输入地址" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>联系电话：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="phone"
							data-validate="required:请输入联系电话" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>职位：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="position"
							data-validate="required:请输入职位" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>用户类型：</label>
					</div>
					<div class="field">
						<select id="userLevel" name="userLevel" class="input w50">

						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" name="userPwd"
							data-validate="required:请输入密码" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
						<button class="button bg-green icon-check-square-o" type="reset">
							重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>