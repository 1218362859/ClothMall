<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Spinning</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menu.css">


</head>

<body>
	<div id="move-to-top" class="animate hiding"></div>
	<div id="topheader">
		<div style=" padding-top:70px; float: right;">
			<c:if test="${user.username!=null }">
				<a href="${pageContext.request.contextPath }/jd/progress.action"
					"
					style="font-weight:bold;  color:#006633; font-size:14px; font-family:'微软雅黑'">${user.username
					}</a>
				<a href="${pageContext.request.contextPath }/user/loginout.action"
					style="font-weight:bold;  color:#006633; font-size:14px; margin-left:10px; font-family:'微软雅黑'">注销</a>
			</c:if>
			<c:if test="${user.username==null }">
				<a href="${pageContext.request.contextPath }/user/loginPage.action"
					style="font-weight:bold;  color:#006633; font-size:14px; font-family:'微软雅黑'">点击登录</a>
			</c:if>
			<a
				href="${pageContext.request.contextPath }/user/registerUserPage.action"
				style="font-weight:bold; color:#006633; margin-left:20px;  font-size:14px; font-family:'微软雅黑'">新用户注册</a>

		</div>
	</div>
	<!-- Mega Menu Start -->

	<div class="container">
		<div class="menu style-1">
			<ul class="menu">
				<li><a href="#">首页</a></li>
				<li><a href="#" class="arrow">视频库</a>
					<div class="mega-menu full-width" style="z-index:19999;">

						<c:forEach items="${lmlist }" var="lm" varStatus="vs">



							<div class="col-1">

								<div style="float: right;   overflow:hidden; height: 240px;">
									<h4>
										<a
											href="${pageContext.request.contextPath }/kc/findlkclistBylmbh.action?lmbh=${lm.lmbh}">${lm.lmname}</a>
									</h4>

									<ol>
										<c:forEach items="${kclist }" var="kc" varStatus="status">

											<c:if test="${kc.lmbh eq lm.lmbh }">

												<li><a
													href="${pageContext.request.contextPath }/resources/findResourcesByKcbh.action?kcbh=${kc.kcbh}">${kc.kcname
														}</a></li>

											</c:if>

										</c:forEach>
									</ol>
								</div>


							</div>

						</c:forEach>
				</li>
				<li><a
					href="${pageContext.request.contextPath }/jd/progress.action">学习计划</a>
				</li>
				<li><a href="#">关于我们</a></li>
				<li><a href="#">联系我们</a></li>
				<li>
					<form id="sitesearchform" style="display:inline" method="post"
						accept-charset="UTF-8"
						action="${pageContext.request.contextPath }/kc/findKcLike.action">
						<div style="float: right;">

							<input name="kcname" type="text"
								style=" height:50px; width:250px; " placeholder="搜索你想要找的课程" />
							<input type="submit"
								style="height:50px; width: 50px;  margin-left:-10px; line-height:1em; "
								value="搜索" />
						</div>
					</form>
				</li>
				<c:if test="${user!=null }">
					<li style="float: right;;"><a
						href="${pageContext.request.contextPath }/jd/progress.action">已加入Spinning
							${daySub } 天</a>
				</c:if>
			</ul>
		</div>


	</div>
</body>
</html>
