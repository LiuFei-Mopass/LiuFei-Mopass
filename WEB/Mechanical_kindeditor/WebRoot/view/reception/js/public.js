// JavaScript Document
/*===========================================================================
以下代码由乐清市亿新科技 IME 开发
http://www.eshion.cn
Tel:0577-27802780
===========================================================================*/
try{document.execCommand("BackgroundImageCache",false,true);}catch(e){}
if(navigator.userAgent.indexOf("MSIE")>0){   
	if(navigator.userAgent.indexOf("MSIE 6.0")>0){   
    	alert('Please use the above version of IE6 browser to access this site!\n不支持IE6浏览器，请升级您的浏览器！');
	}   
}

//跳转页面
function gotoPage(n,query){
	var page=document.getElementsByName("page")[n].value;
	if(page!=null && page!=""){
		location.href="?page="+page+query;	
	}else{
		alert("请输入正确的页码！");
	}
}

//回车提交===========================================================
function turn_page(path,rQuery,obj) {
	if(obj.value==''){alert('请输入正确的页码！');return null;}
	if(window.event.keyCode==13) {
		window.event.keyCode = 9;
		location.href=path+"?page="+obj.value+rQuery;		
	}
}

//得到页面是哪一页(结合PHP输出页码函数)==================================
function DeterminePage(page){
	var pagenum=document.getElementById("pagenum").getElementsByTagName("a");
	for(var i=0;i<pagenum.length;i++){
		if(pagenum[i].innerHTML==page){
			pagenum[i].style.cssText="background-position:left -93px; color:#FFFFFF";	
		}
	}
}

//表格隔行变色+选择后高亮
function alternate(table,color1,color2,color_hl,color_sel,startplace){
	if(startplace==null){startplace=1};
	var row=document.getElementById(table).getElementsByTagName("tr");
	var sel=document.getElementsByName("selID[]");
	var isALL;
	//隔行变色
	for(var i=startplace;i<row.length;i++){
		//开始判断隔行变色
		row[i].bgColor=(row[i].sectionRowIndex%2==1)?color1:color2;
		//开始添加高亮代码
		row[i].onmouseover=function(){
			this.style.backgroundColor=color_hl;
		}
		row[i].onmouseout=function(){
			this.style.backgroundColor="";
		}		
	}
	//选择后高亮
	for(var i=0;i<sel.length;i++){
		sel[i].onclick=function(){
			if(this.checked==true){
				this.parentNode.parentNode.style.backgroundColor=color_sel;
				this.parentNode.parentNode.onmouseover=function(){return null;}
				this.parentNode.parentNode.onmouseout=function(){return null;}		
			}else{
				this.parentNode.parentNode.style.backgroundColor="";
				this.parentNode.parentNode.onmouseover=function(){this.style.backgroundColor=color_hl;}
				this.parentNode.parentNode.onmouseout=function(){this.style.backgroundColor="";}
			}
			//判断是否全选，以便更改全选复选框状态
			isALL=true;
			for(var s=0;s<sel.length;s++){
				if(sel[s].checked==false){
					isALL=false;	
				}
			}
			//统一两个全选框
			if(isALL==true){
				for(var a=0;a<document.getElementsByName("selALL").length;a++){
					document.getElementsByName("selALL")[a].checked=true;
				}
			}else{
				for(var a=0;a<document.getElementsByName("selALL").length;a++){
					document.getElementsByName("selALL")[a].checked=false;
				}
			}
		}
	}
}

