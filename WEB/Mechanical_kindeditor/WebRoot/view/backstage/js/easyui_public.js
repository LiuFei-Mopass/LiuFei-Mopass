function alertMsgBox(title,msg, icon){
	$.messager.alert(title,msg, icon); 
}
function showMsgBox(tit,content,time){
	$.messager.show({
		width:350,
		height:150,
		title:tit,
		msg:content,
		timeout:time*1000,
		showType:'slide'
	});
}
function page(type){
	$('#dg_'+type).datagrid("getPager").pagination({
		beforePageText:'当前第',
		afterPageText:'页/共{pages}页',
		displayMsg:'当前第 {from} - {to} 条数据   共 {total} 条数据',
	});
};
