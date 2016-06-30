function ondataLoad(){
	onloadMenu();
	indexAction_onLoadNews();                // 加载首页最新动态
	indexAction_onLoadNewsInfos();           // 加载新闻具体信息
	
	
	/*加载首页菜单栏
	
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
	});*/
}

function indexAction_onLoadNews(){
	/*加载首页最新动态*/
	var news = "";
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
	});
}



function indexAction_onLoadNewsInfos(){
//就爱在行业。企业新闻
	
	var newsAndInfos = "";
	$.ajax({                                                                     
		url : "indexAction_onLoadNewsInfos",
		dataType : "json",
		async: true,
		success : function(root) {
			var data = root.rows;
			for ( var i = 0; i < data.length; i++) {
				//newsAndInfos += "<li><span>"+data[i].createStrTime+"</span><a href='view/reception/newsContent.jsp?id="+data[i].id+"'>"+data[i].newTitle+"</a></li>";
				newsAndInfos += "<a href='view/reception/newsContent.jsp?id="+data[i].id+"'>"+data[i].newTitle+"</a>";
			}
			var newsInfos = $("#newslist");
			newsInfos.empty();
			newsInfos.append(newsAndInfos);
		}
	});
}

