<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ClothMall后台系统</title>
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
<script src="${pageContext.request.contextPath }/js/calendar.js"
	type="text/javascript" language="javascript"></script>
<SCRIPT type=text/javascript
	src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></SCRIPT>
<SCRIPT type=text/javascript
	src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></SCRIPT>
<SCRIPT type=text/javascript
	src="${pageContext.request.contextPath}/ueditor/ueditor.parse.js"></SCRIPT>

<SCRIPT type="text/javascript">
	function update() {
		if (confirm("确认修改？")) {

			document.forms.form1.action = " ${pageContext.request.contextPath}/goods/updateObject.action";
			document.forms.form1.submit();

			return true;

		} else {
			return false;
		}
	}

	function insert() {
		if (confirm("确认添加？")) {

			document.forms.form1.action = " ${pageContext.request.contextPath}/goods/insertObject.action";
			document.forms.form1.submit();
			return true;

		} else {
			return false;
		}
	}
</SCRIPT>


</head>



<body>
	<header class="am-topbar admin-header">

	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
		<ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">





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
					<ul class="am-icon-flag on">
					</ul>




				</div>

				<div class="fbneirong">
					<form class="am-form" id="form1" method="post"  enctype="multipart/form-data">




						<c:choose>

							<c:when test="${category.cid==null}">
								<!--如果 -->
								<div class="am-form-group am-cf">
									<div class="zuo">sid：</div>
									<div class="you">
										<input type="text" class="am-input-sm" name="sid"
											value="${category.sid}" id="doc-ipt-pwd-1"
											placeholder="请输入商家ID">
									</div>
								</div>
							</c:when>

							<c:otherwise>
								<!--否则 -->
								<div class="am-form-group am-cf">
									<div class="you">
										<input type="hidden" class="am-input-sm" name="sid"
											value="${category.sid}" id="doc-ipt-pwd-1"
											placeholder="请输入商家ID">
									</div>
								</div>
								<div class="am-form-group am-cf">
									<div class="you">
										<input type="hidden" class="am-input-sm" name="gid"
											value="${category.gid}" id="doc-ipt-pwd-1"
											placeholder="请输入商品ID">
									</div>
								</div>

								<input type="hidden" class="am-input-sm" name="cid"
									value="${category.cid}" id="doc-ipt-pwd-1">
								<input type="hidden" class="am-input-sm" name="create_time"
									value="${category.create_time}" id="doc-ipt-pwd-1">

							</c:otherwise>

						</c:choose>






						<div class="am-form-group am-cf">
							<div class="zuo">商品标题：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="title"
									value="${category.title}" id="doc-ipt-pwd-1"
									placeholder="请输入商品标题">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">规格：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="unit"
									value="${category.unit}" id="doc-ipt-pwd-1" placeholder="请输入规格">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">商品成分：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="composit"
									value="${category.composit}" id="doc-ipt-pwd-1"
									placeholder="请输入成分">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">门幅：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="menfu"
									value="${category.menfu}" id="doc-ipt-pwd-1"
									placeholder="请输入门幅">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">克重：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="kezhong"
									value="${category.kezhong}" id="doc-ipt-pwd-1"
									placeholder="请输入克重">
							</div>
						</div>
						
						<div class="am-form-group am-cf">
							<div class="zuo">颜色：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="color"
									value="${category.color}" id="doc-ipt-pwd-1"
									placeholder="请输入颜色">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">工艺：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="gongyi"
									value="${category.gongyi}" id="doc-ipt-pwd-1"
									placeholder="请输入工艺">
							</div>
						</div>



						<div class="am-form-group am-cf">
							<div class="zuo">织物组织：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="zhiwuzuzhi"
									value="${category.zhiwuzuzhi}" id="doc-ipt-pwd-1"
									placeholder="请输入织物组织">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">用途：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="uses"
									value="${category.uses}" id="doc-ipt-pwd-1" placeholder="请输入用途">
							</div>
						</div>


						<div class="am-form-group am-cf">
							<div class="zuo">产地：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="origin"
									value="${category.origin}" id="doc-ipt-pwd-1"
									placeholder="请输入产地">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">发货地：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="site"
									value="${category.site}" id="doc-ipt-pwd-1"
									placeholder="请输入发货地">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">品牌：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="brand"
									value="${category.brand}" id="doc-ipt-pwd-1"
									placeholder="请输入品牌">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">销售量：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="sales"
									value="${category.sales}" id="doc-ipt-pwd-1"
									placeholder="请输入销售量">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">商品总体评分：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="score"
									value="${category.score}" id="doc-ipt-pwd-1"
									placeholder="请输入商品总体评分">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">状态：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="state"
									value="${category.state}" id="doc-ipt-pwd-1"
									placeholder="请输入商品状态">
							</div>
						</div>


						<div class="am-form-group am-cf">
							<div class="zuo">类别名称：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="name"
									value="${category.name}" id="doc-ipt-pwd-1"
									placeholder="请输入类别名称">
							</div>
						</div>


						<div class="am-form-group am-cf">
							<div class="zuo">类别价格：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="price"
									value="${category.price}" id="doc-ipt-pwd-1"
									placeholder="请输入类别价格">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">该类别库存量：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="inventory"
									value="${category.inventory}" id="doc-ipt-pwd-1"
									placeholder="请输入该类别库存量">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">该类别最小购买量：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="min_unit"
									value="${category.min_unit}" id="doc-ipt-pwd-1"
									placeholder="请输入该类别最小购买量">
							</div>
						</div>

						<!--  	<div class="am-form-group am-cf">
							<div class="zuo">该类别图片：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="min_unit"
									value="${category.min_unit}" id="doc-ipt-pwd-1"
									placeholder="请输入该类别最小购买量">
							</div>
						</div>
						-->
							<div class="am-form-group am-cf">
							<div class="zuo">类别图片：</div>
							<c:if test="${category!=null }">
							<img src="${category.imageurl}" width="100" height="100" />
						<br />

					</c:if> 
							<input type="file" name="multipartFile"   accept="image/*" style="margin-left: 11%;" >
							<div class="you"></div>
						</div>
						

						<div class="am-form-group am-cf">
							<c:if test="${category==null}">

								<div class="you" style="margin-left: 11%;">
									<button onClick="return insert()"
										class="am-btn am-btn-success am-radius">点击添加</button>
								</div>
							</c:if>

							<c:if test="${category!=null}">

								<div class="you" style="margin-left: 11%;">
									<button onClick="return update()"
										class="am-btn am-btn-success am-radius">点击修改</button>
								</div>
							</c:if>

						</div>
					</form>
				</div>



				<div class="foods">
					<ul>版权所有@ClothMall后台
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