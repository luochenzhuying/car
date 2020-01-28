<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>查询用户</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 查询用户</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="user/findUsers.do">
				<div class="form-group">
					<div class="label">
						<label>登录名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="userName" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>身份证：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="identity" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="fullName" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>性别：</label>
					</div>
					<div class="button-group radio">
						<label class="button active"> 
							<input type="radio" name="sex" value="男" />男 
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
						<input type="text" class="input w50" name="address" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>联系电话：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="phone" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>职位：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="position" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-search" type="submit">
							查询</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>