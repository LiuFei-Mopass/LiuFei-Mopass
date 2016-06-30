<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>重庆劲凯机电-关于劲凯</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="view/reception/js/jquery.min.1.7.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="view/reception/js/diy_index/public-all.js"></script>
	<script type="text/javascript" src="view/reception/js/public.js"></script>
	<style type="text/css">
	.aboutTit{cursor: pointer;}
	</style>
	<style type="text/css">
		body, html{width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#l-map{height:400px;width:600px;}
		#r-result{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ouVGLa7XXyq5pn3S0aSREYd5"></script>
  </head>
  
  <body onload="onLoadAboutData()">
  	<jsp:include page="indexHeader.jsp"></jsp:include>
	   <div id="banner">
	  	<div id="bannerCon">
	    <img src="view/reception/images/banner_text.png" id="bannerText">
	    <p id="bannerTit"><a class="aGray">首页</a> - <a  class="aGray">关于劲凯</a> - <a  class="aGray">企业概况</a><span></span></p>
	  </div>
	</div>
	<div id="menuSon">
	  <ul id="menuSonList">   
	    <li class="${param.num==4?'A':''}"><a class="aboutTit" name='4' >联系我们</a></li>
	    <li class="${param.num==3?'A':''}"><a class="aboutTit" name='3' >发展历程</a></li>
	    <li class="${param.num==2?'A':''}"><a class="aboutTit" name='2' >企业文化</a></li>
	    <li class="${param.num==1?'A':''}"><a class="aboutTit" name='1' >企业概况</a></li>
	  </ul>
	</div>
	<script type="text/javascript">
	$("#menuSonList li").hover(function(){
		$(this).stop().animate({'backgroundColor':'#CC0000'},450);
	},function(){
		if($(this).attr("class")!="A"){
		  $(this).stop().animate({'backgroundColor':'#0066AC'},350);
		}
	});
	</script>
	<div id="main" >
		<div class="text" style="margin-top:20px;">
			<p style="display: ${param.num==1?'block':'none'}">
				<img style="float:left;margin-right:20px;" src="view/reception/images/about.jpg"> 重庆劲凯机电设备有限公司公司专用从事仓储物流设备的生产和销售，是国内最大的仓库物流设备供应商之一，公司的主要产品包括工位器具、工作台、工具柜、仓储货架、塑料制品、木制品、非标仓储盛具等。
				公司注重技术研发和产品质量管理及控制，公司先后通过了ISO9001质量管理认证、ISO14001环境等管理体系认证。公司产品广泛应用于电子、医药、烟草、电力、图书、机械制造、汽车、饮料、食品、冷链物流、日用百货、物流等各行各业的物流仓储和配送活动，应用领域十分广泛。在行业内树立了良好的品牌形象并取得了较高的市场占有率。 重庆劲凯机电设备有限公司在“诚信、用心、专业、高效”的经营理念引导下，正以一流的技术、先进的管理、现代化的设备、高速的发展速度向着”成为国内一流的智能仓储设备供应商“的目标迈进。

			</p>
			<div style="display: ${param.num==4?'block':'none'}">
				<div style="float: left;">
					<p style="color:#0066CC; font-size:16px;">
						新闻动态 &nbsp;<span style="color:#999; font-size:11px; font-family:Arial;">What's New</span>
					</p>
				</div>
				<div style="float: right;">
					<div id="l-map"></div>
				</div>
				<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("l-map");            // 创建Map实例
	map.centerAndZoom(new BMap.Point(), 11);
	var local = new BMap.LocalSearch(map, {
		renderOptions: {map: map, panel: "r-result"}
	});
	local.search("珞璜工业园B区");
</script>

			</div>
		</div>
	</div>
	<div id="mainbg"></div>
	<jsp:include page="indexBack.jsp"></jsp:include>
  </body>
<link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
<link href="view/reception/css/imeIn.css" rel="stylesheet" type="text/css">
</html>
