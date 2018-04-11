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
                xmlHttp.open("POST", "${pageContext.request.contextPath }/user/findUserByUsername.action", true);
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

			document.forms.form1.action = " ${pageContext.request.contextPath}/user/updateObject.action";
			document.forms.form1.submit();

			return true;

		} else {
			return false;
		}
	}

	function insert() {
		if (confirm("确认添加？")) {

			document.forms.form1.action = " ${pageContext.request.contextPath}/user/insertObject.action";
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
					<form class="am-form" id="form1" method="post" enctype="multipart/form-data">
					<div class="am-form-group am-cf">
							<div class="zuo">类别图片：</div>
							<c:if test="${user!=null }">
							<img src="${user.photourl}" width="100" height="100" />
						<br />

					</c:if> 
							<input type="file" name="multipartFile"  accept="image/*" style="margin-left: 11%;" >
							<div class="you"></div>
						</div>
					

		<c:if test="${user==null }">
						<div class="am-form-group am-cf">
							<div class="zuo">用户名：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="username"
									value="${user.username}" id="username"
									placeholder="请输入用户名">
							</div>
							<span id="userError" style="color: red;margin-left: 10px"></span>
							<span id="userRight" style="color: green;margin-left: 10px"></span>
						</div>
					</c:if>	
					
						
						<div class="am-form-group am-cf">
							<div class="zuo">密码：</div>
							<div class="you">
								<input type="password" class="am-input-sm" name="password"  
									value="${user.password}" id="doc-ipt-pwd-1" placeholder="请输入密码">
							</div>
						</div>
						
						<div class="am-form-group am-cf">
							<div class="zuo">联系方式：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="phonenum"  
									value="${user.phonenum}" id="doc-ipt-pwd-1" placeholder="请输入联系方式">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">体重：</div>
							<div class="you">
								<input type="number" class="am-input-sm" name="weight" value="50"  min="0" max="250" 
									value="${user.weight}" id="doc-ipt-pwd-1" placeholder="请输入体重Kg">
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">身高：</div>
							<div class="you">
								<input type="number" class="am-input-sm" name="height" value="170"  min="0" max="250" 
									value="${user.height}" id="doc-ipt-pwd-1" placeholder="请输入身高Cm">
							</div>
						</div>

						<div class="am-form-group am-cf">
							<div class="zuo">性别：</div>
							<div class="you">
								<select name="sex">
									<option value="男"
										<c:if test="${user.sex eq '男' }">selected</c:if>>男</option>

									<option value="女"
										<c:if test="${user.sex eq '女'}">selected</c:if>>女</option>
								</select>
							</div>
						</div>
						<div class="am-form-group am-cf">
							<div class="zuo">昵称：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="nickname"
									value="${user.nickname}" id="doc-ipt-pwd-1"
									placeholder="请输入昵称">
							</div>
						</div>
					
							<div class="am-form-group am-cf">
							<div class="zuo">生日：</div>
							<div class="you">
								<input type="text" class="am-input-sm" name="birthday"  onclick="SetDate(this,'yyyy-MM-dd')"
									value="${user.birthday}" id="doc-ipt-pwd-1"
									placeholder="请输入生日">
							</div>
						</div>
						
						<div class="am-form-group am-cf">
							<div class="zuo">状态：</div>
							<div class="you">
								<select name="state">
									<option value=""
										<c:if test="${user.state eq '' }">selected</c:if>>请选择</option>
									<option value="1"
										<c:if test="${user.state eq '1' }">selected</c:if>>激活</option>

									<option value="0"
										<c:if test="${user.state eq '0'}">selected</c:if>>未激活</option>
								</select>
							</div>
						</div>
						
						<div class="am-form-group am-cf">
							<div class="zuo">权限：</div>
						<div class="you">
								<select name="power">
								<option value=""
										<c:if test="${user.power eq '' }">selected</c:if>>请选择</option>
									<option value="1"
										<c:if test="${user.power eq '1' }">selected</c:if>>管理员</option>

									<option value="0"
										<c:if test="${user.power eq '0'}">selected</c:if>>普通用户</option>
								</select>
							</div>
						</div>
						<div class="am-form-group am-cf">
							<c:if test="${user==null}">

								<div class="you" style="margin-left: 11%;">
									<button onClick="return insert()"  id="submits" 
										class="am-btn am-btn-success am-radius">点击添加</button>
								</div>
							</c:if>

							<c:if test="${user!=null}">
								<input type="hidden" class="am-input-sm" name="uid"
									value="${user.uid}" />
									
									
									<input type="hidden" class="am-input-sm" name="username"
									value="${user.username}" />
										<input type="hidden" class="am-input-sm" name="create_time"
									value="${user.create_time}" />
								<div class="you" style="margin-left: 11%;">
									<button onClick="return update()"  id="submits" 
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