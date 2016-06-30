<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'indexBack.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">

  </head>
  
  <body>
<div id="bottom">
  <div style="width:1000px; margin:auto; height:50px;">
  <div id="bottom_l">
    <img src="view/reception/images/icon_tel.png" style="position:absolute; left:10px; top:10px;">总机：<span style="font-family:Arial, Tahoma; font-size:16px; font-weight:bold;">023-47633233</span>　　
    传真：<span style="font-family:Arial, Tahoma; font-size:16px; font-weight:bold;">023-47633233-803</span>　　
  <!--   服务热线：<span style="font-family:Arial, Tahoma; font-size:16px; font-weight:bold;">400-8263-733</span> -->　　
   <!--  销售热线：<span style="font-family:Arial, Tahoma; font-size:16px; font-weight:bold;">0577-62729666</span> -->
  </div>
  <div id="bottom_r" onclick="location.href='view/reception/sendEmail.jsp'" ><!-- onclick="location.href=&#39;bossmail.php&#39;;"   -->
    <img src="view/reception/images/icon_mail.png"  style="margin-right:8px;">董事长信箱
  </div>
  </div>
</div>
<script type="text/javascript">
$("#bottom_r").hover(function(){
	$(this).stop().animate({'backgroundColor':'#D90000'},450);
},function(){
	$(this).stop().animate({'backgroundColor':'#F90'},300);
});
</script>
<div id="foot">
  <div style="width:1000px; margin:auto; padding-top:20px; padding-bottom:10px;">
    <div style="width:620px; float:left;">
      <p style="font-size:16px; color:#333; border-bottom:1px dotted #AAA; padding-bottom:10px;">关于劲凯</p>
      <p style="line-height:190%; color:#999; margin-top:10px;">

      劲凯机电设备有限公司专业从事仓储物流设备的生产和销售，是国内最大的仓储物流设备供应商之一，劲凯注重产品研发和产品质量管理及控制，先后通过了ISO9001质量管理、ISO4001环境管理体系认证，公司产品应用领域十分广泛，在行业里树立了良好的品牌形象并争取了较高的市场占有率，劲凯在“诚信、用心、专业、高效”精英李连达引导下，正以一流的技术、先进的管理、现代化设备、高速的发展速度向着“成为国际一流智能仓储设备供应商” 的目标迈进。
       
       
      </p>
      <p style="margin-top:20px;">© 2014~2015 劲凯机电设备有限公司 版权所有　<a href="http://www.miibeian.gov.cn/" target="_blank">浙ICP备11056149号</a></p>    
    </div>
    <div class="fMenu">
      <a href="view/reception/index.jsp">首页</a>
      <a href="view/reception/about.jsp">关于劲凯</a>
      <a href="newsAction_onLoadNewsTitleToJsp">新闻资讯</a>
      <a href="view/reception/plan.jsp">产品设计</a>
    </div>
    <div class="fMenu">
      <a href="productAction_onLoadProductToJsp">产品中心</a>
      <a href="####/service.php">服务支持</a>
      <a href="####/contact.php">联系我们</a>
      <a href="http://www.eshion.cn/" target="_blank" style="color:#999;">劲凯科技 技术支持</a>
    </div>
  </div>
</div>
<div style="background:#EEEEEE; text-align:center;">
</div>
  </body>
</html>
