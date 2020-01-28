<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>查询汽车</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 查询汽车</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x"
				action="car/findCar.do">
				<div class="form-group">
					<div class="label">
						<label>车号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carNumber" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>车型：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carType" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>颜色：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="color" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>价格<=：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="price" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>租金<=：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="rentPrice" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>押金<=：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="deposit" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>租用情况：</label>
					</div>
					<div class="field">
						<select id="isRenting" name="isRenting" class="input w50">
							<option value="">--请选择出租状态--</option>
							<option value="未出租">未出租</option>
							<option value="已出租">已出租</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-search" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>