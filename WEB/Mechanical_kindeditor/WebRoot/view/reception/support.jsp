<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
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
  
  <!-- <body>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html{width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#l-map{height:800px;width:100%;}
		#r-result{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ouVGLa7XXyq5pn3S0aSREYd5"></script>
	<title>本地搜索的结果面板</title>
</head> 
	<div id="l-map"></div>
</body>
-->
<!-- <script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("l-map");            // 创建Map实例
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
	var local = new BMap.LocalSearch(map, {
		renderOptions: {map: map, panel: "r-result"}
	});
	local.search("珞璜工业园B区");
</script> -->
  <body>
	<jsp:include page="indexHeader.jsp"></jsp:include>
	<div id="banner">
		<div id="bannerCon">
			<img src="./服务承诺-华通机电股份有限公司_files/banner_text.png" id="bannerText">
			<p id="bannerTit">
				<a href="http://www.fato.cn/" class="aGray">首页</a> - <a href="http://www.fato.cn/service.php" class="aGray">服务支持</a> - <a href="http://www.fato.cn/service.php" class="aGray">服务承诺</a><span>服务支持</span>
			</p>
		</div>
	</div>
	<div id="menuSon">
		<ul id="menuSonList">
			<li><a href="http://www.fato.cn/feedback.php">在线反馈</a>
			</li>
			<li><a href="http://www.fato.cn/download.php">下载服务</a>
			</li>
			<li><a href="http://www.fato.cn/faq.php">常见问题</a>
			</li>
			<li class="A" style="background-color: rgb(204, 0, 0);"><a href="http://www.fato.cn/service.php">服务承诺</a>
			</li>
		</ul>
	</div>
	<script type="text/javascript">
		$("#menuSonList li").hover(function() {
			$(this).stop().animate({
				'backgroundColor' : '#CC0000'
			}, 450);
		}, function() {
			if ($(this).attr("class") != "A") {
				$(this).stop().animate({
					'backgroundColor' : '#0066AC'
				}, 350);
			}
		});
	</script>
	<jsp:include page="indexBack.jsp"></jsp:include>
  </body>
<link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
<link href="view/reception/css/imeIn.css" rel="stylesheet" type="text/css">
</html>
