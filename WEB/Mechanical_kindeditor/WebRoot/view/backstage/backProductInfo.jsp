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
    
    <title>XXX</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/default/easyui.css" />   
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/icon.css" />   
	<script type="text/javascript" src="<%=paths%>easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="<%=paths%>easyui/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="<%=paths%>easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
		.hide{display: none}
	</style>
  </head>
  
  <body>
  <div id="bod" style="height: ${param.hei}px;border: 0px red solid;">
  	<script type="text/javascript" src="<%=paths%>js/ajaxfileupload.js"></script> 
    <script type="text/javascript" src="<%=paths%>js/jquery.js"></script> 
 	<script type="text/javascript" src="<%=paths%>js/easyui_public.js"></script> 
    <script type="text/javascript" src="<%=paths%>js/backProductInfo.js"></script> 
    <style type="text/css">
		.hide{display: none}
	</style>
    
  	<div>
  		<div id='body_cen_info' style="margin-top: 10px;">
  			<span style="margin-left: 20px;">类别名称：<input class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </span>
  			<span style="margin-left: 20px;">类别名称：<input class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </span>
  			<div style="clear: both;"></div>
  		</div>
  		<div style="margin-top: 10px;">
			<table id="dg_product" width="100%" data-options=""></table> 
  			<table id="dg_productInfo" width="100%" data-options=""></table>  
  		</div>
  	</div>
  	
	  	<!-- 图片上传dialog -->
	  	<div id="dd_uploadFile" class="easyui-dialog" title="上传图片" style="width:400px;height:200px;"   
					        data-options="iconCls:'icon-save',resizable:true,modal:true,inline:true,closed:true, buttons:[{ 
	        			text:'确定', iconCls:'icon-save', onClick:function(){ uploadFileBox(); } 
	        		},{
						text:'取消', iconCls:'icon-cancel', onClick:function(){ $('#dd_uploadFile').dialog('close');}
					}]">   <!-- closed:true -->
		    <div id="dialogContent" class='hide'>
	    		<form id='form_image' action="backUploadFileAction_uploadFile" enctype="multipart/form-data" method="post">
			    	<p style="margin-top: 30px;margin-left: 20px;">
	<!--  	    			<input class="easyui-filebox" id="file" name="file" style="width:300px" data-options="buttonText:'选择图片'," >
	 -->		    	<input  type="file"  id ="file" name="file">
	 
	 		<!-- 	uploadFileAct uploadFileBox(); -->
	 
	 </p>
	    		</form>
		    </div>   
		</div> 
		<!-- 新增产品dialog -->
		<div id="dd_productInfo_add" >   
			   	<div class='hide' style="margin-top: 30px;margin-left: 60px;">
			   		<span >
			   			产品名称:<input id="productName-add" class="easyui-textbox"  style="width:200px">
			   		</span> 
		   	</div>
		</div> 
		<div id='dd_productInfo_update'>
			<div class='hide' style="margin-top: 30px;margin-left: 60px;">
			   		<span >
			   			产品名称:<input id='productName' class="easyui-textbox"  style="width:200px">
			   		</span> 
		   	</div>
		</div>
		<div id="delete_productInfo"></div>  
		<!-- 图片预览dialog -->
	  	<div id="dd_checkImg" class="easyui-dialog" title="上传图片" style="width:400px;height:200px;"   
					        data-options="iconCls:'icon-save',resizable:true,modal:true,inline:true,closed:true,resizable:true, buttons:[{ 
	        			text:'取消', iconCls:'icon-cancel', onClick:function(){ $('#dd_checkImg').dialog('close');}
					}]">   <!-- closed:true -->
		    <div id="dd_checkImgContent" class='hide' class="easyui-dialog" data-options="resizable:true">
	    		<img id = "checkImg">
		    </div>   
		</div>
  	</div>
	
  </body>
</html>
