<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>
<style>
.row_e2soof {
    justify-content: flex-end !important;
    -webkit-justify-content: flex-end !important;
    -ms-flex-pack: end !important;
    -webkit-box-pack: end !important;
}
.row_e2soof {
    display: -moz-box !important;
    display: -ms-flexbox !important;
    display: -webkit-box !important;
    display: -webkit-flex !important;
    display: flex !important;
    flex-direction: row !important;
    justify-content: flex-start !important;
    -webkit-flex-direction: row !important;
    -ms-flex-direction: row !important;
    -webkit-justify-content: flex-start !important;
    -webkit-box-orient: horizontal !important;
    -webkit-box-direction: normal !important;
    -ms-flex-pack: start !important;
    -webkit-box-pack: start !important;
}
.moduleContainer_1ud99ov-o_O-withDivider_12fgqlg {
    max-width: 702px !important;
}
.container_1oxj5s3 {
    display: -moz-box !important;
    display: -ms-flexbox !important;
    display: -webkit-box !important;
    display: -webkit-flex !important;
    display: flex !important;
    flex-direction: column !important;
    flex: 1 !important;
    flex-grow: 1 !important;
    -webkit-flex-direction: column !important;
    -ms-flex-direction: column !important;
    -webkit-flex: 1 !important;
    -ms-flex: 1 !important;
    -webkit-flex-grow: 1 !important;
    -webkit-box-orient: vertical !important;
    -webkit-box-direction: normal !important;
    -ms-flex-positive: 1 !important;
}
.titleContainer_1v4h68t {
    display: -moz-box !important;
    display: -ms-flexbox !important;
    display: -webkit-box !important;
    display: -webkit-flex !important;
    display: flex !important;
    flex-direction: row !important;
    align-items: center !important;
    justify-content: space-between !important;
    margin-bottom: 22px !important;
    -webkit-flex-direction: row !important;
    -ms-flex-direction: row !important;
    -webkit-align-items: center !important;
    -webkit-justify-content: space-between !important;
    -webkit-box-orient: horizontal !important;
    -webkit-box-direction: normal !important;
    -ms-flex-align: center !important;
    -webkit-box-align: center !important;
    -ms-flex-pack: justify !important;
    -webkit-box-pack: justify !important;
}
.moduleTitle_1nvzmg8-o_O-moduleTitleContainer_jpmr5e {
    font-family: inherit !important;
    font-size: 23px !important;
    font-weight: bold !important;
    line-height: 27px !important;
    order: 0 !important;
    -webkit-order: 0 !important;
    -ms-flex-order: 0 !important;
}
.columnsContainer_kgas5e {
    flex-direction: column !important;
    -webkit-flex-direction: column !important;
    -ms-flex-direction: column !important;
    -webkit-box-orient: vertical !important;
    -webkit-box-direction: normal !important;
}
.column_1mgu2hu {
    display: -moz-box !important;
    display: -ms-flexbox !important;
    display: -webkit-box !important;
    display: -webkit-flex !important;
    display: flex !important;
    flex-direction: column !important;
    -webkit-flex-direction: column !important;
    -ms-flex-direction: column !important;
    -webkit-box-orient: vertical !important;
    -webkit-box-direction: normal !important;
}
.contentColumnTitle_fo1rk1 {
    font-family: inherit !important;
    font-size: 17px !important;
    font-weight: bold !important;
    line-height: 23px !important;
    color: #888D93 !important;
}
.container_ww5j1n-o_O-containerIcon_19zvu2s {
    display: -moz-box !important;
    display: -ms-flexbox !important;
    display: -webkit-box !important;
    display: -webkit-flex !important;
    display: flex !important;
    flex-direction: row !important;
    position: relative !important;
    align-items: center !important;
    -webkit-flex-direction: row !important;
    -ms-flex-direction: row !important;
    -webkit-align-items: center !important;
    -webkit-box-orient: horizontal !important;
    -webkit-box-direction: normal !important;
    -ms-flex-align: center !important;
    -webkit-box-align: center !important;
}
.container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2 {
    display: -moz-box !important;
    display: -ms-flexbox !important;
    display: -webkit-box !important;
    display: -webkit-flex !important;
    display: flex !important;
    flex-direction: row !important;
    position: relative !important;
    align-items: center !important;
    width: 100% !important;
    overflow: visible !important;
    -webkit-flex-direction: row !important;
    -ms-flex-direction: row !important;
    -webkit-align-items: center !important;
    -webkit-box-orient: horizontal !important;
    -webkit-box-direction: normal !important;
    -ms-flex-align: center !important;
    -webkit-box-align: center !important;
}
.link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a {
    background-color: transparent !important;
    color: inherit !important;
    text-decoration: none !important;
    display: -moz-box !important;
    display: -ms-flexbox !important;
    display: -webkit-box !important;
    display: -webkit-flex !important;
    display: flex !important;
    flex-grow: 1 !important;
    flex-direction: grow !important;
    padding-left: 0px !important;
    align-items: center !important;
    margin-top: 0px !important;
    padding-bottom: 7px !important;
    padding-top: 0px !important;
    padding-right: 0px !important;
    -webkit-flex-grow: 1 !important;
    -webkit-flex-direction: grow !important;
    -ms-flex-direction: grow !important;
    -webkit-align-items: center !important;
    -ms-flex-positive: 1 !important;
    -webkit-box-orient: horizontal !important;
    -webkit-box-direction: normal !important;
    -ms-flex-align: center !important;
    -webkit-box-align: center !important;
}
a:-webkit-any-link {
    color: -webkit-link;
    cursor: auto;
    text-decoration: underline;
}
.container_ww5j1n-o_O-containerIcon_19zvu2s {
    display: -moz-box !important;
    display: -ms-flexbox !important;
    display: -webkit-box !important;
    display: -webkit-flex !important;
    display: flex !important;
    flex-direction: row !important;
    position: relative !important;
    align-items: center !important;
    -webkit-flex-direction: row !important;
    -ms-flex-direction: row !important;
    -webkit-align-items: center !important;
    -webkit-box-orient: horizontal !important;
    -webkit-box-direction: normal !important;
    -ms-flex-align: center !important;
    -webkit-box-align: center !important;
}
.link_638s75:visited {
    color: inherit !important;
}
.link_638s75 {
    color: inherit !important;
    text-decoration: none !important;
}
</style>
<body>
<div id="1" class="moduleContainer_1ud99ov-o_O-withDivider_12fgqlg" style=" margin-top:22px; margin-left:30px;">
<div class="container_1oxj5s3">
<div class="titleContainer_1v4h68t">
  <div class="moduleTitle_1nvzmg8-o_O-moduleTitleContainer_jpmr5e" style="color: inherit; font-family: inherit; font-size: inherit; margin-bottom: 0px;"><span style="color: rgb(2, 125, 151);"><a class="link_638s75" href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined">Limits from graphs1</a></span></div>
