<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
</head>
<style>
.flagPoleSegmentBelowBall_kyajvs {
	position: absolute !important;
	top: 44px !important;
	left: 5px !important;
	width: 2px !important;
	height: 19px !important;
	background-color: #E3E5E6 !important;
	margin-left: 8px;
	margin-top: -5px;
}

.title1 {
	display: -moz-box !important;
	display: -ms-flexbox !important;
	display: -webkit-box !important;
	display: -webkit-flex !important;
	display: flex !important;
	flex-direction: column !important;
	flex-grow: 1 !important;
	flex-shrink: 0 !important;
	position: relative !important;
	margin-left: 5px !important;
	padding-left: 34px !important;
	font-family: inherit !important;
	font-size: 18px !important;
	font-weight: bold !important;
	line-height: 1 !important;
	color: #21242C !important;
	cursor: pointer !important;
	-webkit-flex-direction: column !important;
	-ms-flex-direction: column !important;
	-webkit-flex-grow: 1 !important;
	-webkit-flex-shrink: 0 !important;
	-webkit-box-orient: vertical !important;
	-webkit-box-direction: normal !important;
	-ms-flex-positive: 1 !important;
	-ms-flex-negative: 0 !important;
}

.itemContainer_1401chq-o_O-withFlagPole_1r4cwrc-o_O-withTopBorder_1ox64un-o_O-clickable_ro0g1e
	{
	display: -moz-box !important;
	display: -ms-flexbox !important;
	display: -webkit-box !important;
	display: -webkit-flex !important;
	display: flex !important;
	flex-direction: column !important;
	flex-grow: 1 !important;
	flex-shrink: 0 !important;
	position: relative !important;
	margin-left: 5px !important;
	padding-left: 32px !important;
	border-left-width: 2px !important;
	border-left-color: #E3E5E6 !important;
	border-left-style: solid !important;
	border-top-width: 1px !important;
	border-top-style: solid !important;
	border-top-color: #D6D8DA !important;
	cursor: pointer !important;
	-webkit-flex-direction: column !important;
	-ms-flex-direction: column !important;
	-webkit-flex-grow: 1 !important;
	-webkit-flex-shrink: 0 !important;
	-webkit-box-orient: vertical !important;
	-webkit-box-direction: normal !important;
	-ms-flex-positive: 1 !important;
	-ms-flex-negative: 0 !important;
}

div {
	display: block;
}

.itemTitle_oia7ck-o_O-itemRightInset_q7c770-o_O-clickable_ro0g1e {
	font-family: inherit !important;
	font-size: 15px !important;
	line-height: 20px !important;
	color: #21242C !important;
	display: -moz-box !important;
	display: -ms-flexbox !important;
	display: -webkit-box !important;
	display: -webkit-flex !important;
	display: flex !important;
	flex-direction: column !important;
	padding-right: 16px !important;
	cursor: pointer !important;
	-webkit-flex-direction: column !important;
	-ms-flex-direction: column !important;
	-webkit-box-orient: vertical !important;
	-webkit-box-direction: normal !important;
}

.flagContainer_b2i7ni {
	position: absolute !important;
	top: 16px !important;
	left: -2px !important;
}

svg[Attributes Style] {
	width: 23;
	height: 20;
}

user agent stylesheet
svg:not   (:root   ),symbol,image,marker,pattern,foreignObject {
	overflow: hidden;
}

user agent stylesheet
html   |*>svg {
	transform-origin: 50% 50% 0px;
}

user agent stylesheet
* {
	transform-origin: 0px 0px 0px;
}

path[Attributes Style] {
	fill: rgb(17, 172, 205);
	d: path('M 20.468 0 H 0 v 20 h 20.468 a 2 2 0 0 0 1.715 -3.029 L 18 10 l 4.183 -6.971 A 2 2 0 0 0 20.468 0 Z'
		);
}

user agent stylesheet
* {
	transform-origin: 0px 0px 0px;
}

a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}

a {
	color: #000000;
}

.flagPoleBall_xbz0xp {
	position: absolute !important;
	top: 32px !important;
	left: 0px !important;
	width: 12px !important;
	height: 12px !important;
	border-radius: 6px !important;
	margin-left: 8px;
}
</style>

<body>
	<div class="flagPoleSegmentBelowBall_kyajvs"></div>
	<div class="flagPoleBall_xbz0xp"
		style="background-color: rgb(17, 172, 205);"></div>
	<div class="title1">
		<div style="flex-basis: 16px; flex-shrink: 0;"></div>
		Lessons
		<div style="flex-basis: 16px; flex-shrink: 0;"></div>
	</div>

	<c:forEach items="${resourcesList}" var="res">


		<div
			class="itemContainer_1401chq-o_O-withFlagPole_1r4cwrc-o_O-withTopBorder_1ox64un-o_O-clickable_ro0g1e">
			<div style="flex-basis: 16px; flex-shrink: 0;"></div>
			<div
				class="itemTitle_oia7ck-o_O-itemRightInset_q7c770-o_O-clickable_ro0g1e">
				<a   target="mainFrame"  href="${pageContext.request.contextPath}/resources/findResourcesByid.action?resid=${res.resid}">${res.resname}</a>
			</div>
			<div style="flex-basis: 16px; flex-shrink: 0;"></div>
			<div class="flagContainer_b2i7ni">
				<svg role="img" aria-hidden="true" focusable="false" width="23"
					height="20" viewBox="0 0 23 20"> <path fill="#11accd"
					d="M20.468 0H0v20h20.468a2 2 0 0 0 1.715-3.029L18 10l4.183-6.971A2 2 0 0 0 20.468 0z"></path>
				</svg>
			</div>
		</div>
	</c:forEach>

</body>
</html>