//添加修改时表单元素高亮==================================================
function formHlight(obj,bgcolor,brodercolor){
	if(bgcolor==null){bgcolor="#FFFFDD";}
	if(brodercolor==null){brodercolor="#DDDDDD";}
	var objConInput=document.getElementById(obj).getElementsByTagName("input");
	var objConTextarea=document.getElementById(obj).getElementsByTagName("textarea");
	for(var i=0;i<objConInput.length;i++){
		if(objConInput[i].getAttribute("noHlight")!="no" && objConInput[i].type!="checkbox" && objConInput[i].type!="button"){
			objConInput[i].onfocus=function(){
				this.style.backgroundColor=bgcolor;
				this.style.borderColor=brodercolor;
			}
			objConInput[i].onblur=function(){
				this.style.backgroundColor="";		
				this.style.borderColor="";
			}
		}
	}
	for(var i=0;i<objConTextarea.length;i++){
		if(objConTextarea[i].noHlight!="no"){
			objConTextarea[i].onfocus=function(){
				this.style.backgroundColor=bgcolor;
				this.style.borderColor=brodercolor;
			}
			objConTextarea[i].onblur=function(){
				this.style.backgroundColor="";		
				this.style.borderColor="";
			}
		}
	}
}

//树状菜单文字及多行时修复浮动子标签高度
function tree(){
	//先修复CSS浮动时两列显示效果
	var tree=document.getElementById("tree");	
	if(tree==null)return null;
	//循环下属所有span
	var spanArr=tree.getElementsByTagName("span");
	var spanParent;
	for(var i=0;i<spanArr.length;i++){
		//得到其父标签对象
		spanParent=spanArr[i].parentNode;
		if($.browser.version!='6.0'){//如果不是6.0的IE
			if(spanArr[i].className=="folder"){
				spanArr[i].style.height=($(spanParent).innerHeight()-4)+"px";
			}else{
				spanArr[i].style.height=($(spanParent).innerHeight()-5)+"px";
			}
		}else{
			if(spanArr[i].className=="folder"){
				spanArr[i].style.height=($(spanParent).innerHeight()-14)+"px";
			}else{
				spanArr[i].style.height=($(spanParent).innerHeight()-15)+"px";
			}
		}
	}
	//互动操作
	var doobjArr=tree.getElementsByTagName("img");
	var divobj;
	for(var i=0;i<doobjArr.length;i++){
		if(doobjArr[i].parentNode.className=="folder"){   //判断这个图像标签是文件夹而非文件
			doobjArr[i].onclick=function(){
				//这个图像对象的父级的父级的父级的父级的第二个子元素即是要关闭和打开的操作对象
				divobj=this.parentNode.parentNode.parentNode.getElementsByTagName("div")[1];
				if(divobj.style.display=="none"){
					this.src='images/_folder_open.gif';
					divobj.style.display="block";
				}else{
					this.src="images/_folder_close.gif";
					divobj.style.display="none";
				}
			}
		}
	}
}

//图片载入完成判断Javescript，需要JQuery支持
function imgload(imgo, callback){
	var Browser=new Object();
    Browser.userAgent=window.navigator.userAgent.toLowerCase();
    Browser.ie=/msie/.test(Browser.userAgent);
    Browser.Moz=/gecko/.test(Browser.userAgent);
    if(Browser.ie){
     //ie
       var obj = new Image();
       obj.src =imgo.attr('src');
       if (obj.readyState == "complete"){
          eval(callback);
       } else {
           obj.onreadystatechange = function () {
              if (obj.readyState == "complete"){
                  eval(callback);
              }
          };
      }
  } else {
     //firefox
     imgo.load(function(){eval(callback);});
  }
}


//等比缩放图片===============================================================
function AutoResizeImage(maxWidth,maxHeight,objImg,margintop){
	var img = new Image();
	img.src = objImg.src;
	var hRatio;
	var wRatio;
	var Ratio = 1;
	var w = img.width;
	var h = img.height;
	wRatio = maxWidth / w;
	hRatio = maxHeight / h;
	if (maxWidth ==0 && maxHeight==0){
	Ratio = 1;
	}else if (maxWidth==0){//
	if (hRatio<1) Ratio = hRatio;
	}else if (maxHeight==0){
	if (wRatio<1) Ratio = wRatio;
	}else if (wRatio<1 || hRatio<1){
	Ratio = (wRatio<=hRatio?wRatio:hRatio);
	}
	if (Ratio<1){
	w = w * Ratio;
	h = h * Ratio;
	}
	//如果是空白图片则用最大尺寸代替
	if(objImg.src.indexOf("null.gif")!=-1){
		w=maxWidth;
		h=maxHeight;	
	}
	objImg.height = h;
	objImg.width = w;
	//如果高度小于容器高度则垂直居中
	if(margintop==true || margintop==1){
		if(maxHeight>h){
			objImg.style.marginTop=parseInt(parseInt(maxHeight-parseInt(h))/2)+"px";
		}
	}
}
//=========================================================================