</div>
</div>
<div class="columnsContainer_kgas5e" style="border-bottom: #CCCCCC 1px solid; padding-bottom:20px;">
<div class="column_1mgu2hu">
<div class="contentColumnTitle_fo1rk1" style="padding-bottom: 22px;">Learn</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="html5-video-player-mobile/index.html" target="mainFrame" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: function undefined
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: limit isn't equal to the function's value
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: asymptote
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a> </div>
</div>
</div>
</div>
</div>
<div class="moduleContainer_1ud99ov-o_O-withDivider_12fgqlg" style=" margin-top:22px; margin-left:30px;">
<div class="container_1oxj5s3">
<div class="titleContainer_1v4h68t">
  <div id="2" class="moduleTitle_1nvzmg8-o_O-moduleTitleContainer_jpmr5e" style="color: inherit; font-family: inherit; font-size: inherit; margin-bottom: 0px;"><span style="color: rgb(2, 125, 151);"><a class="link_638s75" href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined">Limits from graphs2</a></span></div>
</div>
</div>
<div class="columnsContainer_kgas5e" style="border-bottom: #CCCCCC 1px solid; padding-bottom:20px;">
<div class="column_1mgu2hu">
<div class="contentColumnTitle_fo1rk1" style="padding-bottom: 22px;">Learn</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: function undefined
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: limit isn't equal to the function's value
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: asymptote
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a> </div>
</div>
</div>
</div>
</div>
<div class="moduleContainer_1ud99ov-o_O-withDivider_12fgqlg" style=" margin-top:22px; margin-left:30px;">
<div class="container_1oxj5s3">
<div class="titleContainer_1v4h68t">
  <div class="moduleTitle_1nvzmg8-o_O-moduleTitleContainer_jpmr5e" style="color: inherit; font-family: inherit; font-size: inherit; margin-bottom: 0px;"><span style="color: rgb(2, 125, 151);"><a class="link_638s75" href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined">Limits from graphs</a></span></div>
