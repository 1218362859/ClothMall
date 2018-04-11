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
</head>

<frameset rows="*" cols="252,*" framespacing="1" frameborder="yes" border="1" bordercolor="#FF0000">
  <frame src="${pageContext.request.contextPath }/frame/left.action" name="leftFrame" scrolling="No" noresize="noresize"   id="leftFrame" title="leftFrame" />
  <frame src="${pageContext.request.contextPath }/frame/showVedio.action" name="rightFrame" id="rightFrame" title="rightFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>
