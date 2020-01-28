<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>汽车租赁系统</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>

</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>汽车租赁系统</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-red" href="javaScript:logout();"><span
				class="icon-power-off"></span> 退出登录</a>
		</div>
	</div>
	<div class="leftnav" style="overflow: auto;">
		<c:forEach items="${sessionScope.menuList}" var="menu">
			<c:if test="${menu.menuId == 1}">
				<div class="leftnav-title">
					<strong><span class="icon-list"></span>${menu.menuName}</strong>
				</div>
			</c:if>

			<c:if test="${menu.fatherId == 1}">
				<h2>
					<span class="icon-pencil-square-o"></span>${menu.menuName}
				</h2>
			</c:if>

			<c:if test="${menu.fatherId == 1 }">
				<ul style="display: block" class="remove">
					<c:forEach items="${sessionScope.menuList}" var="menu2">
						<c:if test="${menu.menuId == menu2.fatherId and menu.menuId != 1}">
							<li><a href="${menu2.connUrl}" target="right"><span
									class="icon-caret-right"></span>${menu2.menuName}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</c:if>
		</c:forEach>

	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});

		function logout() {
			if (confirm("您确定要退出吗?")) {
				location.href = "user/logout.do";
			}
		}
	</script>
	<ul class="bread">
		<li><a href="index.jsp" target="_top" class="icon-home"> 首页</a></li>
		<li><a href="javaScript:void()" id="a_leader_txt">欢迎界面</a></li>
	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="right.jsp" name="right"
			width="100%" height="100%"></iframe>
	</div>
</body>
</html>