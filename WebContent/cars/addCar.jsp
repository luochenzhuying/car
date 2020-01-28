<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>添加汽车</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	$(function() {
		
		var flag = true;
		
		//验证车号非重复
		$('#carNumber').blur(function() {
			var carNumber = $("#carNumber").val();
			$.ajax({
				url : "car/findCarNumber.do",
				data : {
					"carNumber" : carNumber
				},
				type : "post",
				success : function(result) {
					flag = result;
					if(!flag){
						$("#tip").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;车号已存在");
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
			<strong><span class="icon-pencil-square-o"></span> 添加汽车</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" id="form1" action="car/addCar.do" enctype="multipart/form-data">
				<div class="form-group">
					<div class="label">
						<label>车号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="carNumber" name="carNumber"
							data-validate="required:请输入车号" />
						<div id="tip" style="color: red;"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>车型：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carType"
							data-validate="required:请输入车型" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>颜色：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="color"
							data-validate="required:请输入颜色" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>价格：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="price"
							data-validate="required:请输入价格,plusdouble:只能输入正小数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>租金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="rentPrice"
							data-validate="required:请输入租金,plusdouble:只能输入正小数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>押金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="deposit"
							data-validate="required:请输入押金,plusdouble:只能输入正小数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>租用情况：</label>
					</div>
					<div class="field">
						<select id="isRenting" name="isRenting" class="input w50">
							<option value="未出租" selected="selected">未出租</option>
							<!-- <option value="已出租">已出租</option> -->
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>上传图片：</label>
					</div>
					<div class="field">
						<a class="button input-file" href="javascript:void(0);">+ 请选择上传图片
							<input type="file" class="button" name="img"  style="width: 280px" data-validate="regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件">
						</a>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>简介：</label>
					</div>
					<div class="field">
						<textarea class="input w50" name="carDesc"></textarea>
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