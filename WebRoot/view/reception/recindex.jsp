<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<title>重庆劲凯机电设备有限公司</title>
<meta name="baidu-site-verification" content="cnkPDTHDis" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="仓储设备,机电设备,运输设备">
<link rel="icon" href="view/reception/images/favicon.ico" type="image/x-icon">
<link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="view/reception/js/jquery.min.1.7.js"></script>
<script type="text/javascript" src="view/reception/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="view/reception/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="view/reception/js/diy_index/public-all.js"></script>


</head>


<body>
<jsp:include page="indexHeader.jsp"></jsp:include>
<div id="banner">
  <div id="banner1" style="display: block;"><img src="view/reception/images/banner1.jpg"></div>
  <div id="banner2" style="display: none;"><img src="view/reception/images/banner2.jpg"></div>
  <div id="banner3" style="display: none;"><img src="view/reception/images/banner3.jpg"></div>
</div>

<script type="text/javascript">
var tab=1;
var prev=null;
function showBanner(tab,prev){
	if(prev==null){
		$("#banner"+tab).stop().fadeIn(400,"easeOutQuad");
	}else{		
		$("#banner"+prev).stop().fadeOut(400,"easeOutQuad",function(){
			$("#banner"+tab).stop().fadeIn(400,"easeOutQuad");	
		});
	}
}
//自动运行
function autoShow(){
	tab++;	
	if(tab>=4){
		tab=1;
		prev=3;
	}else if(tab>0){
		prev=tab-1;	
	}
	showBanner(tab,prev);	
}
showBanner(1,prev);
var auto=setInterval(function(){autoShow(tab,prev);},3000);
</script>
<div style="width:1000px; height:30px; margin:auto; position:relative; z-index:6;">
  <div style="width:1000px; height:400px; top:-430px; position:absolute; z-index:6; overflow:hidden;">
  <div style="width:150px; height:45px; background:#0067AC; position:absolute; z-index:7; color:#FFF; text-align:center; font-size:14px; line-height:42px; font-weight:bold; top:355px;">模范案例<img src="view/reception/images/arr.gif" style="margin-left:8px; margin-top:-2px;"></div>
  <div class="solution" style="left: 150px; top: 355px; background-color: rgb(255, 255, 255);">
    <p style="line-height: 42px; padding-left: 16px; padding-top: 0px; color: rgb(102, 102, 102);">
    <img src="view/reception/images/icon_1.png" height="28" style="margin-right: 5px; margin-top: 7px; float: left; width: 28px; height: 28px;">三峡工程</p>
    <p style="padding:10px 26px; line-height:180%;">三峡水电站是世界上规模最大的水电站，也是中国有史以来建设最大型的工程项目，是全世界最大的水力发电站和清洁能源生产基地。</p>
  </div>
  <div class="solution" style="left:360px;">
    <p style="line-height:42px; padding-left:16px;">
    <img src="view/reception/images/icon_2.png" height="28" style="margin-right:10px; margin-top:7px; float:left;">航天事业</p>
    <p style="padding:10px 26px; line-height:180%;">酒泉卫星发射中心是中国最早建成的运载火箭发射试验基地，截至2005年10月，中国发射了约50颗人造卫星，其中37颗在酒泉发射。</p>
  </div>
  <div class="solution" style="left:570px;">
    <p style="line-height:42px; padding-left:16px;">
    <img src="view/reception/images/icon_3.png" height="28" style="margin-right:10px; margin-top:7px; float:left;">南水北调</p>
    <p style="padding:10px 26px; line-height:180%;">南水北调是缓解中国北方水资源严重短缺局面的战略性工程，通过跨流域的水资源合理配置，大大缓解我国北方水资源严重短缺问题，分东线、中线、西线三条调水线。</p>
  </div>
  <div class="solution" style="left:780px;">
    <p style="line-height:42px; padding-left:16px;">
    <img src="view/reception/images/icon_4.png" height="28" style="margin-right:10px; margin-top:7px; float:left;">中国石油</p>
    <p style="padding:10px 26px; line-height:180%;">中国石油天然气集团公司是一家集油气勘探开发、炼油化工、油品销售、油气储运、石油贸易、工程技术服务和石油装备制造于一体的综合性能源公司。</p>
  </div>
  </div>