//Jquery.Ajax提交表单所有项数据===============================================
function jAjaxSubmit(){
	//先更改提交按钮的状态
	$("#button").css("display","none");
	$("#dostate").css("display","inline-block");
	//Ajax
	$.ajax({
		type:"POST", dataType:"html", url:$("#form1").attr("action"), data:$('#form1').serialize(),
		success:function(data){
			if(data.split("#")[0]=="ok"){//已输出成功标志
				location.href=data.split("#")[1];
			}else{//程序出错
				$("#dostate").css("display","none");	
				$("#button").css("display","inline-block");
				alert("Run-time Error：\n------------------------------------------\n"+data);
			}
		},error:function(XMLHttpRequest,textStatus,errorThrown){//其它非200状态
			$("#dostate").css("display","none");
			$("#button").css("display","inline-block");
			alert("Error：\n------------------------------------------\n"+XMLHttpRequest.status);
		}
	});
}


//=========================================================================


//新闻焦点图显示脚本==========================================================
function news_focus(htmlid,borderColor,backgroundColor){
	var imgsA=document.getElementById(htmlid+"_imgs_list").getElementsByTagName("a");
	var thistab=0;//自动移动控制
	var moveVal=90;
	var dostat=true;
	for(var i=0;i<imgsA.length;i++){
		imgsA[i].setAttribute("tab",i);//设置tab序号
		imgsA[i].onclick=function(){
			thistab=this.getAttribute("tab");//得到当前tab		
			
			var focusBig=document.getElementById(htmlid+"_img").getElementsByTagName("img");
			for(var i=0;i<imgsA.length;i++){
				$(focusBig[i]).css({"display":"none"});
			}
			$(focusBig[thistab]).fadeTo(1000,1);
			
			$("#"+htmlid+"_title").html(this.getElementsByTagName('img')[0].getAttribute("alt"));//设置标题文字
		
			for(var s=0;s<imgsA.length;s++){//清除之前点击状态
				imgsA[s].style.border="1px solid #DDD";
				imgsA[s].style.backgroundColor="";
			}
			this.style.border="1px solid "+borderColor;//设置当前tab状态
			this.style.backgroundColor=backgroundColor;
			
			//自动移动
			if(imgsA.length>5){
				dostat=false;
				if(thistab<=2){$("#"+htmlid+"_imgs_list").stop().animate({marginLeft:"0px"},600,'easeInOutExpo',function(){dostat=true;});}
				else if(thistab>=imgsA.length-3){$("#"+htmlid+"_imgs_list").stop().animate({marginLeft:-((imgsA.length-5)*moveVal)+"px"},600,'easeInOutExpo',function(){dostat=true;});}
				else{$("#"+htmlid+"_imgs_list").stop().animate({marginLeft:-(thistab-2)*moveVal+"px"},600,'easeOutExpo',function(){dostat=true;});}
			}
		}
	}
	//左右按钮控制
	$("#"+htmlid+"_list_r").bind("click",function(){
		if(dostat==false)return null;
		if(imgsA.length<=5)return null;
		var place=-(imgsA.length-5)*moveVal;
		if(parseInt($('#'+htmlid+'_imgs_list').css('marginLeft'))<=place)return null;
		dostat=false;
		$("#"+htmlid+"_imgs_list").animate({marginLeft:(parseInt($('#'+htmlid+'_imgs_list').css('marginLeft'))-moveVal)+"px"},600,'easeOutExpo',function(){dostat=true;});
	});
	$("#"+htmlid+"_list_l").bind("click",function(){
	    if(dostat==false)return null;
	  	if(parseInt($('#'+htmlid+'_imgs_list').css('marginLeft'))>=0)return null;
		dostat=false;
		$("#"+htmlid+"_imgs_list").animate({marginLeft:(parseInt($('#'+htmlid+'_imgs_list').css('marginLeft'))+moveVal)+"px"},600,'easeOutExpo',function(){dostat=true;});
	});
	//左右按钮颜色变化
	$("#"+htmlid+"_list_r").bind("mouseover",function(){$(this).css("background-color","#999");});
	$("#"+htmlid+"_list_r").bind("mouseout",function(){$(this).css("background-color","#DDD");});
	$("#"+htmlid+"_list_l").bind("mouseover",function(){$(this).css("background-color","#999");});
	$("#"+htmlid+"_list_l").bind("mouseout",function(){$(this).css("background-color","#DDD");});
	
	//默认第一个显示
	if(imgsA[0]!=null){
		if(document.all){//IE
			setTimeout(function(){imgsA[0].click();},100);
		}else{//修复FF下pic的click事件
			var evt = document.createEvent("MouseEvents");
			evt.initEvent("click",true,true);
			setTimeout(function(){imgsA[0].dispatchEvent(evt);},100);
		}
	}
}
//==========================================================================


