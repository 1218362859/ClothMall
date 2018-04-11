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
<link rel="icon" type="${pageContext.request.contextPath}/images/png"
	href="${pageContext.request.contextPath}/images/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/images/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<SCRIPT type="text/javascript">
	function del() {
		if (confirm("真的要删除该条记录吗?")) {
			return true;

		} else {
			return false;
		}
	}
</SCRIPT>
<SCRIPT type="text/javascript">
	function find() {
		if (true) {

			document.forms.form2.action = " ${pageContext.request.contextPath}/orders/findorderslist.action";
			document.forms.form2.submit();

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

			<li class="am-dropdown tognzhi" data-am-dropdown></li>




		</ul>
	</div>
	</header>

	<div class="am-cf admin-main">

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

			<div class="listbiaoti am-cf"></div>

			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/orders/findorderslist.action?pageNo=1&pageSize=10">订单列表</a>
					</li>
					<form id="form2" method="post">
						<li><input type="text" name="oid" style="width: 100%"
							class="am-form-field am-input-sm am-input-xm" placeholder="订单编号"
							value="${orders.oid }" /></li>
						<li><input type="text" name="courier_number"
							style="width: 200px"
							class="am-form-field am-input-sm am-input-xm" placeholder="物流编号"
							value="${orders.courier_number }" /></li>
						<li><input type="text" name="create_time"
							style="width: 200px"
							class="am-form-field am-input-sm am-input-xm"
							placeholder="订单创建时间" value="${orders.create_time }" /></li>
						<li><input type="text" name="seller_name"
							style="width: 200px"
							class="am-form-field am-input-sm am-input-xm"
							value="${orders.seller_name }" placeholder="店铺名" /></li>

						<li><input type="text" name="seller_phonenum"
							style="width: 200px"
							class="am-form-field am-input-sm am-input-xm"
							value="${orders.seller_phonenum }" placeholder="卖家手机号码" /></li>
						<li><input type="text" name="user_username"
							style="width: 200px"
							class="am-form-field am-input-sm am-input-xm"
							value="${orders.user_username }" placeholder="买家用户名" /></li>

						<li><input type="text" name="address_phonenum"
							style="width: 200px"
							class="am-form-field am-input-sm am-input-xm"
							value="${orders.address_phonenum }" placeholder="收货人手机号码" /></li>

						<li><button onClick="return find()"
								class="am-btn am-radius am-btn-xs am-btn-success"
								style="margin-top: -1px;">搜索</button></li>
					</form>
				</ul>
			</div>


			<form class="am-form am-g">
				<table width="100%" id="tb_3"
					class="am-table am-table-bordered am-table-radius am-table-striped">
					<thead>
						<tr class="am-success">

							<th class="table-id">订单ID</th>
							<th class="table-title">物流单号</th>
							<th class="table-type">状态</th>
							<th class="table-type">备注</th>
							<th class="table-type">数量</th>
							<th class="table-type">订单总金额</th>
							<th class="table-type">订单创建日期</th>

							<th class="table-type">类别名称</th>
							<th class="table-type">单价</th>
							<th class="table-type">商品图片</th>

							<th class="table-type">商品标题</th>
							<th class="table-type">店铺名称</th>
							
							<th class="table-type">卖家头像</th>
							<th class="table-type">卖家姓名</th>
							<th class="table-type">卖家手机号码</th>
							<th class="table-type">发货地址</th>

							<th class="table-type">买家用户名</th>
							<th class="table-type">买家昵称</th>
							<th class="table-type">买家头像</th>
							<th class="table-type">收货姓名</th>
							<th class="table-type">收货人手机号码</th>
							<th class="table-type">收货地址</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach items="${queryByPage.list}" var="g">
							<tr>

								<td>${g.oid}</td>
								<td>${g.courier_number}</td>
								<td>${ g.state}</td>
								<td>${ g.note}</td>
								<td>${ g.counts}</td>
								<td>${ g.price}</td>
								<td>${ g.create_time}</td>
								<td>${ g.category_name}</td>
								<td>${ g.category_price}</td>
								<td><img alt="类别图片" src="${ g.category_imageurl} " width="50px " height="50px"></td>
								<td>${ g.goods_title}</td>
								<td><img alt="商家头像" src="${ g.seller_photourl} " width="30px " height="30px"></td>
								<td>${ g.seller_name}</td>
								<td>${ g.seller_seller_name}</td>
								<td>${ g.seller_phonenum}</td>
								<td>${ g.goods_site}</td>

								<td>${ g.user_username}</td>
								<td>${ g.user_nickname}</td>
								<td><img alt="买家头像" src="${ g.user_photourl} " width="30px " height="30px"></td>
								<td>${ g.address_name}</td>
								<td>${ g.address_phonenum}</td>
								<td>${ g.address_site}</td>

							</tr>
						</c:forEach>

					</tbody>
				</table>


				<div class="am-btn-group am-btn-group-xs"></div>

				<ul class="am-pagination am-fr">


					<li>第${ queryByPage.pageNum}/${ queryByPage.lastPage}页 总记录数${ queryByPage.total}条</a></li>

					<c:if test="${queryByPage.pageNum!=1 }">
						<li><a
							href="${pageContext.request.contextPath }/orders/findorderslist.action?oid=${orders.oid }&courier_number=${orders.courier_number }&create_time=${orders.create_time }&seller_name=${orders.seller_name }&seller_phonenum=${orders.seller_phonenum }&user_username=${orders.user_username }&address_phonenum=${orders.address_phonenum }&pageNo=1&pageSize=10">首页</a></li>
						<li><a
							href="${pageContext.request.contextPath }/orders/findorderslist.action?oid=${orders.oid }&courier_number=${orders.courier_number }&create_time=${orders.create_time }&seller_name=${orders.seller_name }&seller_phonenum=${orders.seller_phonenum }&user_username=${orders.user_username }&address_phonenum=${orders.address_phonenum }&pageNo=${ queryByPage.pageNum-1}&pageSize=10">上一页</a></li>
					</c:if>

					<c:if test="${queryByPage.pageNum!= queryByPage.lastPage}">
						<li><a
							href="${pageContext.request.contextPath }/orders/findorderslist.action?oid=${orders.oid }&courier_number=${orders.courier_number }&create_time=${orders.create_time }&seller_name=${orders.seller_name }&seller_phonenum=${orders.seller_phonenum }&user_username=${orders.user_username }&address_phonenum=${orders.address_phonenum }&pageNo=${ queryByPage.pageNum+1}&pageSize=10">下一页</a></li>
						<li><a
							href="${pageContext.request.contextPath }/orders/findorderslist.action?oid=${orders.oid }&courier_number=${orders.courier_number }&create_time=${orders.create_time }&seller_name=${orders.seller_name }&seller_phonenum=${orders.seller_phonenum }&user_username=${orders.user_username }&address_phonenum=${orders.address_phonenum }&pageNo=${ queryByPage.lastPage}&pageSize=10">尾页</a></li>
					</c:if>
				</ul>




				<hr />
				<p>注：.....</p>
			</form>




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

	<script src="${pageContext.request.contextPath}/js/polyfill/rem.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/polyfill/respond.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/amazeui.legacy.js"></script>

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/amazeui.min.js"></script>
	<!--<![endif]-->

	<script type="text/javascript">
		var tTD; //用来存储当前更改宽度的Table Cell,避免快速移动鼠标的问题
		var table = document.getElementById("tb_3");
		for (j = 0; j < table.rows[0].cells.length; j++) {
			table.rows[0].cells[j].onmousedown = function() {
				//记录单元格
				tTD = this;
				if (event.offsetX > tTD.offsetWidth - 10) {
					tTD.mouseDown = true;
					tTD.oldX = event.x;
					tTD.oldWidth = tTD.offsetWidth;
				}
				//记录Table宽度
				//table = tTD; while (table.tagName != ‘TABLE') table = table.parentElement;
				//tTD.tableWidth = table.offsetWidth;
			};
			table.rows[0].cells[j].onmouseup = function() {
				//结束宽度调整
				if (tTD == undefined)
					tTD = this;
				tTD.mouseDown = false;
				tTD.style.cursor = 'default';
			};
			table.rows[0].cells[j].onmousemove = function() {
				//更改鼠标样式
				if (event.offsetX > this.offsetWidth - 10)
					this.style.cursor = 'col-resize';
				else
					this.style.cursor = 'default';
				//取出暂存的Table Cell
				if (tTD == undefined)
					tTD = this;
				//调整宽度
				if (tTD.mouseDown != null && tTD.mouseDown == true) {
					tTD.style.cursor = 'default';
					if (tTD.oldWidth + (event.x - tTD.oldX) > 0)
						tTD.width = tTD.oldWidth + (event.x - tTD.oldX);
					//调整列宽
					tTD.style.width = tTD.width;
					tTD.style.cursor = 'col-resize';
					//调整该列中的每个Cell
					table = tTD;
					while (table.tagName != 'TABLE')
						table = table.parentElement;
					for (j = 0; j < table.rows.length; j++) {
						table.rows[j].cells[tTD.cellIndex].width = tTD.width;
					}
					//调整整个表
					//table.width = tTD.tableWidth + (tTD.offsetWidth – tTD.oldWidth);
					//table.style.width = table.width;
				}
			};
		}
	</script>

</body>
</html>