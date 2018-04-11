<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'imgshow.jsp' starting page</title>


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css.css">



</head>

<body>

	<div class="layout-width mt18 main clearfix" style="position:relative;">
		<!--<div class="notice-bar" style="display:block;">
      		 <span class="home-notice-ico"></span>
             <ul class="notice-list-box">
             
            </ul>
	</div> -->

		<div class="main-top mb28 relative clearfix">
			<div class="fl relative slider-box">
				<div class="relative NISlider" id="indexSlider">
					<div class="relative NISlider-imgbox">
						<ul class="absolute NISlider-imglist" style="left: 0px;">



							<li class="fl NISlider-imgitem"><a
								href="picdetail.jsp?contentId=201709060943265291"
								hidefocus="true" title="爬高10米换灯泡 烈日下的路灯维修工"><img
									src="/pic/1.png"
									smallsrc="/pic/1.png"
									alt="爬高10米换灯泡 烈日下的路灯维修工"> </a></li>

							<li class="fl NISlider-imgitem"><a
								href="picdetail.jsp?contentId=201709060943265291"
								hidefocus="true" title="爬高10米换灯泡 烈日下的路灯维修工"><img
									src="/website/jjrbtk/photoFile/jz003\20170906/sl_01d6615d77d41accd61d8ec7ee763cf9.jpg"
									smallsrc="/website/jjrbtk/photoFile/jz003\20170906/sl_01d6615d77d41accd61d8ec7ee763cf9.jpg"
									alt="爬高10米换灯泡 烈日下的路灯维修工"> </a></li>

							<li class="fl NISlider-imgitem"><a href=""><img
									src="/website/jjrbtk/photoFile/jz003\20170906/sl_44eeef993c959e4abd56a367002b54a1.jpg"
									smallsrc="/website/jjrbtk/photoFile/jz003\20170906/sl_44eeef993c959e4abd56a367002b54a1.jpg"
									alt="爬高10米换灯泡 烈日下的路灯维修工"> </a></li>

							<li class="fl NISlider-imgitem"><a
								href="picdetail.jsp?contentId=201709060943265291"
								hidefocus="true" title="爬高10米换灯泡 烈日下的路灯维修工"><img
									src="/website/jjrbtk/photoFile/jz003\20170906/sl_0f8ac9f22e69268671e28d76555b37be.jpg"
									smallsrc="/website/jjrbtk/photoFile/jz003\20170906/sl_0f8ac9f22e69268671e28d76555b37be.jpg"
									alt="爬高10米换灯泡 烈日下的路灯维修工"> </a></li>

							<li class="fl NISlider-imgitem"><a
								href="picdetail.jsp?contentId=201709060943265291"
								hidefocus="true" title="爬高10米换灯泡 烈日下的路灯维修工"><img
									src="/website/jjrbtk/photoFile/jz003\20170906/sl_988e253b917ae2dc1a7350d25174d225.jpg"
									smallsrc="/website/jjrbtk/photoFile/jz003\20170906/sl_988e253b917ae2dc1a7350d25174d225.jpg"
									alt="爬高10米换灯泡 烈日下的路灯维修工"> </a></li>

						</ul>
					</div>
					<div class="absolute NISlider-trigger-box NISlider-triggerLeft-box">
						<div class="relative NISlider-trigger-inner">
							<div class="absolute NISlider-trigger NISlider-triggerLeft"></div>
							<div class="NISlider-trigger-block"></div>
						</div>
					</div>
					<div
						class="absolute NISlider-trigger-box NISlider-triggerRight-box">
						<div class="relative NISlider-trigger-inner">
							<div class="absolute NISlider-trigger NISlider-triggerRight"></div>
							<div class="NISlider-trigger-block"></div>
						</div>
					</div>
					<div class="absolute NISlider-tab">
						<div class="relative NISlider-tab-inner">
							<div class="absolute NISlider-tab-title">
								<h2></h2>
								<p></p>
							</div>
							<div class="NISlider-tab-block"></div>
							<div class="absolute NISlider-tab-nav"
								style="width: 100%; text-align: center; left: 0px; padding-right: 5px;">
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>