</div>
</div>
<div class="columnsContainer_kgas5e" style="border-bottom: #CCCCCC 1px solid; padding-bottom:20px;">
<div class="column_1mgu2hu">
<div class="contentColumnTitle_fo1rk1" style="padding-bottom: 22px;">Learn</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: function undefined
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: limit isn't equal to the function's value
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: asymptote
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a> </div>
</div>
</div>
</div>
</div>
<div class="moduleContainer_1ud99ov-o_O-withDivider_12fgqlg" style=" margin-top:22px; margin-left:30px;">
<div class="container_1oxj5s3">
<div class="titleContainer_1v4h68t">
  <div class="moduleTitle_1nvzmg8-o_O-moduleTitleContainer_jpmr5e" style="color: inherit; font-family: inherit; font-size: inherit; margin-bottom: 0px;"><span style="color: rgb(2, 125, 151);"><a class="link_638s75" href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined">Limits from graphs</a></span></div>
</div>
</div>
<div class="columnsContainer_kgas5e" style="border-bottom: #CCCCCC 1px solid; padding-bottom:20px;">
<div class="column_1mgu2hu">
<div class="contentColumnTitle_fo1rk1" style="padding-bottom: 22px;">Learn</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: function undefined
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: limit isn't equal to the function's value
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: asymptote
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a> </div>
</div>
</div>
</div>
</div>
<div class="moduleContainer_1ud99ov-o_O-withDivider_12fgqlg" style=" margin-top:22px; margin-left:30px;">
<div class="container_1oxj5s3">
<div class="titleContainer_1v4h68t">
  <div class="moduleTitle_1nvzmg8-o_O-moduleTitleContainer_jpmr5e" style="color: inherit; font-family: inherit; font-size: inherit; margin-bottom: 0px;"><span style="color: rgb(2, 125, 151);"><a class="link_638s75" href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined">Limits from graphs</a></span></div>
</div>
</div>
<div class="columnsContainer_kgas5e" style="border-bottom: #CCCCCC 1px solid; padding-bottom:20px;">
<div class="column_1mgu2hu">
<div class="contentColumnTitle_fo1rk1" style="padding-bottom: 22px;">Learn</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: function undefined
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: limit isn't equal to the function's value
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a></div>
</div>
<div class="container_ww5j1n-o_O-containerIcon_19zvu2s">
  <div class="container_ww5j1n-o_O-containerIcon_19zvu2s-o_O-innerContainer_f2c28e-o_O-innerContainerWithOverflow_6bzma2"><a href="/math/calculus-home/limits-and-continuity-calc/limits-from-graphs-calc/v/limits-from-graphs-undefined" class="link_1uvuyao-o_O-nodeStyle_cu2reh-o_O-nodeStyleIcon_4udnki-o_O-contentItem_7q856k-o_O-bottomPaddingContentItem_19hzh6a">
    <div class="iconWithProgress_1npp1cn">
      <div class="container_3vwylo">
        <div><span aria-label="Video" class="container_13hv8io" style="display: block; width: 23px; height: 22px; font-size: 22px;">
          <svg role="img" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
            <path fill="#11accd" d="M10.555 7.17l6 4a1 1 0 0 1 0 1.664l-6 4A1 1 0 0 1 9 16.002v-8a1 1 0 0 1 1.555-.832z
 M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0 2C5.373 24 0 18.627 0 12S5.373 0 12 0s12 5.373 12 12-5.373 12-12 12z"></path>
          </svg>
          </span><span aria-label="completed"></span></div>
      </div>
    </div>
    <div class="nodeInfo_j299ma-o_O-nodeInfoIcon_abpr7p">
      <div class="nodeTitleLight_1dubl9v">
        <!-- react-text: 598 -->
        Limits from graphs: asymptote
        <!-- /react-text -->
        <!-- react-text: 599 -->
        <!-- /react-text -->
      </div>
    </div>
    </a> </div>
</div>
</div>
</div>
</div>

<div id="z1">eeeeee</div>
</body>
</html>
