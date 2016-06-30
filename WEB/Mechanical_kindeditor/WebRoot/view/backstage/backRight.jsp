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
  </head>
  
  <body style="height: ${param.hei}" >
	<style type="text/css">
		.hide{display: none}
		#dd_rightDataContent{margin-top: 30px;margin-left: 30px}
    </style>
	<script type="text/javascript" src="<%=paths%>js/easyui_public.js"></script>
  	<script type="text/javascript" src="<%=paths%>js/backRight.js"></script>
  	<!-- 权限类型列表 -->
 	<div>
  		<div id='body_top_text' style="margin-top: 10px;">
  			<span style="margin-left: 20px;">类别名称：<input class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </span>
  			<span style="margin-left: 20px;">类别名称：<input class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </span>
  			<div style="clear: both;"></div>
  		</div>
  		<div style="margin-top: 10px;">
			<table id="dg_rightParent" width="100%" data-options=""></table> 
  		</div>
  	</div>
	<!-- 权限详细列表 -->
	<div>
  		<div style="margin-top: 10px;">
			<table id="dg_rights" width="100%" data-options=""></table> 
  		</div>
  	</div>
  	
  	
  	
  	
  	<!-- ------------------------------------------------------------------------------- -->
	<!-- ----------------------------新增枚举类型dialog --------------------------------------->
	<div id="dd_dlg_parent" class="easyui-dialog" title="新增枚举类型"    
        data-options="iconCls:'icon-save',resizable:true,modal:true,inline:true,width:500,height:300,closed:true,
        buttons:[{ 
        			text:'确定', iconCls:'icon-save', onClick:function(){ saveEnumsParent(); } 
        		},{
					text:'取消', iconCls:'icon-cancel', onClick:function(){ $('#dd_dlg_parent').dialog('close');}
			}]">   
	   <div class='hide'>
		  		<p id='s1' >枚举码值：<input id='s1_text' class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </p>
		  		<p id='s2' >枚举名称：<input id='s2_text' class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </p>
		  		<p id='s3' ><span style="vertical-align: top;">枚举描述：</span><textarea id='s3_text' style="width: 295px;border: 1px #e3e3e3 solid; border-radius:5px"></textarea> </p>
		</div>      
	</div> 
	<!-- ----------------------------修改枚举类型dialog --------------------------------------->
	<div id="dd_dlg_parent_edit" class="easyui-dialog" title="修改枚举类型"    
        data-options="iconCls:'icon-save',resizable:true,modal:true,inline:true,width:500,height:300,closed:true,
        buttons:[{ 
        			text:'确定', iconCls:'icon-save', onClick:function(){ updateEnumsParent(); } 
        		},{
					text:'取消', iconCls:'icon-cancel', onClick:function(){ $('#dd_dlg_parent_edit').dialog('close');}
			}]">   
	   <div class='hide'>
		  		<p id='s1_editParent' >枚举码值：<input id='s1_editParent_text' class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </p>
		  		<p id='s2_editParent' >枚举名称：<input id='s2_editParent_text' class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </p>
		  		<p id='s3_editParent' ><span style="vertical-align: top;">枚举描述：</span><textarea id='s3_editParent_text' style="width: 295px;border: 1px #e3e3e3 solid; border-radius:5px;font-size: 12px;font-family:Microsoft YaHei"></textarea> </p>
		</div>      
	</div> 
	<!-- --------------------------------新增枚举值 ---------------------------------------->
	<div id="dd_dlg_enums" class="easyui-dialog" title="新增枚举值"    
        data-options="iconCls:'icon-save',resizable:true,modal:true,inline:true,width:500,height:300,closed:true,
        buttons:[{
					text:'确定', iconCls:'icon-save', onClick:function(){ saveBackEnums(); }
				},{
					text:'取消', iconCls:'icon-cancel', onClick:function(){ $('#dd_dlg_enums').dialog('close'); }
			}]"> 
		<div class='hide'>
		  		<p id='s1_enums' >枚举码值：<input id='s1_enums_text' class="easyui-textbox"  style="width:300px"> </p>
		  		<p id='s2_enums' >枚举名称：<input id='s2_enums_text' class="easyui-textbox"  style="width:300px"> </p>
		</div>    
	</div> 
	<!-- ----------------------------修改权限属性dialog --------------------------------------->
	<div id="dd_rightData" class="easyui-dialog" title="修改枚举值"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,inline:true,width:450,height:200,closed:true,
        buttons:[{ 
        			text:'确定', iconCls:'icon-save', onClick:function(){ updateRightData(); } 
        		},{
					text:'取消', iconCls:'icon-cancel', onClick:function(){ $('#dd_rightData').dialog('close');}
			}]">   
	   <div id='dd_rightDataContent' class='hide'>
		  		<p >角色名称：<input id='dd_rightData_name' class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </p>
		  		<p >Tab页签：<input id='dd_rightData_pageName' class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </p>
		</div>      
	</div> 

  </body>
</html>
