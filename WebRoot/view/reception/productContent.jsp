<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>产品中心</title>

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

<script type="text/javascript" src="view/reception/js/jqzoom.js"></script>
<script type="text/javascript" src="view/reception/js/jquery.cookie.js"></script>
<script type="text/javascript" src="view/reception/js/artDialog.js"></script>
<script type="text/javascript" src="view/reception/js/iframeTools.js"></script>
<link rel="stylesheet" href="view/reception/js/simple.css">


<script type="text/javascript">
var i =0 ;
function test(s){
	if(i%2==0){
		if($("#"+s).attr("class")=="prolist_side_son open"){
			$("#"+s).attr("class","prolist_side_son close");
		}else{
			$("#"+s).attr("class","prolist_side_son open");
		}
		
		i++;
	}else{
		if($("#"+s).attr("class")=="prolist_side_son close"){
			$("#"+s).attr("class","prolist_side_son open");
		}else{
			$("#"+s).attr("class","prolist_side_son close");
		}
		i++;
	}
	
}


</script>
<style type="text/css" class="A">
.prolist_side,.prolist_side_son {
	padding: 0;
	margin: 0;
	list-style: none;
	zoom: 1;
}

.prolist_side li {
	position: relative;
	background: #FFF;
	zoom: 1;
	overflow: hidden;
}

.prolist_side li ul.close {
	display: none;
}

.prolist_side li ul.open {
	display: block;
}

.prolist_side li span.close {
	display: block;
	padding: 5px 0px 5px 10px;
	background: url(view/reception/images/plus_minus.gif) no-repeat right
		9px;
	position: absolute;
	top: 0;
	right: 0;
	cursor: pointer;
	z-index: 99;
	width: 12px;
	height: 12px;
}

.prolist_side li span.open {
	display: block;
	padding: 5px 0px 5px 10px;
	background: url(view/reception/images/plus_minus.gif) no-repeat right
		-183px;
	position: absolute;
	top: 0;
	right: 0;
	cursor: pointer;
	z-index: 99;
	width: 12px;
	height: 12px;
}

.prolist_side li a {
	display: block;
	zoom: 1;
	position: relative;
	padding: 5px 0px 5px 10px;
	background: url(view/reception/images/list_arr.gif) no-repeat left 9px;
}

.prolist_side li a:hover,.prolist_side li a:active,.prolist_side li a.A
	{
	background: url(view/reception/images/list_arr.gif) no-repeat left -83px;
}

.prolist_side li a.A {
	color: #FF6600;
}

.prolist_side_son li a {
	border-left: 1px solid #DDD;
	padding: 5px 0px 5px 7px;
	background: none;
}

.prolist_side_son li a:hover,.prolist_side_son li a:active,.prolist_side_son li a.A
	{
	border-left: 1px solid #FF6600;
	background: none;
}

.prolist_side_son li a.A {
	color: #FF6600;
}
</style>

<style type="text/css">
.zxx_image_zoom_list img.zxx_zoom_image {
	position: relative;
}

.zxx_image_zoom_list:hover,.zxx_image_zoom_list:hover img.zxx_zoom_image
	{
	border-color: #ff3300;
}

.zxx_image_zoom_div {
	width: 300px;
	height: 300px;
	padding: 0px;
	background: white;
	border: 1px solid #DDDDDD;
	margin-top: -1px;
	text-align: center;
	position: absolute;
	z-index: 1000;
	left: 0;
	top: 0;
	overflow: hidden;
}
</style>

<style type="text/css">
#cen_c{margin: 0 auto;}
</style>
<style type="text/css">
#tags_title {
	border-bottom: 1px solid #DDD;
	background: url(images/title_bg_1.png) repeat-x left top;
}

#tags_title a {
	border: 1px solid #DDD;
	display: inline-block;
	background: #FFF;
	padding: 4px 12px;
	margin-bottom: -1px;
	position: relative;
	margin-left: 5px;
	outline: none;
}

#tags_title a.A {
	border-bottom: 1px solid #FFF;
	color: #FF6600;
	font-weight: bold;
}

