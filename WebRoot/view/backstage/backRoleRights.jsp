<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String paths = request.getContextPath()+"/view/backstage/";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'backRight.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/default/easyui.css" />   
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/icon.css" />   
	<script type="text/javascript" src="<%=paths%>easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="<%=paths%>easyui/jquery.easyui.min.js"></script> 
	<style type="text/css"></style>
  </head>
  
    	
 <body >   
 		<script type="text/javascript" src="<%=paths%>js/easyui_public.js"></script>
    	<script type="text/javascript" src="<%=paths%>js/backRoleRights.js"></script>
	    <div id="cc" class="easyui-layout" style="height:${param.hei-65}px;width:${param.wid-5}px;">   
			    <div data-options="region:'west',title:'角色列表',split:true" style="width:250px;">
			    	<table id="dg_right_role"></table> 
			    </div>   
			    <div data-options="region:'center'," style="padding:0px;">
			    	<a id="btn_saveRights"  class="easyui-linkbutton" data-options="iconCls:'icon-save',checkbox:true">保存设置</a> 
			    	<ul id="tt_tree" class="easyui-tree" data-options="checkbox:true,animate:true,lines:true">   
					      
					</ul>
					<div id="mm_right" class="easyui-menu" style="width: 120px;">
						<div onclick="append()" iconcls="icon-add">添加节点</div>
						<div onclick="remove()" iconcls="icon-remove">删除节点</div>
						<div onclick="update()" iconcls="icon-edit">修改节点</div>
					</div>
		</div>   
		</div>  
</body> 
</html>