//产品焦点图显示脚本==========================================================
function pro_focus(htmlid,borderColor,backgroundColor,zoom){
	var imgsA=document.getElementById(htmlid+"_focus_imgs_list").getElementsByTagName("a");
	var thistab=0;//自动移动控制
	var moveVal=66;
	var dostat=true;
	for(var i=0;i<imgsA.length;i++){
		imgsA[i].setAttribute("tab",i);//设置tab序号
		imgsA[i].onclick=function(){
			thistab=this.getAttribute("tab");//得到当前tab		

			var focusBig=document.getElementById(htmlid+"_focus_img").getElementsByTagName("img")[0];
			var focusBigA=document.getElementById(htmlid+"_focus_img").getElementsByTagName("a")[0];
			focusBig.src=this.getElementsByTagName("img")[0].src;
			focusBigA.href=this.getElementsByTagName("img")[0].src;
			focusBig.style.display="none";			
			$(focusBig).fadeIn(4000/8);			
			
			for(var s=0;s<imgsA.length;s++){//清除之前点击状态
				imgsA[s].style.border="1px solid #DDD";
				imgsA[s].style.backgroundColor="";
			}
			this.style.border="1px solid "+borderColor;//设置当前tab状态
			this.style.backgroundColor=backgroundColor;
			
			if(zoom==1 || zoom==true){
				$(focusBig).attr("class","zxx_zoom_image");
				$(focusBig).parent().attr("class","zxx_image_zoom_list");
				$("img.zxx_zoom_image").jqueryzoom();
			}
			
			//自动移动
			if(imgsA.length>4){
				dostat=false;
				if(thistab<=1){$("#"+htmlid+"_focus_imgs_list").stop().animate({marginLeft:"0px"},600,'easeOutBack',function(){dostat=true;});}
				else if(thistab>=imgsA.length-3){$("#"+htmlid+"_focus_imgs_list").stop().animate({marginLeft:-((imgsA.length-4)*moveVal)+"px"},600,'easeOutBack',function(){dostat=true;});}
				else{$("#"+htmlid+"_focus_imgs_list").stop().animate({marginLeft:-(thistab-1)*moveVal+"px"},600,'easeOutBack',function(){dostat=true;});}
			}
		}
	}
	
	//放大镜图标
	if(zoom==1 || zoom==true){
		$("#"+htmlid+"_img").bind("mouseover",function(){
			$("#"+htmlid+"_zoomer").css("display","none");
		});
		$("#"+htmlid+"_img").bind("mouseout",function(){
			$("#"+htmlid+"_zoomer").css("display","block");
		});
	}
	
	//左右按钮控制
	$("#"+htmlid+"_img_list_r").bind("click",function(){
		if(dostat==false)return null;
		if(imgsA.length<=4)return null;
		var place=-(imgsA.length-4)*moveVal;
		if(parseInt($('#'+htmlid+'_focus_imgs_list').css('marginLeft'))<=place)return null;
		dostat=false;
		$("#"+htmlid+"_focus_imgs_list").animate({marginLeft:(parseInt($('#'+htmlid+'_focus_imgs_list').css('marginLeft'))-moveVal)+"px"},600,'easeOutBack',function(){dostat=true;});
	});
	$("#"+htmlid+"_img_list_l").bind("click",function(){
	    if(dostat==false)return null;
	  	if(parseInt($('#'+htmlid+'_focus_imgs_list').css('marginLeft'))>=0)return null;
		dostat=false;
		$("#"+htmlid+"_focus_imgs_list").animate({marginLeft:(parseInt($('#'+htmlid+'_focus_imgs_list').css('marginLeft'))+moveVal)+"px"},600,'easeOutBack',function(){dostat=true;});
	});
	//左右按钮颜色变化
	$("#"+htmlid+"_img_list_r").bind("mouseover",function(){$(this).css("border-color","#CCC");});
	$("#"+htmlid+"_img_list_r").bind("mouseout",function(){$(this).css("border-color","#DDD");});
	$("#"+htmlid+"_img_list_l").bind("mouseover",function(){$(this).css("border-color","#CCC");});
	$("#"+htmlid+"_img_list_l").bind("mouseout",function(){$(this).css("border-color","#DDD");});
	
	//默认第一个显示
	if(imgsA[0]!=null){
		if(document.all){//IE
			setTimeout(function(){imgsA[0].click();},1000);				
		}else{//修复FF下pic的click事件
			var evt = document.createEvent("MouseEvents");
			evt.initEvent("click",true,true);
			setTimeout(function(){imgsA[0].dispatchEvent(evt);},1000);
		}
	}
	
	//屏蔽右键
	$("#"+htmlid+"_img,#"+htmlid+"_focus_imgs_list").bind('click',function(){return false;});
	$("#"+htmlid+"_img,#"+htmlid+"_focus_imgs_list").bind('contextmenu',function(){return false;});	
}
//==========================================================================


