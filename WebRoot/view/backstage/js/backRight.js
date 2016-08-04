$(function(){
	
	$('#dg_rightParent').datagrid({    
		
	    url:'bac/getRightList.html',   
	    
	    loadMsg : '正在玩命的为您加载。。。', //加载数据是显示的提示 
		
	    pagination : true, //是否显示分页工具栏
		
		fitColumns : true,  //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
		
		rownumbers : false,  //是否显示行号
		
		singleSelect : true,  //只允许选择一行
		
		//fit:true, //自动适应高度和宽度
		
		striped : true,  //表格显示条纹
		
		pageSize:5,  //初始页面显示数据条数
		
		pageNumber:1, //当前页码
		
		pageList:[1,5,10,15], // 选择当页显示数据显示条数
		
		scrollbarSize: 0,   //滚动条的宽度
		
//		toolbar: '#tb_rightParent',
		
		onClickRow: function(rowIndex, rowData){
			onLoadChildRights(rowData.id);
		},
		
		toolbar: [{
			iconCls: 'icon-add',
			text : "查询",
			width :70,
			handler: function(){alert('编辑按钮')}
		},'-',{
			iconCls: 'icon-add',
			text : "新增",
			width :70,
			handler: function(){alert('帮助按钮')}
		},'-'],
		
		columns:[[    
			        {
					field : 'id',
					title : '产品编号',
					width : 100,
					align : 'center'
				},{
					field : 'rightName',
					title : '权限名称',
					width : 100,
					align : 'center'
				},{
					field : 'parentIdStr',
					title : '所属上级权限',
					width : 100,
					align : 'center'
				},{
					field : 'location',
					title : 'Tab页签名称',
					width : 100,
					align : 'center'
				},{
					field : 'isDeleteStr',
					title : '状态(是否可用)',
					width : 100,
					align : 'center'
				},
				]],
		});
	page("rightParent");
});




onLoadChildRights("");
function onLoadChildRights(id){
	$('#dg_rights').datagrid({    
		
	    url:'bac/getChildRightList.html?parentid='+id,   
	    
	    loadMsg : '正在玩命的为您加载。。。', //加载数据是显示的提示 
		
//	    pagination : true, //是否显示分页工具栏
		
		fitColumns : true,  //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
		
		rownumbers : false,  //是否显示行号
		
		singleSelect : true,  //只允许选择一行
		
		//fit:true, //自动适应高度和宽度
		
		striped : true,  //表格显示条纹
		
//		pageSize:5,  //初始页面显示数据条数
		
//		pageNumber:1, //当前页码
		
//		pageList:[1,5,10,15], // 选择当页显示数据显示条数
		
		scrollbarSize: 0,   //滚动条的宽度
		
//		toolbar: '#tb_rights',
		
		toolbar: [{
			iconCls: 'icon-add',
			text : "新增",
			width :70,
			handler: function(){
				
			}
		},'-',{
			iconCls: 'icon-edit',
			text : "修改",
			width :70,
			handler: function(){
				var rowData = $("#dg_rights").datagrid("getSelected");
				if(rowData!=null){
					openRightDataDialog();
				}else{
					alertMsgBox("提示","请选择要修改的数据!","info");
				}
			}
		},'-',{
			iconCls: 'icon-remove',
			text : "删除",
			width :70,
			handler: function(){
				var rowData = $("#dg_rights").datagrid("getSelected");
				if(rowData!=null){
				}else{
					alertMsgBox("提示","请选择要删除的数据!","info");
				}
			}
		}],
		
		columns:[[    
			        {
					field : 'id',
					title : '产品编号',
					width : 100,
					align : 'center'
				},{
					field : 'rightName',
					title : '权限名称',
					width : 100,
					align : 'center'
				},{
					field : 'parentIdStr',
					title : '所属上级权限',
					width : 100,
					align : 'center'
				},{
					field : 'location',
					title : 'Tab页签名称',
					width : 100,
					align : 'center'
				},{
					field : 'isDeleteStr',
					title : '状态(是否可用)',
					width : 100,
					align : 'center'
				},
				]],
		});
	page("rights");
}

function openRightDataDialog(){//returnReason
	$("#dd_rightData").dialog("open");
	$("#dd_rightDataContent").removeClass("hide");
	var rowData = $("#dg_rights").datagrid("getSelected");
	$("#dd_rightData_name").textbox('setValue',rowData.rightName);
	$("#dd_rightData_pageName").textbox('setValue',rowData.location);
}

function updateRightData(){
	var name = $("#dd_rightData_name").textbox('getValue');
	var pageName = $("#dd_rightData_pageName").textbox('getValue');
	var rowData = $("#dg_rights").datagrid("getSelected");
	var id = $("#dg_rightParent").datagrid("getSelected").id;
	$.ajax({                                                                     
		url : 'backRightAction_updateRightInfo',
		type : 'post',
		data :"right.rightName="+name+"&right.location="+pageName+"&right.id="+rowData.id,
		dataType : "json",
		async: false,
		success : function(root) {
			if(root[0].total>0){
				var content = "<div style='margin: 0 auto;'>修改成功!</div>";
				showMsgBox('提示', content, 2);
				$("#dd_rightData").dialog('close');
				onLoadChildRights(id);
			}else{
				var content = "<div style='margin: 0 auto;'>修改失败,请联系管理员！</div>";
				showMsgBox('提示', content, 2);
			}
		}
	});
}