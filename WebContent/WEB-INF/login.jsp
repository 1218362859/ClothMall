<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ClothMall后台系统</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/other.min.css" />

</head>
<body class="login-container">
	<div class="login-box">
		<div class="logo-img"></div>
		<form action="${pageContext.request.contextPath}/user/login.action"
			method="post" class="am-form" >
			<div class="am-form-group">
				<label for="doc-vld-name-2"><i class="am-icon-user"></i> </label> <input
					type="text" name="username" id="username" placeholder="输入用户名"  value="${username }" />
			</div>
	
			<div class="am-form-group">
				<label for="doc-vld-email-2"><i class="am-icon-key"></i> </label> <input
					type="password" name="password" id="password" placeholder="输入密码" value="${password }" />
			</div>
			
			<button class="am-btn am-btn-secondary" name="Submit" type="submit"    id="submits">登录</button>
			<div style="color:red; text-align: center; margin-top: 30px">
				<span> ${error }</span> 
			</div>
		</form>
	</div>
</body>
</html>
