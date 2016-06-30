$(document).ready(function(){
	$(".ub_as1").mousemove(function(){
		$(".ub_as1").css({
			"color":"#FFF",
			"background":"red"
		});
		$(".ub_as2,.ub_as3,.ub_as4").css({
			"color":"#000",
			"background":"#EEEEEE"
		});
		$(".non1").css("display","block");
		$(".non2,.non3,.non4").css("display","none");
	
	});
	
	$(".ub_as2").mousemove(function(){
		$(".ub_as2").css({
			"color":"#FFF",
			"background":"red"
		});
		$(".ub_as1,.ub_as3,.ub_as4").css({
			"color":"#000",
			"background":"#EEEEEE"
		});
		$(".non2").css("display","block");
		$(".non1,.non3,.non4").css("display","none");
	});
	
	$(".ub_as3").mousemove(function(){
		$(".ub_as3").css({
			"color":"#FFF",
			"background":"red"
		});
		$(".ub_as1,.ub_as2,.ub_as4").css({
			"color":"#000",
			"background":"#EEEEEE"
		});
		$(".non3").css("display","block");
		$(".non2,.non1,.non4").css("display","none");
	});

	$(".ub_as4").mousemove(function(){
		$(".ub_as4").css({
			"color":"#EEEEEE",
			"background":"red"
		});
		$(".ub_as1,.ub_as2,.ub_as3").css({
			"color":"#000",
			"background":"#EEEEEE"
		});
		$(".non4").css("display","block");
		$(".non2,.non3,.non1").css("display","none");
	});

});