//产品焦点图显示脚本(带水印)=====================================================
function pro_focus_mark(htmlid,borderColor,backgroundColor,zoom){
	var zoomer=document.getElementById(htmlid+"_zoomer");//右下角放大镜图标
	var imgsA=document.getElementById(htmlid+"_focus_imgs_list").getElementsByTagName("a");
	var thistab=0;//自动移动控制
	var moveVal=66;
	var dostat=true;
	for(var i=0;i<imgsA.length;i++){
		imgsA[i].setAttribute("tab",i);//设置tab序号
		imgsA[i].onclick=function(){
			thistab=this.getAttribute("tab");//得到当前tab		
			
			var focusBig=document.getElementById(htmlid+"_focus_img").getElementsByTagName("img")[0];
			focusBig.src=this.getElementsByTagName("img")[0].src;
			focusBig.style.display="none";			
			$(focusBig).fadeIn(4000/8);			
			
			for(var s=0;s<imgsA.length;s++){//清除之前点击状态
				imgsA[s].style.border="1px solid #DDD";
				imgsA[s].style.backgroundColor="";
			}
			this.style.border="1px solid "+borderColor;//设置当前tab状态
			this.style.backgroundColor=backgroundColor;
			
			if(zoom==1 || zoom==true){
				$("#"+htmlid+"_img_zoom").attr("href",$(focusBig).attr("src"));			
				$("img.zxx_zoom_image").jqueryzoom();
			}
			
			//自动移动
			if(imgsA.length>4){
				dostat=false;
				if(thistab<=1){$("#"+htmlid+"_focus_imgs_list").stop().animate({marginLeft:"0px"},600,'easeOutBack',function(){dostat=true;});}
				else if(thistab>=imgsA.length-3){$("#"+htmlid+"_focus_imgs_list").stop().animate({marginLeft:-((imgsA.length-4)*moveVal)+"px"},600,'easeOutBack',function(){dostat=true;});}
				else{$("#"+htmlid+"_focus_imgs_list").stop().animate({marginLeft:-(thistab-1)*moveVal+"px"},600,'easeOutBack',function(){dostat=true;});}
			}
		}
	}
	
	//放大镜图标
	if(zoom==1 || zoom==true){
		$("#"+htmlid+"_img").bind("mouseover",function(){
			$("#"+htmlid+"_zoomer").css("display","none");
		});
		$("#"+htmlid+"_img").bind("mouseout",function(){
			$("#"+htmlid+"_zoomer").css("display","block");
		});
	}
	
	//左右按钮控制
	$("#"+htmlid+"_img_list_r").bind("click",function(){
		if(dostat==false)return null;
		if(imgsA.length<=4)return null;
		var place=-(imgsA.length-4)*moveVal;
		if(parseInt($('#'+htmlid+'_focus_imgs_list').css('marginLeft'))<=place)return null;
		dostat=false;
		$("#"+htmlid+"_focus_imgs_list").animate({marginLeft:(parseInt($('#'+htmlid+'_focus_imgs_list').css('marginLeft'))-moveVal)+"px"},600,'easeOutBack',function(){dostat=true;});
	});
	$("#"+htmlid+"_img_list_l").bind("click",function(){
	    if(dostat==false)return null;
	  	if(parseInt($('#'+htmlid+'_focus_imgs_list').css('marginLeft'))>=0)return null;
		dostat=false;
		$("#"+htmlid+"_focus_imgs_list").animate({marginLeft:(parseInt($('#'+htmlid+'_focus_imgs_list').css('marginLeft'))+moveVal)+"px"},600,'easeOutBack',function(){dostat=true;});
	});
	//左右按钮颜色变化
	$("#"+htmlid+"_img_list_r").bind("mouseover",function(){$(this).css("border-color","#CCC");});
	$("#"+htmlid+"_img_list_r").bind("mouseout",function(){$(this).css("border-color","#DDD");});
	$("#"+htmlid+"_img_list_l").bind("mouseover",function(){$(this).css("border-color","#CCC");});
	$("#"+htmlid+"_img_list_l").bind("mouseout",function(){$(this).css("border-color","#DDD");});
	
	//默认第一个显示
	if(imgsA[0]!=null){
		if(document.all){//IE
			setTimeout(function(){imgsA[0].click();},1000);
		}else{//修复FF下pic的click事件
			var evt = document.createEvent("MouseEvents");
			evt.initEvent("click",true,true);
			setTimeout(function(){imgsA[0].dispatchEvent(evt);},1000);
		}
		if(zoomer!=null)zoomer.style.display="none";
		if(zoomer!=null)zoomer.style.display="block";
	}
	
	//屏蔽右键
	$("#"+htmlid+"_img,#"+htmlid+"_focus_imgs_list").bind('click',function(){return false;});
	$("#"+htmlid+"_img,#"+htmlid+"_focus_imgs_list").bind('contextmenu',function(){return false;});
}
//==========================================================================