#tags_content {
	margin-top: 10px;
}

#tags_content div {
	padding: 0px 5px;
	line-height: 200%;
}
</style>
<style type="text/css">
.zxx_image_zoom_list img.zxx_zoom_image {
	position: relative;
}

.zxx_image_zoom_list:hover,.zxx_image_zoom_list:hover img.zxx_zoom_image
	{
	border-color: #ff3300;
}

.zxx_image_zoom_div {
	width: 300px;
	height: 300px;
	padding: 0px;
	background: white;
	border: 1px solid #DDDDDD;
	margin-top: -1px;
	text-align: center;
	position: absolute;
	z-index: 1000;
	left: 0;
	top: 0;
	overflow: hidden;
}
</style>
</head>

<body onload="onLoadProductContentData()">

	<jsp:include page="indexHeader.jsp"></jsp:include>
	<div id="banner">
		<div id="bannerCon">
			<img src="view/reception/images/banner_text.png" id="bannerText">
			<p id="bannerTit">
				<a href="http://XXXXX/" class="aGray">首页</a> - <a href="http://XXXXX/product.php" class="aGray">产品中心</a> - <a href="http://XXXXX/product.php" class="aGray">产品总汇</a><span>产品中心</span>
			</p>
		</div>
	</div>
	<div id="menuSon">
		<ul id="menuSonList">
			<li><a href="http://XXXXX/product_360.php">产品历史</a></li>
			<li class="A"><a href="http://XXXXX/product.php">产品总汇</a></li>
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
	<div id="main">
		<div>
			<div id="mainC_l">
				<div style="margin-top:0px;">
					<div style="border-bottom:1px solid #E6E6E6;width: 100%;height:20px;">产品详情</div>
					<ul class="prolist_side open">
						<c:forEach items="${sessionScope.product}" var="productList">
							<li><span class="${productList.id==pro.parentId?'open':'close'}" name='${productList.id}'> <!-- onclick="test(this.name);" --> </span> <%--  <a   datavalue="1" >${productList.productName}</a>  --%> <a datavalue="1" class="${productList.id==pro.parentId?'A':'2'}">${productList.productName}</a>
								<ul id='${productList.id}' class="prolist_side_son ${productList.id==pro.parentId?'open':'close'}">

									<c:forEach items="${productList.productChild}" var="productListC">
										<li style="padding-left:10px;"><a class="${param.id==productListC.id?'A':'2'}" href="productAction_onLoadProductContent?id=${productListC.id}">${productListC.productName}</a></li>
									</c:forEach>
								</ul></li>
						</c:forEach>
					</ul>
					<script type="text/javascript">main_list_all("prolist_side");</script>
				</div>
			</div>
			<div id="mainC_r">
				<div style="width:750px; ">
					<div style="border-bottom:1px solid #E6E6E6;width: 100%;height:20px;">产品详情</div>
					<div style="width:750px; margin-top:28px;">
						<div id='cen_c' style="width:100%; text-align:center; height: 300px;">
							
							<div id="pro_img" style="width:100%; height:300px; border:3px solid #EEE; overflow:hidden;">
								<div id="pro_focus_img" style="width:100%; height:300px; _overflow:hidden;">
									<img onload="AutoResizeImage(500,300,this,true);" src="" style="border: 0px none;" height="300" width="400">
								</div>
								<div style="width:100%; height:300px; margin-top:-300px; position:relative; _filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true, sizingMethod=image, src=&#39;images/pro_mark.png&#39;); background:url(images/pro_mark.png) no-repeat !important; _background:none; zoom:1;"></div>
								
 								<div style="width:100%; height:300px; margin-top:-300px;">
									<span href="view/reception/images/20140625141051-0400-88601.jpg" class="zxx_image_zoom_list" style="cursor:move" id="pro_img_zoom">
									<img src="view/reception/images/null.gif" width="400" height="300" class="zxx_zoom_image" border="0">
									</span>
								</div>
								<div style="width: 100%; position: relative; margin-top: -17px; text-align: right; display: none;" id="pro_zoomer">
									<img src="view/reception/images/20140625141051-0400-88601.jpg" border="0">
								</div> 
							</div>
							<div style="margin-top: 5px;">相关产品</div>
							<div id="pro_focus_list" style="width:100%; margin-top:10px; margin-left:2px;">
								<a href="javascript:void(0);" style="background:url(images/pro_focus_left.gif) no-repeat center center; background-color:#FFF; border:1px solid #DDD; width:13px; height:58px; float:left; display:block;" id="pro_img_list_l"></a>
								<div id="pro_focus_imgs" style="width:95%; height:60px; overflow:hidden; margin-left:3px; float:left; white-space:nowrap;">
									<div id="pro_focus_imgs_list" style="margin-left:0; text-align:left;">
										<c:forEach items="${pro.productInfoList}" var='proList'>
										<a href="javascript:void(0);" style="width: 58px; height: 57px; border: 1px solid rgb(255, 204, 0); display: inline-block; text-align: center; margin-left: 3px; margin-right: 3px; padding-top: 1px; background-color: rgb(255, 255, 191);" tab="1">
										<img onload="AutoResizeImage(56,56,this,true);" src="view/reception/pro_Images/${proList.productInfoImg}" alt="${proList.productName}" style="border:0px none; display:block; margin-left:auto; margin-right:auto;" height="56" width="56">
										</a>
										</c:forEach>
									</div>
								</div>
								<a href="javascript:void(0);" style="border: 1px solid rgb(221, 221, 221); width: 13px; height: 58px; float: right; display: block; background: url(http://www.fato.cn/images/pro_focus_right.gif) 50% 50% no-repeat rgb(255, 255, 255);" id="pro_img_list_r"></a>
							</div>
							<script type="text/javascript">pro_focus_mark("pro","#FFCC00","#FFFFBF",1);</script>
						</div>
