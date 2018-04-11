<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">



</head>

<body>
	<div class="nav-navicon admin-main admin-sidebar">


		<div class="sideMenu am-icon-dashboard"
			style="color:#aeb2b7; margin: 10px 0 0 0;">欢迎系统管理员：${user.user.nickname}</div>
			<c:if test="${user!=null }">
			<a href="${pageContext.request.contextPath }/user/loginout.action"
					style="font-weight:bold;  color:#b52a2a; font-size:14px; margin-left:10px; font-family:'微软雅黑'" target="">注销</a>
			</c:if>
		<div class="sideMenu">
			<h3 class="am-icon-flag">
				<em></em> <a href="#">栏目管理</a>
			</h3>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/user/finduserlist.action">用户列表</a>
				</li>
				<li class="func" dataType='html' dataLink='msn.htm'
					iconImg='images/msn.gif'><a type="button"
					href="${pageContext.request.contextPath }/lm/insertLmPage.action">
						添加栏目</a>
				</li>


			</ul>
			<h3 class="am-icon-cart-plus">
				<em></em> <a href="#"> 课程管理</a>
			</h3>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/kc/findlkclist.action">课程列表</a>
				</li>
				<li><a type="button"
					href="${pageContext.request.contextPath }/kc/insertKcPage.action">
						添加课程</a></li>
			</ul>
			<h3 class="am-icon-users">
				<em></em> <a href="#">资源管理</a>
			</h3>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/resources/findlresourceslist.action">资源列表</a>
				</li>
				<li><a type="button"
					href="${pageContext.request.contextPath }/resources/insertResourcesPage.action">
						添加资源</a></li>
			</ul>
			<h3 class="am-icon-volume-up">
				<em></em> <a href="#">评论管理</a>
			</h3>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/pl/findlpllist.action">评论列表</a>
				</li>
				<li><a type="button"
					href="${pageContext.request.contextPath }/pl/insertPlPage.action">
						添加评论</a></li>
			</ul>
			<h3 class="am-icon-gears">
				<em></em> <a href="#">用户管理</a>
			</h3>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/user/finduserlist.action">用户列表</a>
				</li>
				<li><a type="button"
					href="${pageContext.request.contextPath }/user/insertUserPage.action">
						添加用户</a></li>
			</ul>
		</div>
</body>
</html>
