<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>修改检查单信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		
		$("#Modify").click(function() {
			$(":input").removeAttr("disabled");
			$(":button").removeAttr("disabled");
			$("#checkDate").attr("disabled",true);
		});
	});

</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 修改检查单信息</strong>
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
			<form method="post" class="form-x" action="check/ModifyReturn.do">
				<div>
					<h5>&nbsp;</h5>
				</div>
				<div class="form-group">
					<div class="label">
						<label>检查单号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="checkId" readonly="readonly" value="${requestScope.check.checkId}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>检查时间：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="checkDate" id="checkDate" disabled="disabled" value="<fmt:formatDate value='${requestScope.check.checkDate}' pattern='yyyy-MM-dd'/>" onfocus="WdatePicker({readOnly:true})" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>检查员：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="checkUserId" readonly="readonly" value="${requestScope.check.checkUserId}"  />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>属性：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="field" disabled="disabled" value="${requestScope.check.field}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>问题：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="problem" disabled="disabled" value="${requestScope.check.problem}" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>赔费：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="paying" disabled="disabled" value="${requestScope.check.paying}" />
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