//加入收藏夹代码==============================================================
/*
function fav(tit,url){
	var ctrl = (navigator.userAgent.toLowerCase()).indexOf('mac') != -1 ? 'Command/Cmd': 'CTRL';
    if (document.all) {
    	window.external.addFavorite(url, tit);
    }else if(window.sidebar){
         window.sidebar.addPanel(tit,url,"");
    }else{
         alert('You can try the shortcut key '+ ctrl +' + D added to favorites!');
    }
}
*/
//加入收藏
function fav(sURL,sTitle){
	sURL=encodeURI(sURL); 
	try{   
	window.external.addFavorite(sURL,sTitle);   
	}catch(e) {   
		try{   
			window.sidebar.addPanel(sTitle,sURL,"");   
		}catch (e) {   
			alert("You can try the shortcut key '+ ctrl +' + D added to favorites!");
		}   
	}
}
//==========================================================================


//标签组默认显示操作===========================================================
function tags_show(id){
	var tags_title=document.getElementById(id+"_title").getElementsByTagName("a");
	for(var i=0;i<tags_title.length;i++){
		$(tags_title[i]).attr("tab",i);
		$(tags_title[i]).bind("click",function(){
			//隐藏所有先
			for(var s=0;s<tags_title.length;s++){
				tags_title[s].className="";
				document.getElementById("tag_content_"+s).style.display="none";
			}
			tags_title[$(this).attr("tab")].className="A";
			document.getElementById("tag_content_"+$(this).attr("tab")).style.display="block";
		});
	}
	
	//第一个自动触发
	if(tags_title.length>0){
		tags_title[0].className="A";
		document.getElementById("tag_content_0").style.display="block";
	}

}
//==========================================================================


