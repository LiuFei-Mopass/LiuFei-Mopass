<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="view/reception/js/jquery.min.1.7.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="view/reception/js/diy_index/js.js"></script>
  </head>
  
  <body>
    <div id="head">
		  <div id="headmenu"><a href="http://www.cqjinkai.com">首页</a><a href="###">联系我们</a><!-- <a href="####http://www.chinafato.net/chinafato/en/">English</a> -->
		  </div>
		</div>
		<div id="top" >
		  <div id="logo"><a href="index.html"><img src="view/reception/images/logo.png"></a></div>
		  <ul id="menu" style="">
			<li><a href='about.html' class=''>走进劲凯</a>
			<div style='display: none; overflow: hidden; height: auto; margin-top: 0px; margin-bottom: 0px; padding-top: 10px; padding-bottom: 15px;'>
					<a href='view/reception/about.jsp?num=1'>企业概况</a><a href='view/reception/about.jsp?num=2'>企业文化</a><a href='view/reception/about.jsp?num=3'>发展历史</a><a href='view/reception/about.jsp?num=4'>联系我们</a>
				</div>
			</li>
			<li class='split'><img src='view/reception/images/menu_split.gif'>
			</li>
			<li><a href="news.html?page=1"  class=''>资讯动态</a>
			<div style='display: none; overflow: hidden; height: auto; margin-top: 0px; margin-bottom: 0px; padding-top: 10px; padding-bottom: 15px;'>
					<a href='newsAction_onLoadNewsTitleToJsp'>公司新闻</a><a href='newsAction_onLoadNewsTitleToJsp'>行业新闻</a>
				</div>
			</li>
			<li class='split'><img src='view/reception/images/menu_split.gif'>
			</li>
			<li><a href='view/reception/productCase.jsp' class=''>产品案例</a>
			<div style='display: none; overflow: hidden; height: auto; margin-top: 0px; margin-bottom: 0px; padding-top: 10px; padding-bottom: 15px;'></div>
			</li>
			<li class='split'><img src='view/reception/images/menu_split.gif'>
			</li>
			<li><a href='product.html' class=''>产品中心</a>
			<div style='display: none; overflow: hidden; height: auto; margin-top: 0px; margin-bottom: 0px; padding-top: 10px; padding-bottom: 15px;'>
					<a href='productAction_onLoadProductToJsp'>工位器具系列</a><a href='productAction_onLoadProductToJsp'>货架系列</a><a href='productAction_onLoadProductToJsp'>单元化储存系列</a><a href='productAction_onLoadProductToJsp'>搬运输送系列</a><a href='productAction_onLoadProductToJsp'>化学品储存系列</a><a
						href='productAction_onLoadProductToJsp'>工具柜系列</a>
				</div>
			</li>
			<li class='split'><img src='view/reception/images/menu_split.gif'>
			</li>
			<li><a href='resource.html' class=''>加入我们</a>
			<div style='display: none; overflow: hidden; height: auto; margin-top: 0px; margin-bottom: 0px; padding-top: 10px; padding-bottom: 15px;'>
					<a href='asdasd'>招聘职位</a>
				</div>
			</li>
			<li class='split'><img src='view/reception/images/menu_split.gif'>
			</li>
			<li><a href='support.html' class=''>服务与支持</a>
			<div style='display: none; overflow: hidden; height: auto; margin-top: 0px; margin-bottom: 0px; padding-top: 10px; padding-bottom: 15px;'></div>
			</li>
			<li class='split'><img src='view/reception/images/menu_split.gif'>
			</li>
		</ul>   <!-- 菜单栏加载 --> 
		  <div id="search">
			  <form id="formsearch" name="formsearch" method="get" action="###">    
			    <div style="width:36px; height:28px; float:right;"><img src="view/reception/images/search_btn.png" style="cursor:pointer;" ></div><!--onclick="$(&#39;#formsearch&#39;).submit();"   -->
			    <div style="background:#EEE; height:28px; line-height:26px; width:150px; float:right; border-radius:4px 0px 0px 4px;"><input type="text" name="keys" id="keys" value="关键词…" style="background:none; border:0px none; padding:5px; margin-left:2px; margin-top:1px; color:#888; width:130px; outline:none;"></div>
			  </form>
		  </div>
		</div>
		<script type="text/javascript">
		$("#keys").focus(function(){
			$(this).css("color","#FFF");
			if($(this).val()=='关键词…'){
				$(this).val('');
			}
			$(this).parent().stop().animate({"backgroundColor":"#0067AC","width":"180px"},350);
			$(this).stop().animate({"width":"160px"},350);
		});
		$("#keys").blur(function(){
			$(this).css("color","#888");
			if($(this).val()==''){
				$(this).val('关键词…');
			}
			$(this).parent().stop().animate({"backgroundColor":"#EEEEEE","width":"150px"},300);
			$(this).stop().animate({"width":"130px"},300);
		});
		$("#menu li").hover(function(){
			if($(this).attr("bg")=="none"){
				$(this).find("a").css("background","none");
			}
			$(this).find("a").eq(0).addClass("A");
			$(this).find("div").stop().slideDown(350);
		},function(){
			if($(this).attr("bg")=="none"){
				$(this).find("a").css("background","none");
			}
			$(this).find("a").eq(0).removeClass("A");
			$(this).find("div").stop().slideUp(200);
		});
		</script>
  </body>
</html>
