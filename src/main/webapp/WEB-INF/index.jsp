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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Spinning</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/css/style.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/css/menu.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/css/begin.css">
</head>
<body>
	<jsp:include page="/WEB-INF/topmenu.jsp"></jsp:include>

	<div class="box">
	<c:forEach items="${kcList}" var="kc">
		<ul>
			<li>
			<c:if test="${kc.kcpf >=8 }">
				<h1 style="width: 80px;">精品课程</h1>
			</c:if>
			<c:if test="${kc.kcpf <8 }">
				<h1 style="background-color: #FFFFFF;"></h1>
			</c:if>
			
				 <a href="${pageContext.request.contextPath }/resources/findResourcesByKcbh.action?kcbh=${kc.kcbh}"><img src="/resources/${kc.kcimg }" height="150"
					width="150" />
			</a>
				<h2>${kc.kcname }</h2>
				<h3>评分：${kc.kcpf }</h3>
				<p>已学习人数${kc.kcdjs}</p>
				<div class="hidden" style="background: #b52a2a;"  >
					<h4><c:if test="${fn:length(kc.kcxx)>10 }">
									  ${fn:substring(kc.kcxx, 0, 10)}...  
							</c:if> 
							
							<c:if test="${fn:length(kc.kcxx)<=10 }">
									  ${kc.kcxx}  
							</c:if> </h4>
					<h5>课程难度：${kc.kcnd }</h5>
				</div></li>
		</ul>
		</c:forEach>
	</div>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
