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
	<SCRIPT type=text/javascript src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></SCRIPT>  
	<SCRIPT type=text/javascript src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></SCRIPT>
	<SCRIPT type=text/javascript src="${pageContext.request.contextPath}/ueditor/ueditor.parse.js"></SCRIPT>
	
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>


<body>
	<form action="${pageContext.request.contextPath}/t_Activity/insertContentclient.action" method="post">
	    <TEXTAREA id=myEditor name="content"></TEXTAREA>  
		<SCRIPT type=text/javascript>  
		    var editor = new UE.ui.Editor();  
		    editor.render("myEditor");  
		    //1.2.4以后可以使用一下代码实例化编辑器 
		    //UE.getEditor('myEditor') 
		</SCRIPT>
		<input name="user_id" value="1" type="hidden">
		<input name="submit" value="提交" type="submit">
	</form>
</body>
</html>
