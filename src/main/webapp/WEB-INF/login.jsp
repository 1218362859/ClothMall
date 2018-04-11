<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/other.min.css" />
</head>
<body class="login-container">
	<div class="login-box">
		<div class="logo-img">
   		 </div>
		<form action="${pageContext.request.contextPath}/user/login.action"
			method="post" class="am-form" >
			<div class="am-form-group">
				<label for="doc-vld-name-2"><i class="am-icon-user"></i>
				</label> <input type="text" name="identifier" id="identifier"
					 placeholder="输入用户名"  />
			</div>

			<div class="am-form-group">
				<label for="doc-vld-email-2"><i class="am-icon-key"></i>
				</label> <input type="password" name="credential" id="credential"
					placeholder="输入密码"  />
					<input type="hidden" name="identity_type" id="identity_type" value="admin"
					   />
			</div>
			<button class="am-btn am-btn-secondary" name="Submit" type="submit">登录</button>
		</form>
	</div>
</body>
</html>
