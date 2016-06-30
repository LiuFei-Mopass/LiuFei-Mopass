$(document).ready(function(){
	
});
$(function() {
	
	
	$("#login_sub").click(function(){
		$("#loginFrom").submit();
	});
	$('#ePwd').bind('keypress',function(event){
		var event = event || window.event; 
		var name = $("#eName").val();
		var pwd = $("#ePwd").val();
		if (event.keyCode == 13 && name !="" && pwd !="") {
			$("#loginFrom").submit();// 处理事件
		} else{
			//alertMsgBox("提示","码值和名称不能为空!");
			$("#eName").addClass("boxError");
			$("#ePwd").addClass("boxError");
		}
    });
})

/*function EnterPress(e){ //传入 event 
		var e = e || window.event; 
		var name = $("#eName").val();
		var pwd = $("#ePwd").val();
		if (event.keyCode == 13 && name !="" && pwd !="") {
			$("#loginFrom").submit();// 处理事件
		} else{
			alert("00");
			$("#eName").addClass(".boxError");
		}
} */