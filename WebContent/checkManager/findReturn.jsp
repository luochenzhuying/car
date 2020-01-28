<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>查询检查单</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="My97DatePicker/WdatePicker.js" type="text/javascript"></script>

</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 查询检查单</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="check/findChecks.do">
				<div class="form-group">
					<div class="label">
						<label>检查单号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="checkId" data-validate="length#==14:长度等于14位" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>检查时间：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="checkDate" onfocus="WdatePicker({readOnly:true})" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>检查员：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="checkUserId"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>属性：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="field" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>问题：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="problem" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>赔费：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="paying" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>出租单编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="rentId" />
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