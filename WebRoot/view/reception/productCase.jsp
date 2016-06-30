<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>产品案例</title>
    
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
  
  <body onload="onLoadProductCaseData()">
    <jsp:include page="indexHeader.jsp"></jsp:include>
    <div id="banner">
  <div id="bannerCon">
    <img src="view/reception/images/banner_text.png" id="bannerText">
    <p id="bannerTit"><a  class="aGray">首页</a> - <a  class="aGray">关于劲凯</a> - <aclass="aGray">发展历程</a><span>关于劲凯</span></p>
  </div>
</div>
<div id="menuSon">
  <ul id="menuSonList">   
    <li class='A'><a  >产品案例</a></li>
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
		<div style="margin-top:26px; background:url(images/history_bg1.jpg) repeat-y 206px top;">
			<div class="his_l">2011年大事记</div>
			<div class="his_r text">
				<p>
					4月21日，温州市国税局局长胡蓬星在乐清市国税局局长夏法鹏、副局长陈海洪的陪同下，莅临华通考察，集团公司董事长李成文、总裁助理金世明等领导热情地接待了胡局长一行。<br> 5月10日，江西省国家电网公司领导莅临考察。<br> 9月30日，柳市镇党委副书记、镇长程天青到我集团公司调研。集团公司董事长李成文、副总裁梁世干陪同。<br> 10月20日，河北省电力公司领导莅临考察。
				</p>
				<p>
					<strong>公司荣誉</strong><br> 1月28日，在全市经济贸易工作会议上，李成文等27名2010年度温州市功勋企业家受到表彰。&nbsp;<br> 2月18日，乐清市委、市政府召开全市经济工作会议，大会表彰了全市经济工作先进单位。乐清市委、市政府授予华通机电集团公司2010年度“乐清市功勋企业”荣誉称号。<br> 3月21日，柳市镇召开经济工作暨强化投资动员大会。大会表彰了2010年度柳市镇功勋企业、50强企业、明星企业，华通机电集团公司获评柳市镇功勋企业。<br>
					3月28日，浙江省政府公布了2010年省质量奖获奖企业名单，华通机电股份公司榜上有名。<br> 3月31日，由上海市质量技术监督局举行“上海名牌产品”颁奖庆典，上海华通企业集团生产的“高低压成套开关设备”再次获此殊荣。<br> 7月18日，浙江省企业联合会和浙江省企业家协会联合发布了2011年“浙江省百强企业排行榜”，华通机电集团公司名列百强榜前列，同时我集团还喜获2011浙江省制造业百强企业称号。这是自2003年以来，华通第8次入列该榜单。<br>
					12月，温州市企业联合会举行成立30周年暨第十届第一次全员大会，大会表彰了2011年温州市百强企业，华通连续第七年蝉联温州百强企业称号。
				</p>
				<p style="clear:both; height:30px;"></p>
			</div>
		</div>
	</div>
	<jsp:include page="indexBack.jsp"></jsp:include>
</body>
<link href="view/reception/css/ime.css" rel="stylesheet" type="text/css">
<link href="view/reception/css/imeIn.css" rel="stylesheet" type="text/css">
</html>
