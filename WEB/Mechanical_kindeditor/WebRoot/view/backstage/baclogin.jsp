<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />   
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />   
	<script type="text/javascript" src="<%= request.getContextPath() %>/view/backstage/easyui/jquery-1.8.3.min.js"></script>   
	<script type="text/javascript" src="<%= request.getContextPath() %>/view/backstage/easyui/jquery.easyui.min.js"></script>  
	<link href="<%= request.getContextPath() %>/view/backstage//css/style.css" rel="stylesheet" type="text/css">
  </head>
  
<body class="login">

<div class="login_m">
	<div class="login_logo"><img src="view/backstage/images/logo.png" width="196" height="46"></div>
	<div class="login_boder">
		<div class="login_padding">
			<form action="login.html" method="post" name="loginForm" >
				<h2>用户名</h2>
				<label>
					<input type="text" id="name"  name ='name' class="txt_input txt_input2" onfocus="" onblur="">
				</label>
				<h2>密码</h2>
				<label>
					<input type="password" name="password" id="password" class="txt_input" onfocus="" onblur="" >
				</label>
				<p class="forgot"><a href="javascript:void(0);">忘记密码?</a></p>
				<div class="rem_sub">
					<div class="rem_sub_l">
						<input type="checkbox" name="checkbox" id="save_me">
						<label for="checkbox">记住</label>
					</div>
					<label>
						<input type="submit" class="sub_button" name="button" id="button" value="登录" style="opacity: 0.7;">
					</label>
				</form>
			</div>
		</div>
	</div><!--login_boder end-->
</div><!--login_m end-->

<br />
<br />
<script type="text/javascript">
			
</script>
	<!-- 
<p align="center"> More Templates <a href="http://www.17sucai.com/" target="_blank" title="17素材网">17素材网</a> - Collect from <a href="http://www.17sucai.com/" title="网页模板" target="_blank">网页模板</a></p>
	 -->
</body>
</html>
