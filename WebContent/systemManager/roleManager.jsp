<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>添加角色</title>
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
	});
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 添加角色</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="role/addRole.do">
				<div class="form-group">
					<div class="label">
						<label>已有角色：</label>
					</div>
					<div class="field">
						<select id="userLevel" class="input w50">

						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>添加角色：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="roleName"
							data-validate="required:请输入角色名" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>