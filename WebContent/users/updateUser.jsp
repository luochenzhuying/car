<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>修改用户信息</title>
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
							var userLevel = ${requestScope.user.userLevel } ;
							if (userLevel == domEle.roleId) {
								$("#userLevel")
										.append(
												"<option value='" + domEle.roleId + "' selected='selected' >"
														+ domEle.roleName
														+ "</option>");
							} else {
								$("#userLevel")
										.append(
												"<option value='" + domEle.roleId + "'>"
														+ domEle.roleName
														+ "</option>");
							}
						});
			}
		});
		
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
			<strong><span class="icon-pencil-square-o"></span> 修改用户信息</strong>
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
			<form method="post" class="form-x" action="user/ModifyUser.do">
				<div>
					<h5>&nbsp;</h5>
				</div>
				<div class="form-group">
					<div class="label">
						<label>登录名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="userName" id="userName"
							readonly="readonly" value="${requestScope.user.userName }"
							data-validate="required:请输入登录名" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>身份证：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="identity"
							disabled="disabled" value="${requestScope.user.identity }"
							data-validate="required:请输入身份证" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="fullName"
							value="${requestScope.user.fullName }" disabled="disabled"
							data-validate="required:请输入姓名" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>性别：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="sex" id="sex"
							value="${requestScope.user.sex }" readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>地址：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="address"
							disabled="disabled" value="${requestScope.user.address }"
							data-validate="required:请输入地址" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>联系电话：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="phone"
							disabled="disabled" value="${requestScope.user.phone }"
							data-validate="required:请输入联系电话" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>职位：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="position"
							disabled="disabled" value="${requestScope.user.position }"
							data-validate="required:请输入职位" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>用户类型：</label>
					</div>
					<div class="field">
						<select id="userLevel" name="userLevel" class="input w50"
							disabled="disabled">

						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" name="userPwd"
							disabled="disabled" value="${requestScope.user.userPwd }"
							data-validate="required:请输入密码" />
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