<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Spinning</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="${pageContext.request.contextPath }/image/png"
	href="${pageContext.request.contextPath }/images/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath }/images/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/amazeui.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/app.js"></script>
</head>
<body>
	<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->
</head>

<body>
	<header class="am-topbar admin-header">
	<div class="am-topbar-brand" >
		<img src="${pageContext.request.contextPath }/images/head3.jpg" style="  margin-left:-10px; width: 220px;height: 50px;">
	</div>

	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
		<ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

			<li class="am-dropdown tognzhi" data-am-dropdown>
				<button
					class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o"
					data-am-dropdown-toggle>
					消息管理<span class="am-badge am-badge-danger am-round">6</span>
				</button>
				<ul class="am-dropdown-content">



					<li class="am-dropdown-header">所有消息都在这里</li>



					<li><a href="#">未激活会员 <span
							class="am-badge am-badge-danger am-round">556</span> </a>
					</li>
					<li><a href="#">未激活代理 <span
							class="am-badge am-badge-danger am-round">69</span> </a></a>
					</li>
					<li><a href="#">未处理汇款</a>
					</li>
					<li><a href="#">未发放提现</a>
					</li>
					<li><a href="#">未发货订单</a>
					</li>
					<li><a href="#">低库存产品</a>
					</li>
					<li><a href="#">信息反馈</a>
					</li>



				</ul></li>

			<li class="kuanjie"><a
					href="${pageContext.request.contextPath}/lm/findlmlist.action">栏目管理</a> <a
					href="${pageContext.request.contextPath}/kc/findlkclist.action">课程管理</a> <a
					href="${pageContext.request.contextPath}/resources/findlresourceslist.action">资源管理</a> <a
					href="${pageContext.request.contextPath}/pl/findlpllist.action">评论管理</a> <a
					href="${pageContext.request.contextPath}/user/finduserlist.action">用户管理</a>
				</li> 
				  
			</li>

			<li class="soso">

				<p>

					<select
						data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
						<option value="b">全部</option>
						<option value="o">产品</option>
						<option value="o">会员</option>

					</select>

				</p>

				<p class="ycfg">
					<input type="text" class="am-form-field am-input-sm"
						placeholder="圆角表单域" />
				</p>
				<p>
					<button class="am-btn am-btn-xs am-btn-default am-xiao">
						<i class="am-icon-search"></i>
					</button>
				</p></li>




			<li class="am-hide-sm-only" style="float: right;"><a
				href="javascript:;" id="admin-fullscreen"><span
					class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span>
			</a>
			</li>
		</ul>
	</div>
	</header>

	<div class="am-cf admin-main">

		<div class="nav-navicon admin-main admin-sidebar">


			<jsp:include page="/WEB-INF/admin/left.jsp"></jsp:include>
			<!-- sideMenu End -->

			<script type="text/javascript">
				jQuery(".sideMenu").slide({
					titCell : "h3", //鼠标触发对象
					targetCell : "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
					effect : "slideDown", //targetCell下拉效果
					delayTime : 300, //效果时间
					triggerTime : 150, //鼠标延迟触发时间（默认150）
					defaultPlay : true,//默认是否执行效果（默认true）
					returnDefault : true
				//鼠标从.sideMen移走后返回默认状态（默认false）
				});
			</script>








		</div>

		<div class=" admin-content">

			  




			<div class="admin-biaogelist">

				<div class="listbiaoti am-cf">
					<ul class="am-icon-flag on">栏目名称
					</ul>

					<dl class="am-icon-home" style="float: right;">
						当前位置： 首页 >
						<a href="#">商品列表</a>
					</dl>



				</div>

				<div class="fbneirong">
					<form class="am-form"
						action="${pageContext.request.contextPath}/kc/updateKc.action"
						method="post" enctype="multipart/form-data">
						<div class="am-form-group am-cf">
							<div class="zuo">所属栏目：</div>
							<div class="you">
								<select name="lmbh">
									<option value="">--请选择--</option>
									<c:forEach items="${lmlist}" var="lm">
										<option value="${lm.lmbh}"   <c:if test="${lm.lmbh==kc.lmbh }">selected</c:if>  id="${lm.lmbh}">${lm.lmname}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">课程名称：</div>
							<div class="you">
								<input type="hidden" class="am-input-sm" name="kcbh"
									value="${kc.kcbh }" id="doc-ipt-pwd-1" >
								<input type="text" class="am-input-sm" name="kcname"
									value="${kc.kcname }" id="doc-ipt-pwd-1" placeholder="请输入课程名称">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">课程状态：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="kcstate"
									value="${kc.kcstate }" id="doc-ipt-pwd-1" placeholder="请输入1或0">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">课程信息：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="kcxx"
									value="${kc.kcxx }" id="doc-ipt-pwd-1" placeholder="请输入课程信息">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">课程难度：</div>
							<div class="you" style="height: 45px;">
								<input type="text" class="am-input-sm" name="kcnd"
									value="${kc.kcnd}" id="doc-ipt-pwd-1"
									placeholder="请输入课程难度  如中等">

							</div>
						</div>


						<div class="am-form-group am-cf">
							
							<div class="you">
								<input type="text" class="am-input-sm" name="kczz"
									value="${user.username }" id="doc-ipt-pwd-1" placeholder="请输入课程作者">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">课程图片：</div>
							<c:if test="${ kc.kcimg!=null}">
								<img src="/resources/${kc.kcimg}" width="100" height="100" />
								<br />

							</c:if>
							<input type="file" name="multipartFile" accept="image/*"  >
							<div class="you"></div>
						</div>


						<div class="am-form-group am-cf">
							<div class="you" style="margin-left: 11%;">
								<button type="submit" class="am-btn am-btn-success am-radius">发布并关闭窗口</button>
								&nbsp; &raquo; &nbsp;
								<button type="submit" class="am-btn am-btn-secondary am-radius">发布并继续发布</button>

							</div>
						</div>
					</form>
				</div>



				<div class="foods">
					<ul>版权所有@2015
					</ul>
					<dl>
						<a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
					</dl>
				</div>




			</div>

		</div>




	</div>

	<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/amazeui.min.js"></script>
	<!--<![endif]-->



</body>
</html>