</div>
<script type="text/javascript">
$(".solution").hover(function(){
	$(this).stop().animate({"top":"155px","backgroundColor":"#EEE"},400,"easeOutQuad");
	$(this).find("p").eq(0).stop().animate({"paddingTop":"10px","color":"#F70"},400,"easeOutQuad");
	$(this).find("p").eq(0).find("img").stop().animate({"width":"68px","height":"68px"},300,"easeOutQuad");
},function(){
	$(this).stop().animate({"top":"355px","backgroundColor":"#FFF"},300,"easeOutQuad");
	$(this).find("p").eq(0).stop().animate({"paddingTop":"0px","color":"#666666"},300,"easeOutQuad");
	$(this).find("p").eq(0).find("img").stop().animate({"width":"28px","height":"28px"},250,"easeOutQuad");
});
</script>
<div id="main" style="height:306px;">
  <div style="float:left; width:380px;">
    <p style="color:#0066CC; font-size:16px;">新闻动态 &nbsp;<span style="color:#999; font-size:11px; font-family:Arial;">What's New</span></p>
    <p style="border-top:1px dotted #CCC;">
      </p>
	 <div id="newslist">
	 
	 
	 </div>
    <p style="padding-top:8px; padding-left:10px;"><a href="newsAction_onLoadNewsTitleToJsp" class="more">More…</a></p>
  </div>
  <div style="float:left; width:260px; margin-left:30px;">
    <div style="width:260px; height:130px; background:#0066AC; position:relative; z-index:1; cursor:pointer;" id="videoblcok"> <!--onclick="location.href=&#39;video.php&#39;;   -->
      <img src="view/reception/images/icon_play.png" height="80" style="position:absolute; right:22px; top:24px;">
      <p style="padding-top:40px; padding-left:22px; color:#FFF; font-size:16px;">视频中心</p>
      <p style="padding-top:4px; padding-left:22px; color:#A8CBE3; font-size:11px;">JK Video Center</p>
    </div>
    <div style="width:260px; height:130px; margin-top:10px; background:#DDD; position:relative; z-index:1; cursor:pointer;" id="showblock" onclick="location.href='productAction_onLoadProductToJsp'" ><!--onclick="location.href=&#39;product_360.php&#39;;"   -->
      <img src="view/reception/images/icon_rotation.png" height="76" style="position:absolute; right:22px; top:25px;">
      <p style="padding-top:40px; padding-left:22px; font-size:16px;">产品展示</p>
      <p style="padding-top:4px; padding-left:22px; color:#AAA; font-size:11px;">360° Product Display</p>
    </div>
    <script type="text/javascript"></script>
  </div>  
  <div style="float:left; width:300px; margin-left:30px;">
    <p style="color:#0066CC; font-size:16px;">产品目录 &nbsp;<span style="color:#999; font-size:11px; font-family:Arial;">Product Catalog</span></p>
    <ul id="procatalog">
    	<c:forEach items="${productType}" var="product">
    		<li><a href=''>${product.productName }</a></li>
    	</c:forEach>
    </ul>
    <p style="clear:both; padding-top:8px; padding-left:10px;"><a href="productAction_onLoadProductToJsp" class="more">More…</a></p>
  </div>
</div>
<script type="text/javascript">
$("#videoblcok").hover(function(){
	$(this).stop().animate({'backgroundColor':'#F80'},450,"easeOutQuad");
	$(this).find("p").eq(1).stop().animate({'color':'#FFCF99'},450,"easeOutQuad");
},function(){
	$(this).stop().animate({'backgroundColor':'#0066AC'},400,"easeOutQuad");
	$(this).find("p").eq(1).stop().animate({'color':'#A8CBE3'},400,"easeOutQuad");
});
$("#showblock").hover(function(){
	$(this).stop().animate({'backgroundColor':'#F80'},450,"easeOutQuad");
	$(this).find("p").eq(0).stop().animate({'color':'#FFF'},450,"easeOutQuad");
	$(this).find("p").eq(1).stop().animate({'color':'#FFCF99'},450,"easeOutQuad");
},function(){
	$(this).stop().animate({'backgroundColor':'#DDD'},400,"easeOutQuad");
	$(this).find("p").eq(0).stop().animate({'color':'#666'},450,"easeOutQuad");
	$(this).find("p").eq(1).stop().animate({'color':'#AAA'},400,"easeOutQuad");
});
</script>
<jsp:include page="indexBack.jsp"></jsp:include>

</body>
</html>
