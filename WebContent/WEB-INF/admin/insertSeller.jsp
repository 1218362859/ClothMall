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
            var user = document.getElementById("username");
            //给文本框的失去焦点事件注册监听
            user.onblur = function () {

                //1,获得XMLHttpRequest对象
                var xmlHttp = createXMLHttpRequest();
                //2,打开连接
                xmlHttp.open("POST", "${pageContext.request.contextPath }/seller/findSellerByUsername.action", true);
                //3,设置请求头
                xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                //4,发出请求时,给出请求体
                xmlHttp.send("username=" + this.value);
                //5,给xmlHttp对象的onreadystatechange事件注册监听
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        /**
                         * 获取服务器的响应,判断是否为1
                         * 若为1,则获取userError标签,设置内容:用户名已被注册
                         */
                        var text = xmlHttp.responseText;
                        if (text == "0") {
                        	 var userRight = document.getElementById("userRight");
                        	 userRight.innerHTML="";
                            var userError = document.getElementById("userError");
                            userError.innerHTML = "用户名已注册";
                            document.getElementById("submits").setAttribute("disabled", true);
                        }else {
                        	 var userError = document.getElementById("userError");
                        	 userError.innerHTML="";
                            var userRight = document.getElementById("userRight");
                            userRight.innerHTML = "可以注册";
                            document.getElementById("submits").removeAttribute("disabled");
                        }
                    }
                };
            }


        };
    </script>
<SCRIPT type="text/javascript">
	function update() {
		if (confirm("确认修改？")) {

			document.forms.form1.action = " ${pageContext.request.contextPath}/seller/updateObject.action";
			document.forms.form1.submit();

			return true;

		} else {
			return false;
		}
	}

	function insert() {
		if (confirm("确认添加？")) {

			document.forms.form1.action = " ${pageContext.request.contextPath}/seller/insertObject.action";
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
					<form class="am-form" id="form1" method="post"   enctype="multipart/form-data">
<div class="am-form-group am-cf">
							<div class="zuo">类别图片：</div>
							<c:if test="${seller!=null }">
							<img src="${seller.photourl}" width="100" height="100" />
						<br />

					</c:if> 
							<input type="file" name="multipartFile"   accept="image/*" style="margin-left: 11%;" >
							<div class="you"></div>
						</div>
		<c:if test="${seller==null }">
						<div class="am-form-group am-cf">
							<div class="zuo">用户名：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="username" id="username"
									value="${seller.username}" id="doc-ipt-pwd-1"
									placeholder="请输入用户名">
							</div>
							<span id="userError" style="color: red;margin-left: 10px"></span>
							<span id="userRight" style="color: green;margin-left: 10px"></span>
						</div>
					</c:if>	
					<c:if test="${seller!=null }">
						<div class="am-form-group am-cf">
							<div class="you">
								<input type="hidden" class="am-input-sm" name="username"   id="username"
									value="${seller.username}" id="doc-ipt-pwd-1" 
									placeholder="请输入用户名"  >
							</div>
							<span id="userError" style="color: red;margin-left: 10px"></span>
							<span id="userRight" style="color: green;margin-left: 10px"></span>
						</div>
					</c:if>	
						
						<div class="am-form-group am-cf">
							<div class="zuo">密码：</div>
							<div class="you">
								<input type="password" class="am-input-sm" name="password"  
									value="${seller.password}" id="doc-ipt-pwd-1" placeholder="请输入密码">
							</div>
						</div>
						
						<div class="am-form-group am-cf">
							<div class="zuo">联系方式：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="phonenum"  
									value="${seller.phonenum}" id="doc-ipt-pwd-1" placeholder="请输入联系方式">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">店铺名称：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="name"  
									value="${seller.name}" id="doc-ipt-pwd-1" placeholder="请输入店铺名称">
							</div>
						</div>
							<div class="am-form-group am-cf">
							<div class="zuo">店铺类型：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="type"  
									value="${seller.type}" id="doc-ipt-pwd-1" placeholder="请输入店铺类型">
							</div>
						</div>
							<div class="am-form-group am-cf">
							<div class="zuo">店铺人姓名：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="seller_name"  
									value="${seller.seller_name}" id="doc-ipt-pwd-1" placeholder="请输入店铺人姓名">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">店铺状态：</div>
							<div class="you">
								<select name="state">
									<option value=""
										<c:if test="${seller.state eq '' }">selected</c:if>>请选择</option>
									<option value="1"
										<c:if test="${seller.state eq '1' }">selected</c:if>>激活</option>

									<option value="0"
										<c:if test="${seller.state eq '0'}">selected</c:if>>未激活</option>
								</select>
							</div>
						</div>
						
						<div class="am-form-group am-cf">
							<div class="zuo">店铺介绍：</div>
						<TEXTAREA id=myEditor name="describes"
								style="height: 400px; margin-left: 11%;">${seller.describes}</TEXTAREA>
							<SCRIPT type=text/javascript>
								var editor = new UE.ui.Editor();
								editor.render("myEditor");
								//1.2.4以后可以使用一下代码实例化编辑器 
								//UE.getEditor('myEditor')
							</SCRIPT>
						</div>
						<input type="hidden" class="am-input-sm" name="sid"
							value="${seller.sid}" id="doc-ipt-pwd-1">
							<input type="hidden" class="am-input-sm" name="create_time"
							value="${seller.create_time}" id="doc-ipt-pwd-1">
						<div class="am-form-group am-cf">
							<c:if test="${seller==null}">

								<div class="you" style="margin-left: 11%;">
									<button onClick="return insert()"  id="submits"
										class="am-btn am-btn-success am-radius">点击添加</button>
								</div>
							</c:if>

							<c:if test="${seller!=null}">
								<input type="hidden" class="am-input-sm" name="id"  
									value="${seller.sid}" />
								<div class="you" style="margin-left: 11%;">
									<button onClick="return update()" id="submits"
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