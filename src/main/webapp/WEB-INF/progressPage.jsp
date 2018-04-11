<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<div class="profile-widget editable" style="margin-top:22px;">
			<div class="profile-widget-header">
				<div class="profile-widget-name">今天已学习了 ${fn:length(jdList)}
					节课</div>
				<div class="dropdown widget-privacy editing-privacy">
					<div class="dropdown-toggle widget-privacy-indicator">
						<div class="widget-privacy-indicator-inner">
							<span class="widget-privacy-icon icon-user"></span><span>已加入Spinning  ${daySub}  天</span>
						</div>
					</div>
				</div>
			</div>
			<div class="profile-widget-contents">
				<div>
					<div class="profile-widget-section">
						<div class="profile-widget-section-header" style="color:#333333;">今天已完成的内容</div>
						<table class="user-statistics-table">
							<tbody>

								<c:forEach items="${jdList}" var="jd">
									<tr>
										<td class="user-statistics-label"
											style="font-size: 15px;   font-weight: bold; margin-bottom: 10px;"><a
											target="mainFrame"
											href="${pageContext.request.contextPath}/resources/findResourcesByid.action?resid=${jd.resid}">${jd.resid}</a></td>
										<td><span
											style="color: #555; font-size: 15px; float:right;  margin-right:100px;    font-weight: bold; margin-bottom: 10px;">${jd.jdDate
												}</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
