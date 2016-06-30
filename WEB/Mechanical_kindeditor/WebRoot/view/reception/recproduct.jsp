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
    
    <title>重庆劲凯-产品中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

	<script type="text/javascript" src="view/reception/js/jquery.min.1.7.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="view/reception/js/public.js"></script>
	<script type="text/javascript" src="view/reception/js/diy_index/public-all.js"></script>

  </head>
  <!-- ### -->
  <body onload="onLoadProductData()">
    <jsp:include page="indexHeader.jsp"></jsp:include>
		<div id="banner">
		  <div id="bannerCon">
		    <img src="view/reception/images/banner_text.png" id="bannerText">
		    <p id="bannerTit"><a  class="aGray">首页</a> - <a class="aGray">产品中心</a> - <a  class="aGray">产品总汇</a><span>产品中心</span></p>
		  </div>
		</div>
		<div id="menuSon">
		  <ul id="menuSonList">
		    <li><a href="http://###/product_360.php">产品历史</a></li>
		    <li class="A"><a href="./product_files/product.html">产品总汇</a></li>
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
		    <div style="width:1000px; overflow:hidden;">
		    <ul id="clslist">
		    <c:forEach items="${requestScope.product}" var="p" varStatus="i">
			  <li>
		        <span class="img"><a ><img src="${p.produntThumbnail}"></a></span>
		        <span class="title"><a >${p.productName}</a></span>
		        <ul class="prolist">
		        			<c:forEach items="${p.productChild}" var ="pc">
		                    <li><a href="productAction_onLoadProductContent?id=${pc.id}" >${pc.productName}</a></li>
		        			</c:forEach>
                </ul>
		      </li>
		      <c:if test="${i.count%4==0}">
			 	 <li class="clear"></li>    
		      </c:if> 
		    </c:forEach>
		      
			  </ul>
		  </div>
		  </div>
	<jsp:include page="indexBack.jsp"></jsp:include>		
  </body>
  	<link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
	<link href="view/reception/css/imeIn.css" rel="stylesheet" type="text/css">
</html>