//递归显示左侧菜单效果=========================================================
function main_list_all(htmlclass){
	//获取地址栏参数
	var mpid=GetQueryString("mpid");
	var id=GetQueryString("id");
	if(!isNaN(mpid) && mpid!=null){
		//当前级高亮
		var thislev=$('.prolist_side a[datavalue='+mpid+']');
		thislev.addClass("A");
		//下一级打开
		thislev.next().removeClass("close");
		thislev.next().addClass("open");
		//加号变减号
		thislev.prev().removeClass("close");
		thislev.prev().addClass("open");
		//向上追溯
		upToup(thislev,htmlclass);
	}
	if(!isNaN(id) && id!=null){
		//当前级高亮
		var thispro=$('.prolist_side_son a[datavalue='+id+']');
		thispro.addClass("A");
	}
	
	var prolist_side=$("."+htmlclass);
	var time;
	//默认加减号鼠标触发
	prolist_side.find("span").bind("mouseover",function(){
		if($(this).attr("class")=="open"){
			$(this).css("background-position","right -283px");
		}else{
			$(this).css("background-position","right -83px");	
		}
	});
	prolist_side.find("span").bind("mouseout",function(){
		if($(this).attr("class")=="open"){
			$(this).css("background-position","right -183px");
		}else{
			$(this).css("background-position","right 9px");	
		}
	});
	
	//点击变化
	prolist_side.find("span").bind("click",function(){
		var ul=$(this).next().next();
		var alpha=true;
		if($.browser.msie){
			alpha=false;	
		}
		if(ul.css("display")=="none"){
			//将加号变为减号
			$(this).css("background-position","right -283px");
			$(this).attr("class","open");
			(ul.height()<140)?time=100:time=ul.height();			
			if(alpha)(ul.children()).hide().fadeIn(time);
			ul.slideDown(time);
		}else{
			//将减号变为加号
			$(this).css("background-position","right -83px");
			$(this).attr("class","close");
			((ul.height()-100)<100)?time=100:time=ul.height()-100;
			if(alpha)(ul.children()).fadeOut(time);
			ul.slideUp(time);
		}
	});
}
//向上递归追溯
function upToup(obj,htmlclass){
	if(obj.parent().parent().attr("class")==null)return null;
	if(obj.parent().parent().attr("class").indexOf(htmlclass)==-1)	return null;
	obj.parent().parent().prev().addClass("A");//高亮
	obj.parent().parent().prev().next().removeClass("close");//关闭
	obj.parent().parent().prev().next().addClass("open");//打开
	//加号变减号
	obj.parent().parent().prev().prev().removeClass("close");
	obj.parent().parent().prev().prev().addClass("open");
	upToup(obj.parent().parent().prev(),htmlclass);
}
//===========================================================================


//获取地址栏参数==============================================================
function GetQueryString(name){  
	var reg=new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r=window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
} 
//===========================================================================











