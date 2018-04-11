<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>video</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/willesPlay.css"/>
<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/willesPlay.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<body>
<c:if test="${fn:contains(resources.resurl,'.mp4')}">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="willesPlay">
	<div class="playHeader">
		<div class="videoName">${resources.resname }</div>
	</div>
	<div class="playContent">
		<div class="turnoff">
			<ul>
				<li><a href="javascript:;" title="喜欢" class="glyphicon glyphicon-heart-empty"></a></li>
				<li><a href="javascript:;" title="关灯" class="btnLight on glyphicon glyphicon-sunglasses"></a></li>
				<li><a href="javascript:;" title="分享" class="glyphicon glyphicon-share"></a></li>
			</ul>
		</div>
		  <video width="100%" height="100%" id="playVideo">
			<source src="/resources/${resources.resurl}" type="video/mp4"></source>
			当前浏览器不支持 video直接播放，点击这里下载视频： <a href="/">下载视频</a>
			
			
		</video> 
		
		
		<div class="playTip glyphicon glyphicon-play"></div>
	</div>
	<div class="playControll">
		<div class="playPause playIcon"></div>
		<div class="timebar">
			<span class="currentTime">0:00:00</span>
			<div class="progress">
				<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
				</div>
			<span class="duration">0:00:00</span>
		</div>
		<div class="otherControl">
			<span class="volume glyphicon glyphicon-volume-down"></span>
			<span class="fullScreen glyphicon glyphicon-fullscreen"></span>
			<div class="volumeBar">
					<div class="volumewrap">
						<div class="progress">
						<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 8px;height: 40%;"></div>
					</div>
						</div>
				</div>
		</div>
	</div>
</div>
			
		</div>
	</div>
</div>

</c:if>

<c:if test="${fn:contains(resources.resurl,'.pdf')}">
<iframe  width="1000px" height="600px"  src="/resources/${resources.resurl}"></iframe>
</c:if>



<div style="text-align:center;clear:both;">
	<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
	<script src="/follow.js" type="text/javascript"></script>
</div>
	<div style="margin-left:66px; margin-top:77px;">
		<form action="${pageContext.request.contextPath }/pl/insertUserPl.action" method="post" style="margin-left:22px;"  target="mainFrame">
			<p>You can say something about this lesson:</p>
			
			<p>
			<div class="zuo"></div>
							<div class="you">
								评分：<input type="text" class="am-input-sm"  name="pf" value="${pf}"
									id="doc-ipt-pwd-1" placeholder="请输入1-10分">
									<input type="hidden" class="am-input-sm"  name="plusername" value="${ user.username}"
									>
									<input type="hidden" class="am-input-sm"  name="resid" value="${ resources.resid}"
									>
							</div>
			</p>
			<p>评论：
				<div class="you">
				<textarea name="plcontent" cols="100" rows="4"  placeholder="评论此视频" id="speak"></textarea>
				</div>
			</p>
			<p>
				<input name="" type="submit" value="yes"> <input
					name="Input" type="reset" value="reset">
			</p>
		</form>
		<hr />
		
		
		
		<c:forEach items="${pllist }"  var="pl">
		
		
		<div style="margin-left:22px;margin-top: 30px;border-bottom: 1px #b52a2a solid; width:90%;">
			<div class="STYLE1" >用户:${pl.plusername }</div>
			<div style="float: right;">评分${pl.pf }</div>
			<div >
			<div style="float: right; ">日期${pl.plDate}</div>
				<p style="margin-top: 30px;">内容:${pl.plcontent }</p>
				
			</div>
		</div>
		</c:forEach>
		
		<hr />
	</div>
</body>
</html>
