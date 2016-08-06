<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String paths = request.getContextPath()+"/view/backstage/";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/default/easyui.css" />   
	<link rel="stylesheet" type="text/css" href="<%=paths%>easyui/themes/icon.css" />   
	<link rel="stylesheet" type="text/css" href="<%=paths%>css/menu.css" />   
	<script type="text/javascript" src="<%=paths%>easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="<%=paths%>easyui/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="<%=paths%>js/menu.js"></script> 
	<style type="text/css">
		html,body,div{margin: 0;padding: 0;font-family:"Microsoft YaHei";font-size: 12px; }
	</style> 
	<script type="text/javascript">
		
		function add(inParm,loc){
			 var divId = "";
			var divAll = $(".menu_info");
			$(divAll).each(function(i){
			   divId+=","+this.id;
			 });
			var split =  divId.split("\,");
			$(".clicklStyle").removeClass("clicklStyle");
			$("#"+inParm).addClass("clicklStyle");
			//性能优化  点击菜单有迟钝
			 /*for(var i =0;i<split.length;i++){
			 	if(split[i]!=inParm){
					$("#"+split[i]).removeClass("clicklStyle");
			 	}
			 }*/
			var topWid = ($('#top').panel('options').width);
			var leftWid = ($('#sys').panel('options').width);
			var cWid = topWid-leftWid;
			var hei = ($('#sys').panel('options').height);
			var tit = $("#"+inParm).text();
			var tab = $('#tabs').tabs('exists',tit);
			var url = 'view/backstage/'+loc;
			if(tab){
				if(loc!=null && loc!=''){
					$('#tabs').tabs('select', tit);   
					var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
					tab.panel('refresh', url+"?hei="+(hei)+"&wid="+cWid); 
				}else{
					$('#tabs').tabs('select', tit);   
					var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
					tab.panel('refresh', 'view/backstage/backError.jsp');
				}
				/* $('#tabs').tabs('select', tit);   
				var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板
				tab.panel('refresh', url+"?hei="+(hei)+"&wid="+cWid); */
			}else{
				if(loc!=null && loc!=''){
					$('#tabs').tabs("add" , { 
						title:tit,    
		   				closable:true, 
					    border:true,  
					    selected : true,
					    href:url+"?hei="+hei
					}); 
				}else{
					$('#tabs').tabs("add" , { 
						title:tit,    
		   				closable:true, 
					    border:true,  
					    selected : true,
					    href:'view/backstage/backError.jsp',
					});
				}
			}
		}
	</script>
  </head>
  
  
 <body class="easyui-layout" data-options="fit:true"	>
	    <div id='top'  data-options="region:'north',title:''" style="height:100px;">  </div>   
	    <div data-options="region:'south',title:''" style="height:30px;">
	    	<div>您好，[${user.name}]</div>
	    </div>   
	    <div id='sys' data-options="region:'west',title:'系统导航',split:false" style="width:250px;">
	    <div>
			<!-- <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">后台管理</a> 
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">网站管理</a> --> 
	    </div>
		<div style="border-bottom: 0px red solid;"></div>
	    	<!--  
	    	<ul id="tree_menu" class="easyui-tree" data-options="animate:true,lines:true">  
	    		<c:forEach items="${user.rights}" var='right'> 
				    <li>   
		                <c:if test="${right.parentId==null}"> <span>${right.rightName}</span></c:if>
		                <ul> 
		                  	<c:forEach items="${right.chRights}" var='ch'>
		                    <li>   
		                        <span><a id="${ch.id}" onclick="add(this.id,'${ch.location}')">${ch.rightName}</a></span>   
		                    </li>   
		                  	</c:forEach>
		                </ul>   
	            	</li> 
            	</c:forEach>  
        </ul>   
	    	 -->
	    	 
	    	 <div id="aa" class="easyui-accordion  " style="width:248px;height:100%;padding:0">
			   <c:forEach items="${user.rights}" var='right'> 
				    <div class='' title="<c:if test="${right.parentId==null}"> ${right.rightName}</c:if>" data-options="iconCls:'icon-reload',selected:true" style="padding:0px;">
							<c:forEach items="${right.chRights}" var='ch'>
			                        <div class ="menu_info" id="${ch.id}"  onclick="add(this.id,'${ch.location}')"> 
			                        	<span style="margin-left: 20px;">${ch.rightName}</span>
			                        </div>
			                  	</c:forEach>
				    </div>
            	</c:forEach>  
			</div>
	    </div>   
	    <div id="cen" data-options="region:'center',title:'操作区'" style="padding:0px;background:#eee;">
		    <div id="tabs" class="easyui-tabs" data-options="fit:true" style="width:100%">   
			</div>  
			
			
		 <div id="mm" class="easyui-menu" style="width:150px;">
	         <div id="mm-tabclose" data-options="iconCls:'icon-cancel'">关闭当前标签页</div>
	         <div id="mm-tabcloseother" data-options="iconCls:'icon-other'">关闭其他标签页</div>
	         <div id="mm-tabcloseall" data-options="iconCls:'icon-all'">关闭所有标签页</div>
	         <div class="menu-sep"></div>
	         <div id="mm-tabcloseright">当前页右侧全部关闭</div>
	         <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		 </div>
	    </div> 
  </body>

</html>
