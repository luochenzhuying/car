<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>生成汽车出租单</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "car/queryCars.do",
			type : "post",
			success : function(result) {
				$(result).each(
						function(index, domEle) {
							$("#carId").append(
									"<option value='" + domEle.carNumber + "'>"
											+ domEle.carNumber + "</option>");

						});
			}
		});
	});
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 生成汽车出租单</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="rent/addRent.do">
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div >
						<label>第二步：生成汽车出租单</label>
					</div>
					<div >
						<label>${requestScope.message }</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>出租单编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" readonly="readonly" name="tableId" value="${requestScope.tableId}" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>预付金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="imprest" data-validate="required:请输入预付金,plusdouble:只能输入正小数"  />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>应付金：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="shouldPayPrice" data-validate="required:请输入应付金,plusdouble:只能输入正小数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>实际交付金额：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="price" data-validate="required:请输入实际交付金额,plusdouble:只能输入正小数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>起租日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="beginDate" name="beginDate" onfocus="WdatePicker({readOnly:true,minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'shouldReturnDate\')}'})" data-validate="required:请输入起租日期" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>应归还日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="shouldReturnDate" name="shouldReturnDate" onfocus="WdatePicker({readOnly:true,minDate:'#F{$dp.$D(\'beginDate\')}'})" data-validate="required:请输入应归还日期" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>出租单状态：</label>
					</div>
					<div class="field">
						<select id="rentFlag" name="rentFlag" class="input w50">
							<option value="1" selected="selected">出租中</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>车号：</label>
					</div>
					<div class="field">
						<select id="carId" name="carId" class="input w50" data-validate="required:请选择车号">
							
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>客户编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="custId" readonly="readonly" value="${requestScope.customer.identity }"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>服务人员编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="userId" readonly="readonly" value="${sessionScope.user.userName }"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							确认</button>
						<button class="button bg-green icon-check-square-o" type="reset">
							重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>