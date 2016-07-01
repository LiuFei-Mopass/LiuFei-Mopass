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
    
    <title>My JSP 'backNews.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache" charset="utf-8">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/default/easyui.css" />   
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/icon.css" />   
	<script type="text/javascript" src="<%=paths%>easyui/jquery-1.8.3.min.js"></script> 
	<script type="text/javascript" src="<%=paths%>easyui/jquery.easyui.min.js"></script> 
	
	
	 
  </head>
  
  <body  >
	<style type="text/css">
	.hide{display: none}
	#dlg_news_edit_con{margin-top: 10px;margin-left: 30px;}
	 .datagrid-row {
        height: 32px;
    }
    #dg_news .datagrid-btable tr{height: 40px;}
    .datagrid-row {
        height: 40px;
        overflow: hidden;
    }
	</style>
  	<script type="text/javascript" src="<%=paths%>js/easyui_public.js"></script> 
  	<script type="text/javascript" src="<%=paths%>js/backNews.js"></script>
  	<%--
  	 --%>
	<link rel="stylesheet" type="text/css"   href="<%=path %>/view/editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=path %>/view/editor/kindeditor-all.js"></script>
	<script charset="utf-8" src="<%=path %>/view/editor/all.js"></script>
	<script charset="utf-8" src="<%=path %>/view/editor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=path %>/view/editor/plugins/code/prettify.js"></script>
  	<link rel="stylesheet"  type="text/css"  href="<%=path %>/view/editor/themes/default/default.css" />

	    <div style="height: ${param.hei}px;width:100%" >
    		<table id="dg_news"></table>  
		    <div id="dlg_news_edit" class="easyui-dialog" title="修改资讯信息"   
		        data-options="iconCls:'icon-save',resizable:true,modal:true,inline:true,width:850,height:520,closed:true,
		        buttons:[{ 
		        			text:'确定', iconCls:'icon-ok', onClick:function(){ updateNewsInfo(); } 
		        		},{
							text:'取消', iconCls:'icon-cancel', onClick:function(){ $('#dlg_news_edit').dialog('close');}
					}]">   
				   <div id='dlg_news_edit_con' class='hide'  >
					  		<p>资讯标题：<input id='title_edit' class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </p>
					  		<p>资讯类型：<input id='type_edit' class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </p>
					  		<p ><span style="vertical-align: top;">资讯内容：</span>
									<div style="margin-left: 60px;margin-top: -28px;">
									<%--
										<script id="editor" type="text/plain" style="width:650px;height:250px;"></script>
									 <jsp:include page="kindeditor.jsp"></jsp:include>
									 --%>
	 								  <textarea name="easyui_ditor" id="easyui_editor" class="easyui-kindeditor" style="width: 250px; height: 200px; visibility: hidden;"></textarea>
									</div>				
								</div>
							</p>
					</div>
			</div> 
			<div id="dlg_news_add" class="easyui-dialog" title="新增资讯信息"   
		        data-options="iconCls:'icon-save',resizable:true,modal:true,inline:true,width:850,height:520,closed:true,
		        buttons:[{ 
		        			text:'确定', iconCls:'icon-ok', onClick:function(){ saveNewsInfo(); } 
		        		},{
							text:'取消', iconCls:'icon-cancel', onClick:function(){ $('#dlg_news_add').dialog('close');}
					}]"> 
				<div id='dlg_news_add_con' class='' style="margin-left: 50px">
				  		<p>资讯标题：<input id='title_add' class="easyui-textbox" data-options="iconCls:''" style="width:300px"> </p>
				  		<p>资讯类型：<input id="cc" style="width:300px">  </p>
				  		<p ><span style="vertical-align: top;">资讯内容：</span>
							<div style="margin-left: 60px;margin-top: -28px;">
								<%--
								<script id="editor1" type="text/plain" style="width:650px;height:250px;"></script>
								 <jsp:include page="kindeditor.jsp"></jsp:include>
								 --%>
								  <textarea name="easyui_ditor" id="easyui_ditor" class="easyui-kindeditor" style="width: 250px; height: 200px; visibility: hidden;">EasyUI集合KindEditor</textarea>
							</div>
						</p>
				</div>
			</div>
		</div>
  </body>
</html>