<style type="text/css">
.bigfiles_list {
	background: url(images/arr_file.gif) no-repeat left 1px;
	line-height: 19px;
	display: inline-block;
	padding-left: 20px;
	margin-top: 7px;
}
</style>
						</div>
						<div style="clear:both; height:26px;"></div>
					</div>
					<div>
						<div id="tags_title">
							<a href="javascript:void(0);" hidefocus="true" tab="0" class="A">适用范围</a>
						</div>
						<div id="tags_content">
							<div style="display: block;" id="tag_content_0">
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CFB3-63系列小型断路器适用于交流50/60Hz,额定电压至230V/400V，额定电流至63A的线路中作过载和短路保护之用，也可用在正常情况下作为线路的不频繁的通断操作。<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									CFB3-63系列断路器配套有CFB3-F辅助触头、CFB3-FB辅助报警触头、CFB3-FL分励脱扣器和CFB3-QY欠压脱扣器、CFB3-GY过压脱扣器、CFB3-GQY过欠压脱扣器等附件，为智能建筑物的智能化控制提供为方便。过压、欠压、过欠压为电子式脱扣器，与断路器或漏电断路器拼装组合使用，适用于交流50HZ/60Hz，额定电压230V的线路，对线路故障引起的过压、欠压、过欠压进行保护，避免由于电网电压波动导致用电设备烧毁或不能正常使用。
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;符合标准：GB10963.1、IEC60898-1</p>
							</div>
						</div>
						<script type="text/javascript">tags_show("tags");</script>
					</div>
						<script type="text/javascript">pro_focus_mark("pro","#FFCC00","#FFFFBF",1);</script>
					</div>
					<script type="text/javascript">tags_show("tags");</script>
				</div>
				<!-- <div id="pro_btm">
					<ul>
					</ul>
				</div> -->
			</div>
			<p style="clear:both; height:30px;"></p>
		</div>
	</div>
	<div id="mainbg"></div>
	<jsp:include page="indexBack.jsp"></jsp:include>
</body>
<link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
<link href="view/reception/css/imeIn.css" rel="stylesheet" type="text/css">
</html>
