<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>查询出租单</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="My97DatePicker/WdatePicker.js" type="text/javascript"></script>

</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 查询出租单</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="rent/findRents.do">
				<div class="form-group">
					<div class="label">
						<label>出租单编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="tableId" data-validate="length#==14:长度等于14位" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>起租日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="beginDate" onfocus="WdatePicker({readOnly:true})" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>应归还日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="shouldReturnDate" onfocus="WdatePicker({readOnly:true})" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>实际归还日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="returnDate" onfocus="WdatePicker({readOnly:true})" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>客户编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="custId"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>车号：</label>
					</div>
					<div class="field">
						<input type="text" name="carId" class="input w50" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>出租单状态：</label>
					</div>
					<div class="field">
						<select id="rentFlag" name="rentFlag" class="input w50">
							<option value="" selected="selected">--请选择出租状态--</option>
							<option value="1" >出租中</option>
							<option value="0" >已入库</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>服务人员编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="userId" />
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