
/**
 * index.jsp-- 主页数据加载
 */
function onLoadIndexData(){
	//indexAction_onLoadMenu();  //加载首页最新动态
	//indexAction_onLoadNewsInfos();  //加载新闻动态
	//onLoadFirstProduct(); //加载创新产品  首页展示
	//onLoadFirstProductCataLog(); //产品目录
}

/**
 * about.jsp--关于劲凯数据加载
 * 
 */
function onLoadAboutData(){
	//indexAction_onLoadMenu();  //加载首页页面菜单栏
}

/**
 * news.jsp 新闻资讯数据加载
 * 
 */
function onLoadNewsData(){//news.jsp
	//indexAction_onLoadMenu();  //加载新闻资讯页面菜单栏
	//newsAction_getCountNews();
	//newsAction_onLoadNewsTitle();  //加载新闻资讯标题
	
	
}
function onLoadNewsContentData(){
	//indexAction_onLoadMenu();  //加载新闻资讯页面菜单栏
	//newsAction_onLoadNewsContent(); //加载新闻资讯具体内容
}

/**
 * plan.jsp--产品案例数据加载
 * 
 */
function onLoadProductCaseData(){
	//indexAction_onLoadMenu();  //加载新闻资讯页面菜单栏
	
}
/**
 * product.jsp--产品中心页面加载数据
 * 
 * 
 */
function onLoadProductData(){
	//indexAction_onLoadMenu();  //加载新闻资讯页面菜单栏
	
}


function onLoadProductContentData(){
	//indexAction_onLoadMenu();  //加载新闻资讯页面菜单栏
}

/**
 * Resource.jsp 
 * 
 */
function onLoadResourceData(){
	//加载新闻资讯页面菜单栏
	//indexAction_onLoadMenu();  
}
/*=======================================index.jsp===============================start=========================================*/
function indexAction_onLoadMenu(){
	/*加载首页最新动态*/
	
	var onetit = "";
	$.ajax({                                                                     
		//url : "reception_menu",
		url : "indexAction_onLoadMenu",
		dataType : "json",
		async: false,
		success : function(root) {
			var data = root.rows;
			for ( var i = 0; i < data.length; i++) {
				if(data[i].parentId==0 ){
					onetit+="<li><a href='"+data[i].url+"' class=''>"+data[i].name+"</a>";
					onetit+="<div style='display: none; overflow: hidden; height: auto; margin-top: 0px; margin-bottom: 0px; padding-top: 10px; padding-bottom: 15px;'>";
					var child = data[i].childMenu;
					for ( var j = 0; j < child.length; j++) {
						onetit+="<a href='"+child[j].url+"'>"+child[j].name+"</a>";
					}
					onetit+="</div></li><li class='split'><img src='view/reception/images/menu_split.gif'></li>";
			}
			}
			var menu = $("#menu");
			menu.empty();
			menu.append(onetit);
		}
	});
	$("#menu li").hover(function() {
		if ($(this).attr("bg") == "none") {
			$(this).find("a").css("background", "none");
		}
		$(this).find("a").eq(0).addClass("A");
		$(this).find("div").stop().slideDown(350);
	}, function() {
		if ($(this).attr("bg") == "none") {
			$(this).find("a").css("background", "none");
		}
		$(this).find("a").eq(0).removeClass("A");
		$(this).find("div").stop().slideUp(200);
	});
}


/**
 * 加载新闻动态
 */
function indexAction_onLoadNewsInfos(){
	var newsAndInfos = "";
	$.ajax({                                                                     
		url : "indexAction_onLoadNewsInfos",
		dataType : "json",
		async: true,
		success : function(root) {
			var data = root.rows;
			for ( var i = 0; i < data.length; i++) {
				//newsAndInfos += "<li><span>"+data[i].createStrTime+"</span><a href='view/reception/newsContent.jsp?id="+data[i].id+"'>"+data[i].newTitle+"</a></li>";
				newsAndInfos += "<a href='newsAction_onLoadNewsContentToJsp?id="+data[i].id+"'>"+data[i].newTitle+"</a>";
			}
			var newsInfos = $("#newslist");
			newsInfos.empty();
			newsInfos.append(newsAndInfos);
		}
	});
}

