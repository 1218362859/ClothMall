<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>ClothMall后台系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>


<body>
	<form class="am-form"
		action="${pageContext.request.contextPath}/user/uploadUserPhotoclient.action"
		method="post" enctype="multipart/form-data">



		<div class="am-form-group am-cf">
			<div class="zuo">课上传资源：</div>
			<input type="file" name="multipartFile"
				accept="application/pdf,video/mp4">
			<div class="you">pdf或者mp4</div>
		</div>
		<input type="hidden" name="uid" value="1">

		<div class="am-form-group am-cf">
			<div class="you" style="margin-left: 11%;">
				<button type="submit" class="am-btn am-btn-success am-radius">发布并关闭窗口</button>
				&nbsp; &raquo; &nbsp;
				<button type="submit" class="am-btn am-btn-secondary am-radius">发布并继续发布</button>

			</div>
		</div>
	</form>
</body>
</html>
