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
<title>Spinning</title>
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

<script type="text/javascript">
	$(function() {


		$('#dg').datagrid({
			title : '结果列表',
			pageSize : 10,//默认选择的分页是每页5行数据
			pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合
			nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取
			striped : true,//设置为true将交替显示行背景。
			collapsible : true,//显示可折叠按钮
			toolbar : "#tb",//在添加 增添、删除、修改操作的按钮要用到这个
			url : './StoreController/getStore.do',//url调用Action方法
			loadMsg : '数据装载中......',
			singleSelect : false,//为true时只能选择单行
			fitColumns : false,
			remoteSort : false,
			onClickRow : function(rowIndex, rowData) {//单击事件
			},
			onDblClickRow : function(rowIndex, rowData) {//双击事件
			},
			frozenColumns : [ [ {
				field : 'id',
				checkbox : true
			},  {
				field : 'bh',
				align : 'center',
				title : '编码',
				width : 120
			}, {
				field : 'bjmc',
				align : 'center',
				title : '零件名称',
				width : 120
			} ] ],
			columns : [ [ {
				field : 'lsprice',
				align : 'center',
				title : '零售价',
				width : 80
			}, {
				field : 'pfprice',
				align : 'center',
				title : '批发价',
				width : 80
			} ] ],
			pagination : true,//分页
			rownumbers : true
		//行数
		});
		var p = $('#dg').datagrid('getPager');  
		$(p).pagination({  
			pageSize: 10,//每页显示的记录条数，默认为10   
	        pageList: [5,10,15,20],//可以设置每页记录条数的列表   
	        beforePageText: '第',//页数文本框前显示的汉字   
	        afterPageText: '页    共 {pages} 页',   
	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',   
		});

		//在datagrid实例化之后调用这个方法。
		$("#dg").datagrid({}).datagrid("keyCtr");

	});

	
</script>


</head>
<body>
	<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->
</head>

<body>
	<header class="am-topbar admin-header">
	<div class="am-topbar-brand">
		<img src="${pageContext.request.contextPath }/images/head3.jpg"
			style="margin-left: -10px; width: 220px; height: 50px;">
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
							class="am-badge am-badge-danger am-round">556</span>
					</a></li>
					<li><a href="#">未激活代理 <span
							class="am-badge am-badge-danger am-round">69</span>
					</a></a></li>
					<li><a href="#">未处理汇款</a></li>
					<li><a href="#">未发放提现</a></li>
					<li><a href="#">未发货订单</a></li>
					<li><a href="#">低库存产品</a></li>
					<li><a href="#">信息反馈</a></li>



				</ul>
			</li>

			<li class="kuanjie"><a
				href="${pageContext.request.contextPath}/lm/findlmlist.action">栏目管理</a>
				<a href="${pageContext.request.contextPath}/kc/findlkclist.action">课程管理</a>
				<a
				href="${pageContext.request.contextPath}/resources/findlresourceslist.action">资源管理</a>
				<a href="${pageContext.request.contextPath}/pl/findlpllist.action">评论管理</a>
				<a
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
				</p>
			</li>




			<li class="am-hide-sm-only" style="float: right;"><a
				href="javascript:;" id="admin-fullscreen"><span
					class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span>
			</a></li>
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

			<div class="listbiaoti am-cf">
				<ul class="am-icon-flag on">栏目名称
				</ul>

				<dl class="am-icon-home" style="float: right;">
					当前位置： 首页 >
					<a href="#">课程列表</a>
				</dl>

				<dl>
					<a type="button"
						href="${pageContext.request.contextPath }/user/insertUserPage.action"
						class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus">
						添加用户</a>
				</dl>


			</div>

			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li>
						<div class="am-btn-group am-btn-group-xs">
							<select
								data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}">
								<option value="b">产品分类</option>
								<option value="o">下架</option>
							</select>
						</div>
					</li>
					<li>
						<div class="am-btn-group am-btn-group-xs">
							<select
								data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}">
								<option value="b">产品分类</option>
								<option value="o">下架</option>
							</select>
						</div>
					</li>
					<li style="margin-right: 0;"><span
						class="tubiao am-icon-calendar"></span> <input type="text"
						class="am-form-field am-input-sm am-input-zm  am-icon-calendar"
						placeholder="开始日期" data-am-datepicker="{theme: 'success',}"
						readonly /></li>
					<li style="margin-left: -4px;"><span
						class="tubiao am-icon-calendar"></span> <input type="text"
						class="am-form-field am-input-sm am-input-zm  am-icon-calendar"
						placeholder="开始日期" data-am-datepicker="{theme: 'success',}"
						readonly /></li>

					<li style="margin-left: -10px;">
						<div class="am-btn-group am-btn-group-xs">
							<select
								data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}">
								<option value="b">产品分类</option>
								<option value="o">下架</option>
							</select>
						</div>
					</li>
					<li><input type="text"
						class="am-form-field am-input-sm am-input-xm" placeholder="关键词搜索" />
					</li>
					<li><button type="button"
							class="am-btn am-radius am-btn-xs am-btn-success"
							style="margin-top: -1px;">搜索</button></li>
				</ul>
			</div>


			<form class="am-form am-g">
				<table     id="dg"      width="100%"
					class="am-table am-table-bordered am-table-radius am-table-striped">
					<thead>
						<tr class="am-success">
							<th class="table-check"><input type="checkbox" /></th>

							<th class="table-id">ID</th>
							<th class="table-title">用户</th>
							<th class="table-type">登录类型</th>
							<th class="table-type">账号</th>
							<th class="table-type">密码</th>
							<th width="163px" class="table-set">操作</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${user_AuthsList}" var="user">
							<tr>
								<td><input type="checkbox" /></td>

								<td>${user.id}</td>
								<td><a href="#">${user.user_id}</a></td>
								<td>${ user.identity_type}</td>
								<td>${ user.identifier}</td>
								<td>${ user.credential}</td>

								<td><div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<a
												href="${pageContext.request.contextPath }/user/updateUserPage.action?uid=${user.id}"
												class="am-btn am-btn-default am-btn-xs am-text-warning  am-round">
												<span class="am-icon-pencil-square-o"></span>
											</a> <a type="button" onClick="return del()"
												href="${pageContext.request.contextPath }/user/deleteuserByid.action?uid=${user.id}"
												class="am-btn am-btn-default am-btn-xs am-text-danger am-round">
												<span class="am-icon-trash-o"></span>
											</a>
										</div>
									</div></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				<div class="am-btn-group am-btn-group-xs">
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-plus"></span> 删除
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 上架
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 下架
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 移动
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-plus"></span> 新增
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 保存
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-archive"></span> 移动
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-trash-o"></span> 删除
					</button>
				</div>

				<ul class="am-pagination am-fr">
					<li class="am-disabled"><a href="#">«</a></li>
					<li class="am-active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">»</a></li>
				</ul>




				<hr />
				<p>注：.....</p>
			</form>




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

	<script src="${pageContext.request.contextPath}/js/polyfill/rem.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/polyfill/respond.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/amazeui.legacy.js"></script>

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/amazeui.min.js"></script>
	<!--<![endif]-->



</body>
</html>