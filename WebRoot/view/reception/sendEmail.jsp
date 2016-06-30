<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>资讯-建议-投诉-信箱</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="view/reception/js/jquery.min.1.7.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript" src="view/reception/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="view/reception/js/diy_index/public-all.js"></script>
	<script type="text/javascript" src="view/reception/js/public.js"></script>

  </head>
  
  <body>
  <jsp:include page="indexHeader.jsp"></jsp:include>
    <div id="main">
  <div style="margin-top:30px;">
      <div class="text">
    <p style="font-size:18px; color:#333;">董事长信箱</p><p>投诉建议、合作共赢，华通董事长欢迎您的来信！</p>
    </div>
    <form id="form1" name="form1" method="post" action="?action=submit&amp;partid=">
      <table style="margin-top:20px;" border="0" cellpadding="0" cellspacing="0" width="1000">
        <tbody><tr>
          <td align="right" width="80"><span style="color:#EC0000;">*</span><strong> 您的姓名：</strong></td>
          <td height="38" width="400"><input name="name" id="name" style="width:80%" type="text"></td>
          <td align="right" width="100px"><span style="color:#EC0000;">*</span><strong> 手机号码：</strong></td>
          <td height="38" width="440"><input name="tel" id="tel" style="width:80%" type="text"></td>
        </tr>
        <tr>
          <td align="right"><span style="color:#EC0000;">*</span><strong>电子邮箱：</strong></td>
          <td height="38"><input name="email" id="email" style="width:80%" type="text"></td>
          <td align="right"><span style="color:#EC0000;">*</span><strong>联系地址：</strong></td>
          <td height="38"><input name="address" id="address" style="width:80%" type="text"></td>
        </tr>
        <tr>
          <td align="right"><strong><span style="color:#EC0000;">*</span><strong> </strong>信件标题：</strong></td>
          <td colspan="3" height="38"><input name="title" id="title" style="width:832px;" type="text"></td>
        </tr>
        <tr>
          <td align="right"><strong><span style="color:#EC0000;">*</span><strong> </strong>信件内容：</strong></td>
          <td colspan="3" height="158"><textarea name="content" rows="8" id="content" style="width:832px;"></textarea></td>
        </tr>
        <tr>
          <td align="right"><span style="color:#EC0000;">*</span> <strong>验证码：</strong></td>
          <td height="38"><input name="checksn" id="checksn" style="width:80px; vertical-align:middle;" maxlength="4" type="text"><img src="%E6%9C%8D%E5%8A%A1%E6%89%BF%E8%AF%BA-%E5%8D%8E%E9%80%9A%E6%9C%BA%E7%94%B5%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8_files/chk.png" id="checkimg" style="vertical-align:middle; margin-left:6px; cursor:pointer" onclick="this.src+='?';"><span style="margin-left:5px; color:#888">(点击刷新验证码)</span></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td height="50"><a href="javascript:void(0);" class="submit" id="button">提交信息</a><span id="dostate" style="display:none;"><img src="%E6%9C%8D%E5%8A%A1%E6%89%BF%E8%AF%BA-%E5%8D%8E%E9%80%9A%E6%9C%BA%E7%94%B5%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8_files/loading.gif" style="margin-right:6px; vertical-align:middle;">Data is being uploaded …</span></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </tbody></table>
    </form>
      </div>
  <p style="clear:both; height:50px;"></p>
</div>
<script type="text/javascript">
formHlight("form1");//元素高亮
$("#button").bind("click",function(){
	if($("#name").val()=='' || $("#name").val()==null){alert("请输入您的姓名！");return false;}
	if($("#tel").val()=='' || $("#tel").val()==null){alert("请输入手机号码！");return false;}
	if($("#title").val()=='' || $("#content").val()==null){alert("请输入标题！");return false;}
	if($("#content").val()=='' || $("#content").val()==null){alert("请输入内容！");return false;}	
	if($("#checksn").val()=='' || $("#checksn").val()==null){alert("验证码未输入！");return false;}
	jAjaxSubmit();//jquery.Ajax提交表单
	return false;//阻止正常POST事件，改为Jquery.Ajax提交表单
});
</script>
<jsp:include page="indexBack.jsp"></jsp:include>
  </body>
  <link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
<link href="view/reception/css/imeIn.css" rel="stylesheet" type="text/css">
</html>
