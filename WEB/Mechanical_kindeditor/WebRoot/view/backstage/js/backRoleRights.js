
/*$(function(){
	//此处是扩展tree的两个方法.
	$.extend($.fn.tree.methods,{
		getCheckedExt: function(jq){//扩展getChecked方法,使其能实心节点也一起返回
			var checked = $(jq).tree("getChecked");
			var checkbox2 = $(jq).find("span.tree-checkbox2").parent();
			$.each(checkbox2,function(){
				var node = $.extend({}, $.data(this, "tree-node"), {
					target : this
				});
				checked.push(node);
			});
			return checked;
		}
	});
});*/

$(function(){
	
	$('#dg_right_role').datagrid({   
		
	    url:'backRoleAction_getAllRoles',    
	    
	    loadMsg : '正在玩命的为您加载。。。', //加载数据是显示的提示 
		
	    pagination : false, //是否显示分页工具栏
		
		fitColumns : true,  //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
		
		rownumbers : false,  //是否显示行号
		
		singleSelect : true,  //只允许选择一行
		
		//fit:true, //自动适应高度和宽度
		
		striped : true,  //表格显示条纹
		
		fit : true,
		
		scrollbarSize: 0,   //滚动条的宽度
		
		width : 240,
		
		height : 400,
		animate:true,
		
	    columns : [[
	      {
			field : 'id',
			title : '角色编号',
			width : 50,
			align : 'center',
		},{
			field : 'name',
			title : '角色名称',
			width : 100,
			align : 'center',
		},
		]],
		
		onClickRow : function(rowIndex, rowData){
			onLoadTree(rowData.id);
		}
	});
	//打开修改枚举值dialog
	$("#btn_saveRights").linkbutton({
		onClick:function(){
			var ed = $('#dg_right_role').datagrid('getSelected');
			if(ed!=null){
				var rightid = t_rolefun_add();
				if(rightid==''){
					alertMsgBox("提示","请给角色赋予权限在保存！");
				}else{
					saveRights(ed.id,rightid);	
				}
			}else{
				alertMsgBox("提示","请选择角色！");
			}
		}
	});
});


/**
 * 加载权限树
 * @param id
 */
function onLoadTree(id){
	$('#tt_tree').tree({   
		url  : 'backRightAction_getAllRights?id='+id,
		
		onContextMenu: function(e, node){
			e.preventDefault();  
            $('#tt_tree').tree('select', node.target);  
            $('#mm_right').menu('show', {  
                left: e.pageX,  
                top: e.pageY  
            }); 
		}

	});

}


/**
 * @param rightid
 */
function saveRights(id,rightid){
	//backRightAction_saveRights
	//rightid = "["+rightid+"]";
	$.ajax({                                                                     
		url : "backRightAction_saveRights",
		type : 'post',
		data :'rightid='+rightid+"&id="+id,
		dataType : "json",
		async: false,
		success : function(root) {
			if(root!=null){
				var content = "<div style='margin: 0 auto;'>保存成功！</div>";
				showMsgBox('提示', content, 2);
				onLoadTree(id);
			}else{
				var content = "<div style='margin: 0 auto;'>保存失败,请联系管理员！</div>";
				showMsgBox('提示', content, 2);
			}
		}
	});
	
}




function t_rolefun_add() {
 //获取父节点
	var parentnodes = $('#tt_tree').tree('getChecked','indeterminate');
	var temp = "";
	for ( var i = 0; i < parentnodes.length; i++) {
		if (temp != '') {
			temp +=",";
		}
		temp += parentnodes[i].id;
	}
 //获取选中对象
	var nodes = $('#tt_tree').tree('getChecked');
	for ( var i = 0; i < nodes.length; i++) {
		if (temp != ''){
			temp +=",";
		} 
		temp += nodes[i].id;
	}
  return temp;
}




function append(){
	var node = $('#tt_tree').tree('getSelected');
	if (node){
		$('#tt_tree').tree('insert', {
			before: node.target,
			data: [{
			    id: 23,
			    text: 'node23'
                }]
		});
	}
}




