<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>资讯-详细内容</title>
    <link rel="shortcut icon" href="favicon.ico">
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
  </head>
  
  <body>
   <jsp:include page="indexHeader.jsp"></jsp:include>
	 <div id="banner">
	  <div id="bannerCon">
	    <img src="view/reception/images/banner_text.png" id="bannerText">
	    <p id="bannerTit"><a href="http://www.fato.cn/" class="aGray">首页</a> - <a href="http://www.fato.cn/news.php" class="aGray">资讯动态</a> - <a href="http://www.fato.cn/news.php?partid=12" class="aGray">企业新闻</a><span>资讯动态</span></p>
	  </div>
	</div>
	<div id="menuSon">
	  <ul id="menuSonList">   
	    <li><a href="http://www.fato.cn/video.php">视频中心</a></li>
	    <li><a href="http://www.fato.cn/news.php?partid=13">行业动态</a></li>
	    <li class="A"><a href="http://www.fato.cn/news.php">企业新闻</a></li>
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
	  <div style="margin-top:26px;"><h1 style="font-size:26px;">${news.newTitle}</h1></div>
	  <p style="color:#888; padding:8px 0px 20px 0px;">Update: ${news.createStrTime}</p>
	    <div style="clear:both;">&nbsp;</div>
	  <div id="content" class="text newscon" style="margin-top:10px;"><p class="MsoNormal" style="text-indent:18.0pt;line-height:150%;">
		${news.newContent}
		</div>
	  <p style="margin-top:30px;"><a href="javascript:history.go(-1);" class="back" style="color: rgb(102, 102, 102); background-color: rgb(238, 238, 238);">返回前页</a>
	  </p><p style="clear:both; height:30px;"></p>
	</div>
	<script type="text/javascript">
	$(".back").hover(function(){
		$(this).stop().animate({'backgroundColor':'#F80','color':'#FFF'},350);
	},function(){
		$(this).stop().animate({'backgroundColor':'#EEE','color':'#666'},300);
	});
	</script>
	<input type="hidden" id='newsId' value="<%=request.getParameter("id")%>"></input>
	<jsp:include page="indexBack.jsp"></jsp:include>
  </body>
  <link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
  <link href="view/reception/css/imeIn.css" rel="stylesheet" type="text/css">
</html>
