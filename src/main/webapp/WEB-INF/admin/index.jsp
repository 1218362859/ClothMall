<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/images/favicon.png">
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
							class="am-badge am-badge-danger am-round">556</span>
					</a>
					</li>
					<li><a href="#">未激活代理 <span
							class="am-badge am-badge-danger am-round">69</span>
					</a></a>
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

			  




			<div class="admin">





				<div class="admin-index">
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 100}">
						<dt class="qs">
							<i class="am-icon-users"></i>
						</dt>
						<dd>455</dd>
						<dd class="f12">团队数量</dd>
					</dl>
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 300}">
						<dt class="cs">
							<i class="am-icon-area-chart"></i>
						</dt>
						<dd>455</dd>
						<dd class="f12">今日收入</dd>
					</dl>
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 600}">
						<dt class="hs">
							<i class="am-icon-shopping-cart"></i>
						</dt>
						<dd>455</dd>
						<dd class="f12">商品数量</dd>
					</dl>
					<dl data-am-scrollspy="{animation: 'slide-right', delay: 900}">
						<dt class="ls">
							<i class="am-icon-cny"></i>
						</dt>
						<dd>455</dd>
						<dd class="f12">全部收入</dd>
					</dl>
				</div>
				<div class="admin-biaoge">
					<div class="xinxitj">信息概况</div>
					<table class="am-table">
						<thead>
							<tr>
								<th>团队统计</th>
								<th>全部会员</th>
								<th>全部未激活</th>
								<th>今日新增</th>
								<th>今日未激活</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>普卡</td>
								<td>普卡</td>
								<td><a href="#">4534</a>
								</td>
								<td>+20</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>银卡</td>
								<td>银卡</td>
								<td>4534</td>
								<td>+2</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>金卡</td>
								<td>金卡</td>
								<td>4534</td>
								<td>+10</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>钻卡</td>
								<td>钻卡</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>合计</td>
								<td>合计</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
						</tbody>
					</table>
					<table class="am-table">
						<thead>
							<tr>
								<th>团队统计</th>
								<th>全部会员</th>
								<th>全部未激活</th>
								<th>今日新增</th>
								<th>今日未激活</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>普卡</td>
								<td>普卡</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>银卡</td>
								<td>银卡</td>
								<td>4534</td>
								<td>+2</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>金卡</td>
								<td>金卡</td>
								<td>4534</td>
								<td>+10</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>钻卡</td>
								<td>钻卡</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>合计</td>
								<td>合计</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
						</tbody>
					</table>
					<table class="am-table">
						<thead>
							<tr>
								<th>资金统计</th>
								<th>账户总收入</th>
								<th>账户总支出</th>
								<th>账户余额</th>
								<th>今日收入</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>普卡</td>
								<td>普卡</td>
								<td>4534</td>
								<td>+20</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>银卡</td>
								<td>银卡</td>
								<td>4534</td>
								<td>+2</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>金卡</td>
								<td>金卡</td>
								<td>4534</td>
								<td>+10</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>钻卡</td>
								<td>钻卡</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
							<tr>
								<td>合计</td>
								<td>合计</td>
								<td>4534</td>
								<td>+50</td>
								<td>4534</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="shuju">
					<div class="shujuone">
						<dl>
							<dt>全盘收入： 1356666</dt>
							<dt>全盘支出： 5646465.98</dt>
							<dt>全盘利润： 546464</dt>
						</dl>
						<ul>
							<h2>26.83%</h2>
							<li>全盘拨出</li>
						</ul>
					</div>
					<div class="shujutow">
						<dl>
							<dt>全盘收入： 1356666</dt>
							<dt>全盘支出： 5646465.98</dt>
							<dt>全盘利润： 546464</dt>
						</dl>
						<ul>
							<h2>26.83%</h2>
							<li>全盘拨出</li>
						</ul>
					</div>
					<div class="slideTxtBox">
						<div class="hd">
							<ul>
								<li>其他信息</li>
								<li>工作进度表</li>
							</ul>
						</div>
						<div class="bd">
							<ul>
								<table width="100%" class="am-table">
									<tbody>
										<tr>
											<td width="7%" align="center">1</td>
											<td width="83%">工作进度名称</td>
											<td width="10%" align="center"><a href="#">10%</a>
											</td>
										</tr>
										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>
										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>
										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>

										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>

										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>

										<tr>
											<td align="center">1</td>
											<td>工作进度名称</td>
											<td align="center"><a href="#">10%</a>
											</td>
										</tr>








									</tbody>
								</table>
							</ul>
							<ul>
								<table class="am-table">
									<tbody>
										<tr>
											<td>普卡</td>
											<td>普卡</td>
											<td><a href="#">4534</a>
											</td>
											<td>+20</td>
											<td>4534</td>
										</tr>
										<tr>
											<td>银卡</td>
											<td>银卡</td>
											<td>4534</td>
											<td>+2</td>
											<td>4534</td>
										</tr>
										<tr>
											<td>金卡</td>
											<td>金卡</td>
											<td>4534</td>
											<td>+10</td>
											<td>4534</td>
										</tr>
										<tr>
											<td>钻卡</td>
											<td>钻卡</td>
											<td>4534</td>
											<td>+50</td>
											<td>4534</td>
										</tr>
										<tr>
											<td>合计</td>
											<td>合计</td>
											<td>4534</td>
											<td>+50</td>
											<td>4534</td>
										</tr>
									</tbody>
								</table>
							</ul>
						</div>
					</div>
					<script type="text/javascript">
						jQuery(".slideTxtBox").slide();
					</script>








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



<script src="${pageContext.request.contextPath }/js/polyfill/rem.min.js"></script>
<script src="${pageContext.request.contextPath }/js/polyfill/respond.min.js"></script>
<script src="${pageContext.request.contextPath }/js/amazeui.legacy.js"></script>


	<script src="${pageContext.request.contextPath }/js/amazeui.min.js"></script>



</body>
</html>