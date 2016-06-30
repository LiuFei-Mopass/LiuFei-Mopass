<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>人力资源-招聘职位</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="view/reception/css/ui-box.css" rel="stylesheet" type="text/css">
	
	
	
	<script type="text/javascript" src="view/reception/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="view/reception/js/diy_index/public-all.js"></script>
 	<script type="text/javascript" src="view/reception/js/diy_index/resourece.js"></script>
	<script type="text/javascript" src="view/reception/js/public.js"></script>
	
	<style type="text/css">
.man_left_left,.man_right {
	background-color: #EEEEEE;
	border-radius: .8em;
}

.man_left {
	float: left;
	width: 302px;
	height: 100%;
	background-color: #EEEEEE; 
	border-radius: .8em;
}

.man_left_left,.man_left_right {
	height: 88%
}

.man_left_left,.man_left_right {
	margin: 0;
	padding: 0
}

.man_left_left ul {
	margin-left: 30px;
}

.man_left_left ul li {
	border: 1px red solid;
	height: 70px;
	margin-top: 20px;
	-webkit-border-radius: 10px;
	vertical-align: ;
}

.header {
	border: 0px solid #CCC;
	width: 15em;
	height: ;
	background: #EEEEEE;
	border-radius: .8em;
	margin: 0 auto;
	padding: 2em;
}

.header div {
	height: 3em;
	width: 10em;
	margin-top: 10px;
	border-radius: .5em;
	margin-left: 0em;
	-webkit-box-align: center;
	box-align: center;
	padding-left: 3em;
	font-size: 20px;
	cursor: pointer;
	border-bottom: 1px dashed white;
}

.hea_img {
	float: right;
	margin-left: 18em;
	display: none;
}

.hea2 {
	border: px solid;
	background: #CC0000;
	color: white;
}
.hea3 {
	border: px solid;
	background: #CC0000;
	color: white;
}
.re{border: 0px dashed #0066CC;height:35px;	 width: 198px}

.body{background: #FFF; padding-top: 100px;}
.ub_ul{border: px solid ; width: 200px; background: #ccc; height: 500px; margin: 0 auto; float: left; margin-left: 600px}
.ub_ul ul a{color: #000;} 
.ub_ul ul a li{ border: px solid ;  width: 200px; font-size: 20px; line-height: 40px; text-align: center;border-radius: .5em;}
.ub_ul1{border: px solid ;width: 400px; height: 500px; background: #ccc; float: left; text-align: center;}
.ub_ul1 p{display: none;}
.man_left div span{margin-left: 30px;font-size: 19px;}
.man_left div div{border: px solid ;  width: 100%; font-size: 20px; line-height: 40px; text-align: center;border-radius: .3em;text-align: center;line-height: 60px;}
.bottom_style{height:30px;width: 600px; border-bottom: 1px dashed #CC0000}
.non1,.non2,.non3,.non4, div .sub_tit{text-align: center;}
</style>

  </head>

<body onload="onLoadResourceData()">
	<jsp:include page="indexHeader.jsp"></jsp:include>
	<div id="banner">
		<div id="bannerCon">
			<img src="view/reception/images/banner_text.png" id="bannerText">
			<p id="bannerTit">
				<a class="aGray">首页</a> - <a class="aGray">人力资源</a> - <a class="aGray">招聘职位</a><span></span>
			</p>
		</div>
	</div>
	<div id="menuSon">
		<ul id="menuSonList">
			<li><a href="####">文秘/销售</a>
			</li>
			<li class="A" style="background-color: rgb(204, 0, 0);"><a href="">技术特长</a>
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
	<div id="main" >
	<%--
		<ul class="newslist" id = "newstit" style="margin-top:20px;">
 	 <c:forEach items="${NewsList}" var="newslist">
	    <li>
		      <a href="getnewcontent.html?id=${newslist.id}">
		        <div class="tim" style="background-color: rgb(238, 238, 238);"><p style="font-size: 46px; font-family: Arial; color: rgb(136, 136, 136);">${fn:substring(newslist.createStrTime,8,10)}</p><p style="color: rgb(136, 136, 136);">${fn:substring(newslist.createStrTime,0,7)}</p></div>
				<div class="con"><p style="font-size: 14px; color: rgb(0, 102, 204);">${newslist.newTitle }</p>
				<p style="color:#999; margin-top:9px; line-height:180%; text-overflow:ellipsis">${newslist.newContent }</p></div>
		      </a>
	    </li>
	    <li class="clear"></li>
 	 </c:forEach>
	</ul>
	<div style="margin-top:20px; padding-bottom:10px;">
		<div class="pageshow">
			<p style="margin-top:30px;">
				<a id="pageToUp" class="back" >上一页</a>
				<div style="width: 100px;float: left;height: 25px;color: rgb(102, 102, 102);margin-top: 10px; ">
					<span style="margin-left: 25px;">
						<span   id="currentPage" style="line-height: 25px;">${page}</span>
						<span>/</span>
						<span   id="pageNums" style="line-height: 25px;">${pagesize}</span>
					</span>
				</div>
				<a id="pageToNext" class="back" >下一页</a>
				<p style="clear:both; height:30px;"></p>
				<!-- <div class="pageright">
					跳转：<input name="page" type="text" class="trunpage" value="1" size="2"> <a href="javascript:gotoPage('0','');" class="pagebtn" style="margin:0;">GO</a> 
				</div> -->
				<div style="clear:both; height:1px; font-size:1px;"></div>
			</div>
	</div>
	 --%>
		<p style="clear:both; height:30px;"></p>
	</div>
	<jsp:include page="indexBack.jsp"></jsp:include>
</body>
<link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
<link href="view/reception/css/imeIn.css" rel="stylesheet" type="text/css">
</html>
