<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>修改汽车信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	$(function() {

		$("#Modify").click(function() {
			$(":input").removeAttr("disabled");
			$(":button").removeAttr("disabled");
			$("#isRenting").attr("disabled",true);
			$("#carImg").attr("type","file");
			$("#img").remove();
		});
	});
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 修改汽车信息</strong>
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
			<form method="post" class="form-x" action="car/ModifyCar.do" enctype="multipart/form-data">
				<div>
					<h5>&nbsp;</h5>
				</div>
				<div class="form-group">
					<div class="label">
						<label>车号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carNumber"
							readonly="readonly" value="${requestScope.car.carNumber }"
							data-validate="required:请输入车号" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>车型：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="carType"
							disabled="disabled" value="${requestScope.car.carType }"
							data-validate="required:请输入车型" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>颜色：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="color"
							disabled="disabled" value="${requestScope.car.color }"
							data-validate="required:请输入颜色" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>价格：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="price"
							disabled="disabled" value="${requestScope.car.price }"
							data-validate="required:请输入价格,plusdouble:只能输入正小数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>租金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="rentPrice"
							disabled="disabled" value="${requestScope.car.rentPrice }"
							data-validate="required:请输入租金,plusdouble:只能输入正小数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>押金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="deposit"
							disabled="disabled" value="${requestScope.car.deposit }"
							data-validate="required:请输入押金,plusdouble:只能输入正小数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>租用情况：</label>
					</div>
					<div class="field">
						<select id="isRenting" name="isRenting" disabled="disabled"
							class="input w50">
							<c:if test="${requestScope.car.isRenting == '未出租' }">
								<option value="未出租" selected="selected">未出租</option>
							</c:if>
							<c:if test="${requestScope.car.isRenting != '未出租' }">
								<option value="未出租">未出租</option>
							</c:if>
							<c:if test="${requestScope.car.isRenting == '已出租' }">
								<option value="已出租" selected="selected">已出租</option>
							</c:if>
							<c:if test="${requestScope.car.isRenting != '已出租' }">
								<option value="已出租">已出租</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>图片：</label>
					</div>
					<div class="field">
						<img id="img" src="carImg/${requestScope.car.carImg}" width="300px" alt="此图片不存在" />
						<input type="hidden" class="button" id="carImg" name="img"  style="width: 280px" data-validate="regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式图片">
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>简介：</label>
					</div>
					<div class="field">
						<textarea class="input w50" name="carDesc" disabled="disabled" >${requestScope.car.carDesc }</textarea>
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