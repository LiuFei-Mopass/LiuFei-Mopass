<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String paths = request.getContextPath()+"/view/backstage/";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'backProduct.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/default/easyui.css" />   
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/icon.css" />   
	<script type="text/javascript" src="<%=paths%>easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="<%=paths%>easyui/jquery.easyui.min.js"></script> 
	<style type="text/css">
		html,body,div{margin: 0;padding: 0}
		#body_cen span{float: left;margin-left: 20px;}
	</style>
	
  </head>
  
  <body>
  <script type="text/javascript" src="<%=paths%>js/backProductType.js"></script> 
  	<div>
  		<div id='body_cen' style="margin-top: 10px;">
  			<span style="margin-left: 20px;">类别名称：<input class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </span>
  			<span style="margin-left: 20px;">类别名称：<input class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </span>
  			<div style="clear: both;"></div>
  		</div>
  		<div style="margin-top: 10px;">
  				<table id="dg" width="100%" data-options=""></table> 
  		</div>
  	
  	
  	</div>
  </body>
</html>
