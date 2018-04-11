<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/css/style.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/css/menu.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/css/begin.css">
</head>
<body>

<jsp:include page="/WEB-INF/topmenu.jsp"></jsp:include>
		<div class="profile-widget editable" style="margin-top:22px;">
			<div class="profile-widget-header">
				<div class="profile-widget-name">Showcase</div>
				<div class="dropdown widget-privacy editing-privacy">
					<div class="dropdown-toggle widget-privacy-indicator">
						<div class="widget-privacy-indicator-inner">
							<span class="widget-privacy-icon icon-user"></span><span>Coaches</span>
						</div>
					</div>
				</div>
			</div>
			<div class="profile-widget-contents">
				<div>
					<div class="profile-widget-section">
						<div class="profile-widget-section-header" style="color:#333333;">User
							Statistics</div>
						<table class="user-statistics-table">
							<tbody>
								<tr>
									<td class="user-statistics-label"
										style="font-size: 15px; font-weight: bold; margin-bottom: 10px;">Date
										joined</td>
									<td><span
										style="color: #555; font-size: 15px; font-weight: bold; margin-bottom: 10px;">a
											month ago</span>
									</td>
								</tr>
								<tr>
									<td class="user-statistics-label"
										style="font-size: 15px; font-weight: bold; margin-bottom: 10px;">Efficiency</td>
									<td><span class="energy-points-badge"
										style="font-size: 15px; font-weight: bold; margin-bottom: 10px;">100%</span>
									</td>
								</tr>
								<tr>
									<td class="user-statistics-label"
										style="font-size: 15px; font-weight: bold; margin-bottom: 10px;">Videos
										completed</td>
									<td
										style="color: #555; font-size: 15px; font-weight: bold; margin-bottom: 10px;">31</td>
								</tr>
								<tr>
									<td class="user-statistics-label"
										style="font-size: 15px; font-weight: bold; margin-bottom: 10px;">Videos
										completed today</td>
									<td
										style="color: #555; font-size: 15px; font-weight: bold; margin-bottom: 10px;">1</td>
								</tr>
								<tr>
									<td class="user-statistics-label"
										style="font-size: 15px; font-weight: bold; margin-bottom: 10px;">The
										number of study days per month</td>
									<td
										style="color: #555; font-size: 15px; font-weight: bold; margin-bottom: 10px;">5</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<h2
			style="color: #21242C !important; width:200px; margin-bottom: 22px; margin-top:22px;
		font-family: inherit !important;
		font-size: 20px !important;
		line-height: 25px !important;">继续学习</h2>
		<div class="wrapper_1m0bmp6" style="margin-left:-15px;">
			<div
				class="contentItem_15nftld-o_O-firstContentItem_htshn0-o_O-wrapper_yudjpc">
				<a aria-hidden="true"
					href="/math/calculus-home/limits-and-continuity-calc?ref=resume_learning#limits-with-factoring-and-rationalizing-calc"
					class="link_1uvuyao-o_O-thumbnail_1q3mwyv">
					<div class="wrapper_uifibi"
						style="background-color: rgb(51, 144, 166);">
						<img alt="" class="image_1noercg"
							src="https://cdn.kastatic.org/genfiles/topic-icons/icons/limits_and_continuity.png-2f7c44-416.png">
						<div class="gradient_jlqyoe"
							style="background: linear-gradient(rgba(51, 144, 166, 0.05), rgba(51, 144, 166, 0.48));"></div>
						<div class="progress_1cnxnvf">40 / 81 completed</div>
					</div> </a>
				<div class="label_kvhqrn">
					<a
						href="/math/calculus-home/limits-and-continuity-calc?ref=resume_learning#limits-with-factoring-and-rationalizing-calc"
						class="link_1uvuyao-o_O-title_meu0ue">Limits and continuity</a>
					<div class="breadcrumbs_5y3v0x">
						<div>
							<span class=""><a aria-level="1"
								href="/math/calculus-home" class="link_1uvuyao-o_O-math_nccl0m"
								target="_self"> <!-- react-text: 886 --> Calculus (all
									content, first year) <!-- /react-text --> </a>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="contentItem_15nftld-o_O-wrapper_yudjpc">
				<a aria-hidden="true"
					href="/science/biology/intro-to-biology?ref=resume_learning#what-is-biology"
					class="link_1uvuyao-o_O-thumbnail_1q3mwyv">
					<div class="wrapper_uifibi"
						style="background-color: rgb(148, 66, 79);">
						<img alt="" class="image_1noercg"
							src="https://cdn.kastatic.org/genfiles/topic-icons/icons/classical_genetics.png-68e737-416.png">
						<div class="gradient_jlqyoe"
							style="background: linear-gradient(rgba(148, 66, 79, 0.05), rgba(148, 66, 79, 0.48));"></div>
						<div class="progress_1cnxnvf">2 / 6 completed</div>
					</div> </a>
				<div class="label_kvhqrn">
					<a
						href="/science/biology/intro-to-biology?ref=resume_learning#what-is-biology"
						class="link_1uvuyao-o_O-title_meu0ue">Intro to biology</a>
					<div class="breadcrumbs_5y3v0x">
						<div>
							<span class=""><a aria-level="1" href="/science/biology"
								class="link_1uvuyao-o_O-science_tg8pro" target="_self"> <!-- react-text: 899 -->
									Biology <!-- /react-text --> </a>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="contentItem_15nftld-o_O-wrapper_yudjpc">
				<a aria-hidden="true"
					href="/humanities/ap-world-history/ap-world-history-beginnings?ref=resume_learning#ap-birth-agriculture-neolithic-revolution"
					class="link_1uvuyao-o_O-thumbnail_1q3mwyv">
					<div class="wrapper_uifibi"
						style="background-color: rgb(173, 52, 52);">
						<img alt="" class="image_1noercg"
							src="https://cdn.kastatic.org/genfiles/topic-icons/icons/ancient_near_east1.jpg-36382d-416.jpeg">
						<div class="gradient_jlqyoe"
							style="background: linear-gradient(rgba(173, 52, 52, 0.05), rgba(173, 52, 52, 0.48));"></div>
						<div class="progress_1cnxnvf">12 / 37 completed</div>
					</div> </a>
				<div class="label_kvhqrn">
					<a
						href="/humanities/ap-world-history/ap-world-history-beginnings?ref=resume_learning#ap-birth-agriculture-neolithic-revolution"
						class="link_1uvuyao-o_O-title_meu0ue">Beginnings - 600 BCE</a>
					<div class="breadcrumbs_5y3v0x">
						<div>
							<span class=""><a aria-level="1"
								href="/humanities/ap-world-history"
								class="link_1uvuyao-o_O-humanities_1nimom9" target="_self">
									<!-- react-text: 912 --> AP World History <!-- /react-text -->
							</a>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div
				class="contentItem_15nftld-o_O-lastContentItemMobile_125ziv9-o_O-wrapper_yudjpc">
				<a aria-hidden="true"
					href="/science/biology/history-of-life-on-earth?ref=resume_learning#radiometric-dating"
					class="link_1uvuyao-o_O-thumbnail_1q3mwyv">
					<div class="wrapper_uifibi"
						style="background-color: rgb(148, 66, 79);">
						<img alt="" class="image_1noercg"
							src="https://cdn.kastatic.org/genfiles/topic-icons/icons/biology.png-02d1da-416.png">
						<div class="gradient_jlqyoe"
							style="background: linear-gradient(rgba(148, 66, 79, 0.05), rgba(148, 66, 79, 0.48));"></div>
						<div class="progress_1cnxnvf">0 / 14 completed</div>
					</div> </a>
				<div class="label_kvhqrn">
					<a
						href="/science/biology/history-of-life-on-earth?ref=resume_learning#radiometric-dating"
						class="link_1uvuyao-o_O-title_meu0ue">History of life on Earth</a>
					<div class="breadcrumbs_5y3v0x">
						<div>
							<span class=""><a aria-level="1" href="/science/biology"
								class="link_1uvuyao-o_O-science_tg8pro" target="_self"> <!-- react-text: 925 -->
									Biology <!-- /react-text --> </a>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div
				class="contentItem_15nftld-o_O-placeholder_1def9ia-o_O-lastContentItem_1hz53ox">
				<a href="" class="link_1uvuyao-o_O-placeholderContent_1r8xpk3"><span
					class="placeholderIE10Fix_10rne3"> <!-- react-text: 929 -->
						Or start learning something new <!-- /react-text --> </span>
				</a>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div style="text-align:center;clear:both">
		<script src="${ pageContext.request.contextPath}/gg_bd_ad_720x90.js"
			type="text/javascript"></script>
		<script src="${ pageContext.request.contextPath}/follow.js"
			type="text/javascript"></script>
	</div>
</body>
</html>
