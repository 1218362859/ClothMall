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
<script type="text/javascript">

        function createXMLHttpRequest() {
            try {
                return new XMLHttpRequest();
            } catch (e) {
                try {
                    return new ActiveXObject("Msxml2.HTTP");
                } catch (e) {
                    try {
                        return new ActiveXObject("Microsoft.HTTP");
                    } catch (e) {
                        throw e;
                    }
                }
            }
        }
        ;

        window.onload = function () {
            var user = document.getElementById("gid");
            //给文本框的失去焦点事件注册监听
            user.onblur = function () {

                //1,获得XMLHttpRequest对象
                var xmlHttp = createXMLHttpRequest();
                //2,打开连接
                xmlHttp.open("POST", "${pageContext.request.contextPath }/goods/findGoodsById.action", true);
                //3,设置请求头
                xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                //4,发出请求时,给出请求体
                xmlHttp.send("gid=" + this.value);
                //5,给xmlHttp对象的onreadystatechange事件注册监听
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        /**
                         * 获取服务器的响应,判断是否为1
                         * 若为1,则获取userError标签,设置内容:用户名已被注册
                         */
                        var text = xmlHttp.responseText;
                        if (text == "1") {
                        	 var userError = document.getElementById("userError");
                             userError.innerHTML = "";
                        	 var userRight = document.getElementById("userRight");
                        	 userRight.innerHTML="正确";
                        	 document.getElementById("submits").removeAttribute("disabled");
                       
                        }else {
                        	 var userError = document.getElementById("userError");
                        	 userError.innerHTML="未找到该商品ID";
                            var userRight = document.getElementById("userRight");
                            userRight.innerHTML = "";
                            document.getElementById("submits").setAttribute("disabled", true);
                        }
                    }
                };
            }


        };
    </script>
<SCRIPT type="text/javascript">


	function insert() {
		if (confirm("确认添加？")) {

			document.forms.form1.action = " ${pageContext.request.contextPath}/goods/insertCategory.action";
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







						<div class="am-form-group am-cf">
							<div class="zuo">商品ID：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="gid" 
									 id="gid"
									placeholder="请输入商品ID">
							</div>
							<span id="userError" style="color: red;margin-left: 10px"></span>
							<span id="userRight" style="color: green;margin-left: 10px"></span>
						</div>


			
				<div class="am-form-group am-cf">
							<div class="zuo">类别名称：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="name"
								 id="doc-ipt-pwd-1"
									placeholder="请输入类别名称">
							</div>
						</div>


						<div class="am-form-group am-cf">
							<div class="zuo">类别价格：</div>
							<div class="you">
								<input type="number" class="am-input-sm" name="price"
									 id="doc-ipt-pwd-1"  oninput='this.value=this.value.replace(/^[0]+[0-9]*$/gi,"")' maxlength="5"
									placeholder="请输入类别价格">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">该类别库存量：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="inventory"
									 id="doc-ipt-pwd-1"
									placeholder="请输入该类别库存量">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">该类别最小购买量：</div>
							<div class="you">
								<input type="number" class="am-input-sm" name="min_unit"
									 id="doc-ipt-pwd-1"
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
							<input type="file" name="multipartFile"   accept="image/*"   style="margin-left: 11%;">
							<div class="you"></div>
						</div>

						<div class="am-form-group am-cf">

								<div class="you" style="margin-left: 11%;">
									<button onClick="return insert()" id="submits"
										class="am-btn am-btn-success am-radius">点击添加</button>
								</div>

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