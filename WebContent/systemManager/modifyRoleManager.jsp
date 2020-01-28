<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>修改角色权限</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
	outline: none;
}

.selectbox {
	width: 1200px;
	height: 220px;
	margin: 100px auto;
}

.selectbox div {
	float: left;
}
</style>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "role/FindRole.do",
			type : "post",
			success : function(result) {
				$(result).each(
						function(index, domEle) {
							$("#roleId").append(
									"<option value='" + domEle.roleId + "'>"
											+ domEle.roleName + "</option>");

						});
			}
		});

		//查询不同角色的权限
		$('#roleId').change(
				function() {
					var roleId = $("#roleId").val();
					$("#select1").empty();
					$("#select2").empty();
					$.ajax({
						url : "role/FindRoleMenu.do",
						data : {
							"roleId" : roleId
						},
						type : "post",
						success : function(result) {
							$(result).each(
									function(index, domEle) {
										$("#select1").append(
												"<option value='" + domEle.menuId + "'>"
														+ domEle.menuName
														+ "</option>");

									});
						}
					});
					$.ajax({
						url : "role/FindRoleMenuNo.do",
						data : {
							"roleId" : roleId
						},
						type : "post",
						success : function(result) {
							$(result).each(
									function(index, domEle) {
										$("#select2").append(
												"<option value='" + domEle.menuId + "'>"
														+ domEle.menuName
														+ "</option>");

									});
						}
					});

				});

		//移到右边
		$('#add').click(function() {
			//先判断是否有选中
			if (!$("#select1 option").is(":selected")) {
				alert("请选择需要移动的选项")
			}
			//获取选中的选项，删除并追加给对方
			else {
				$('#select1 option:selected').appendTo('#select2');
			}
		});

		//移到左边
		$('#remove').click(function() {
			//先判断是否有选中
			if (!$("#select2 option").is(":selected")) {
				alert("请选择需要移动的选项")
			}
			//获取选中的选项，删除并追加给对方
			else {
				$('#select2 option:selected').appendTo('#select1');
			}
		});

		//全部移到右边
		$('#add_all').click(function() {
			//获取全部的选项,删除并追加给对方
			$('#select1 option').appendTo('#select2');
		});

		//全部移到左边
		$('#remove_all').click(function() {
			$('#select2 option').appendTo('#select1');
		});

		//双击选项
		$('#select1').dblclick(function() { //绑定双击事件
			//获取全部的选项,删除并追加给对方
			$("option:selected", this).appendTo('#select2'); //追加给对方
		});

		//双击选项
		$('#select2').dblclick(function() {
			$("option:selected", this).appendTo('#select1');
		});

		//提交表单
		$('#form1').submit(function() {
			var arr1 = [];
			$("#select1 option").each(function(index, domEle) {
				arr1[index] = $(this).val();
				$("#hidden").val(arr1.join(","));
			});
		});

	});
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 修改角色权限</strong>
		</div>
		<div class="body-content">
			<form method="post" class="" id="form1"
				action="role/modifyRoleMenu.do">
				<div class="form-group">
					<div class="label">
						<label>要修改权限的角色：</label>
					</div>
					<div class="field">
						<select id="roleId" name="roleId" class="input w50"
							data-validate="required:请选择角色">
							<option value="">--请选择角色--</option>
						</select> <input type="hidden" id="hidden" name="menuIdStr" />
					</div>
				</div>
				<div class="form-group">
					<div class="selectbox" >
						<div class="label">
							<label>想设置的权限:&nbsp;&nbsp;&nbsp;</label>
						</div>
						<div class="field">
							<select multiple="multiple" name="menuId" class="input w50"
								id="select1" style="height: 300px;width: 200px">
							</select>
						</div>
						
						<div class="field" style="height: 300px;width: 130px"></div>

						<div class="field" style="margin-top: 40px">

							<p>
								<span id="add">
									<button type="button" style="width: 70px" class="button bg-yellow" title="添加选中权限" />&gt;&nbsp;
									</button>
								</span>
							</p>

							<p>
								<span id="add_all">
									<button type="button" style="width: 70px" class="button bg-yellow" title="添加全部权限" />&gt;&gt;
									</button>
								</span>
							</p>

							<p>
								<span id="remove">
									<button type="button" style="width: 70px" class="button bg-yellow" title="移除选中权限" />&lt;&nbsp;
									</button>
								</span>
							</p>

							<p>
								<span id="remove_all">
									<button type="button" style="width: 70px" class="button bg-yellow" title="移除全部权限" />&lt;&lt;
									</button>
								</span>
							</p>
						</div>
						
						<div class="field" style="height: 300px;width: 50px"></div>

						<div class="label">
							<label>不需要的权限:&nbsp;&nbsp;&nbsp;</label>
						</div>
						<div class="field">

							<select multiple="multiple" id="select2" class="input w50"
								style="height: 300px;width: 200px"></select>
						</div>

						<div class="field" style="height: 300px;width: 50px"></div>
						
						<div class="field" style="margin-top: 260px">
							<button class="button bg-main icon-check-square-o" type="submit">
								改变权限</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>