/**
 * 
 * 加载最新  创新产品
 * 
 */
function onLoadFirstProduct(){
	
	/*/*var news = "";
	var left = 150;
	$.ajax({                                                                     
		url : "indexAction_onLoadNews",
		dataType : "json",
		async: false,
		success : function(root) {
			var data = root.rows;
			for ( var i = 1; i < (data.length+1); i++) {
				if(i==1){
					news += "<div class='solution' style='left: "+left+"px;'>";
				}else{
					news += "<div class='solution' style='left: "+(left+210*(i-1.001))+"px;'>";
				}
				news += "<p style='line-height: 42px; padding-left: 16px; padding-top: 0px; color: rgb(102, 102, 102);'>"+data[i-1].newTitle+"</p>";
				news += "<p style='padding:10px 26px; line-height:180%;'>"+data[i-1].newContent+"</p>";
				news += "</div>";
			}
			var newst = $("#onLoadNews");
			newst.empty();
			newst.append(news);
		}
	});
	
	$(".solution").hover(function() {
		$(this).stop().animate({
			"top" : "155px",
			"backgroundColor" : "#EEE"
		}, 400, "easeOutQuad");
		$(this).find("p").eq(0).stop().animate({
			"paddingTop" : "10px",
			"color" : "#F70"
		}, 400, "easeOutQuad");
		$(this).find("p").eq(0).find("img").stop().animate({
			"width" : "68px",
			"height" : "68px"
		}, 300, "easeOutQuad");
	}, function() {
		$(this).stop().animate({
			"top" : "355px",
			"backgroundColor" : "#FFF"
		}, 300, "easeOutQuad");
		$(this).find("p").eq(0).stop().animate({
			"paddingTop" : "0px",
			"color" : "#666666"
		}, 300, "easeOutQuad");
		$(this).find("p").eq(0).find("img").stop().animate({
			"width" : "28px",
			"height" : "28px"
		}, 250, "easeOutQuad");
	});*/
	
}


/**
 * 首页产品目录
 * 
 */
function onLoadFirstProductCataLog(){
	var news = '';
	$.ajax({                                                                     
		url : "indexAction_onLoadProductCataLogs",
		dataType : "json",
		async: false,
		success : function(root) {
			var data = root.rows;
			for ( var i = 0; i < (data.length); i++) {
				news += "<li><a href='####'>"+(data[i].productName)+"</a></li>";
			}
			var newst = $("#procatalog");
			newst.empty();
			newst.append(news);
		}
	});
}
/*=======================================index.jsp===============================end===========================================*/
/*=======================================news.jsp===============================start===========================================*/
/**
 * 新闻资讯页面加载新闻标题
 */
function newsAction_onLoadNewsTitle(){
	var newsTitle = "";
	$.ajax({                                                                     
		url : "newsAction_onLoadNewsTitle",
		dataType : "json",
		data:{page:1},
		type:"post",
		async: false,
		success : function(root) {
			var data = root.rows;
			for ( var i = 0; i < data.length; i++) {
				newsTitle += "<li> <a href='newsAction_onLoadNewsContentToJsp?id="+data[i].id+"'> <div class='tim' style='background-color: rgb(238, 238, 238);'>";
				newsTitle += "<p style='font-size: 46px; font-family: Arial; color: rgb(136, 136, 136);'>"+(data[i].createStrTime.substring(8,10))+"</p><p style='color: rgb(136, 136, 136);'>"+(data[i].createStrTime.substring(0,8))+"</p></div>";
				newsTitle += "<div class='con'><p style='font-size: 14px; color: rgb(0, 102, 204);'>"+data[i].newTitle+"</p><p style='color:#999; margin-top:9px; line-height:180%;'>"+(data[i].newContent.length>168?data[i].newContent.substr(0,168):data[i].newContent)+"...</p></div>";
				newsTitle += "</a></li><li class='clear'></li>";
			}
			var news = $("#newstit");
			news.empty();
			news.append(newsTitle);
		}
	});
	
	$(".newslist a").hover(function(){
		$(this).find(".tim").stop().animate({'backgroundColor':'#F80'},450);
		$(this).find(".tim p").stop().animate({'color':'#FFF'},450);
		$(this).find(".con p").eq(0).stop().animate({'color':'#F80'},450);
	},function(){
		$(this).find(".tim").stop().animate({'backgroundColor':'#EEE'},350);
		$(this).find(".tim p").stop().animate({'color':'#888'},350);
		$(this).find(".con p").eq(0).stop().animate({'color':'#0066CC'},350);
	});
}


function newsAction_onLoadNewsContent(){
	var id = $("#newsId").val();
	$.ajax({                                                                     
		url : "newsAction_onLoadNewsContent",
		dataType : "json",
		data:{id:id},
		type:"post",
		async: false,
		success : function(root) {
			var data = root.rows;
			var newsCon = "<span>"+data[0].newContent+"</span>"; 
			var news = $("#content");
			news.empty();
			news.append(newsCon);
		}
	});
	
	
}


function newsAction_getCountNews(){
	$.ajax({                                                                     
		url : "newsAction_getCountNews",
		dataType : "json",
		async: true,
		success : function(root) {
			var pageNums = $("#pageNums");
			pageNums.empty();
			pageNums.append("/共"+Math.ceil((root.rows)/4)+"页");
		}
	});
}


/*=======================================news.jsp================================end===========================================*/
/*=======================================All=====================================start=========================================*/

function onloadMenuData(){
	/*加载首页菜单栏*/
	
	var onetit = "";
	$.ajax({                                                                     
		//url : "reception_menu",
		url : "indexAction_onLoadMenu",
		dataType : "json",
		async: false,
		success : function(root) {
			var data = root.rows;
			for ( var i = 0; i < data.length; i++) {
				if(data[i].parentId==0 ){
					onetit+="<li><a href='"+data[i].url+"' class=''>"+data[i].name+"</a>";
					onetit+="<div style='display: none; overflow: hidden; height: auto; margin-top: 0px; margin-bottom: 0px; padding-top: 10px; padding-bottom: 15px;'>";
					var child = data[i].childMenu;
					for ( var j = 0; j < child.length; j++) {
						onetit+="<a href='"+child[j].url+"'>"+child[j].name+"</a>";
					}
					onetit+="</div></li><li class='split'><img src='view/reception/images/menu_split.gif'></li>";
			}
			}
			var menu = $("#menu");
			menu.empty();
			menu.append(onetit);
		}
	});
	
	//js 效果
	$("#menu li").hover(function() {
		if ($(this).attr("bg") == "none") {
			$(this).find("a").css("background", "none");
		}
		$(this).find("a").eq(0).addClass("A");
		$(this).find("div").stop().slideDown(350);
	}, function() {
		if ($(this).attr("bg") == "none") {
			$(this).find("a").css("background", "none");
		}
		$(this).find("a").eq(0).removeClass("A");
		$(this).find("div").stop().slideUp(200);
	});
}
function ss(){alert('0');}

$(function(){
	
	//上一页  翻页数据
	$("#pageToUp").click( function () { 
		var pageNum = $("#currentPage").text();
		if(parseInt(pageNum)>1){
			pageNum = parseInt(pageNum)-1;
			window.location.href="news.html?page="+pageNum;
		}else{
			alert("已经是首页！");
		}
	});
	
	//下一页  翻页数据
	$("#pageToNext").click( function () { 
		var page = $("#currentPage").text();
		var pageNum = $("#pageNums").text();
		if(parseInt(page)<parseInt(pageNum)){
			page = parseInt(page)+1;
			window.location.href="news.html?page="+page;
		}else{
			alert("已经没有啦！");
		}
	});
	
	$(".aboutTit").click( function () { 
		window.location.href="view/reception/about.jsp?num="+$(this).attr('name');
	});
});




/*=======================================All=====================================end===========================================*/










