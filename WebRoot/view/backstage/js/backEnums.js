


$(function(){
	/*enumsParent*/
	
	
	$('#dg_enumsParent').datagrid({    
		
		onBeforeLoad : function(param){
			//$("#dd_dlg_parent").dialog('close');
		},
		
	    url:'getEnums.html',   
	    
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
		
		toolbar: [{
			iconCls: 'icon-add',
			text : "新增",
			width :70,
			handler: function(){
				addEnumsType();
			}
		},'-',{
			iconCls: 'icon-edit',
			text : "修改",
			width :70,
			handler: function(){
				var rowData = $("#dg_enumsParent").datagrid("getSelected");
				if(rowData!=null){
					updateEnumsType();
				}else{
					alertMsgBox("提示","请选择要修改的数据!","info");
				}
			}
		},'-',{
			iconCls: 'icon-remove',
			text : "删除",
			width :70,
			handler: function(){
				var rowData = $("#dg_enumsParent").datagrid("getSelected");
				if(rowData!=null){
					alert('删除');
				}else{
					alertMsgBox("提示","请选择要删除的数据!","info");
				}
			}
		}],
		
		onClickRow: function(rowIndex, rowData){
			onloadBackEnums(rowData.evalue);
		},
		
	    columns:[[    
	       /* {
			field : 'id',
			title : '产品编号',
			width : 100,
			align : 'center'
		}, */{
			field : 'evalue',
			title : '枚举KEY',
			width : 100,
			align : 'center'
		}, {
			field : 'ename',
			title : '枚举名称',
			width : 100,
			align : 'center',
			text  : '123'
		}, {
			field : 'edesc',
			title : '枚举描述',
			width : 100,
			align : 'center',
			text  : '123'
		}, {
			field : 'isDeleteStr',
			title : '状态(是否可用)',
			width : 100,
			align : 'center'
		}, {
			field : 'createUser',
			title : '创建人',
			width : 100,
			align : 'center'
		}, {
			field : 'createTimeStr',
			title : '创建时间',
			width : 100,
			align : 'center'
		},{
			field : 'updateUser',
			title : '修改人',
			width : 100,
			align : 'center'
		}, {
			field : 'updateTimeStr',
			title : '修改时间',
			width : 100,
			align : 'center'
		},
	    ]],
	    onLoadSuccess : function(data){
	    }
	});
	
	page("enumsParent");   //翻页汉化

	//打开新增枚举值dialog
	$("#add_backEnums").linkbutton({
		onClick:function(){
			$('#dd_dlg_enums').panel('open');
			$("#s1_enums_text").textbox("setValue",null);
			$("#s2_enums_text").textbox("setValue",null);
		}
	});
	//打开修改枚举类型dialog
	$("#edit_enumsParent").linkbutton({
		onClick:function(){
			
		}
	});
	//打开修改枚举值dialog
	$("#edit_backEnums").linkbutton({
		onClick:function(){
			var enums = $('#dg_enums').datagrid('getSelected');
			if(enums!=null){
				$('#dd_dlg_enums_edit').panel('open');
				$("#s1_editEnums_text").textbox("setValue",enums.ekey);
				$("#s2_editEnums_text").textbox("setValue",enums.evalue);
				
			}else{
				alertMsgBox("提示","请选择要修改的枚举值！");
			}
		}
	});

});


/**
 * 新增枚举值类型
 */
function addEnumsType(){
	$('#dd_dlg_parent').panel('open');
	$("#s1_text").textbox("setValue",null);
	$("#s2_text").textbox("setValue",null);
	$("#s3_text").val(null);
}


/**
 * 修改枚举值类型
 */
function updateEnumsType(){
	var enumsParent = $('#dg_enumsParent').datagrid('getSelected');
	if(enumsParent!=null){
		$('#dd_dlg_parent_edit').panel('open');
		$("#s1_editParent_text").textbox("setValue",enumsParent.evalue);
		$("#s2_editParent_text").textbox("setValue",enumsParent.ename);
		$("#s3_editParent_text").val(enumsParent.edesc);
	}else{
		alertMsgBox("提示","请选择枚举类型！");
	}
}






//-----------------------------初始化枚举值datagrid------------------------------------------------
onloadBackEnums();
function onloadBackEnums(queryId){
	/*enums*/
	$('#dg_enums').datagrid({    
		
	    url:'getEnumsChild.html?parentId='+queryId,   
	    
	    loadMsg : '正在玩命的为您加载。。。', //加载数据是显示的提示 
		
//	    pagination : true, //是否显示分页工具栏
		
		fitColumns : true,  //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
		
		rownumbers : false,  //是否显示行号
		
		//fit:true, //自动适应高度和宽度
		
		singleSelect : true,  //只允许选择一行
		
		striped : true,  //表格显示条纹
		
//		pageSize:5,  //初始页面显示数据条数
		
//		pageNumber:1, //当前页码
		
//		pageList:[1,5,10,15], // 选择当页显示数据显示条数
		
		scrollbarSize: 0,   //滚动条的宽度
		
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
	       /* {
			field : 'id',
			title : '产品编号',
			width : 100,
			align : 'center'
		}, */
	       {
			field : 'ekey',
			title : '枚举KEY',
			width : 100,
			align : 'center'
		}, {
			field : 'evalue1',
			title : 'Value1',
			width : 100,
			align : 'center',
			text  : '123'
		}, {
			field : 'evalue2',
			title : 'Value2',
			width : 100,
			align : 'center',
		}, {
			field : 'evalue3',
			title : 'Value3',
			width : 100,
			align : 'center',
		},{
			field : 'queryId',
			title : '枚举类型',
			width : 100,
			align : 'center',
		}, {
			field : 'createUser',
			title : '创建人',
			width : 100,
			align : 'center'
		}, {
			field : 'createTimeStr',
			title : '创建时间',
			width : 100,
			align : 'center'
		},{
			field : 'updateUser',
			title : '修改人',
			width : 100,
			align : 'center'
		}, {
			field : 'updateTimeStr',
			title : '修改时间',
			width : 100,
			align : 'center'
		},
	    ]],
	});
	page("enums");   //翻页汉化
}
/**
 * 
 * 新增枚举值类型
 * 
 */
function saveEnumsParent(){
	//key
	var s1_text = $("#s1_text").val();
	//value
	var s2_text = $("#s2_text").val();
	//queryId
	var s3_text = $("#s3_text").val();
	if(s1_text!=null && s1_text!='' && s2_text!=null && s2_text!=''){
		$.ajax({                                                                     
			url : "backEnumsAction_saveEnumsParent",
			type : 'post',
			data :'enumsParent.evalue='+s1_text+'&enumsParent.ename='+s2_text+'&enumsParent.edesc='+s3_text,
			dataType : "json",
			async: false,
			success : function(root) {
				if(root.total==1){
					var content = "<div style='margin: 0 auto;'>添加成功！</div>";
					showMsgBox('提示', content, 2);
					$('#dd_dlg_enums').dialog('close');
					$('#dg_enumsParent').datagrid("reload");
					
				}else{
					var content = "<div style='margin: 0 auto;'>添加失败,请联系管理员！</div>";
					showMsgBox('提示', content, 2);
				}
			}
		});
	}else{
		alertMsgBox("提示","码值和名称不能为空!");
	}
}

/**
 * 
 */
function updateEnumsParent(){
	//key
	//$("#s1_editParent_text").val();
	var s1_text = $('#s1_editParent_text').textbox('getValue');
	//value
	//$("#s2_editParent_text").val();
	var s2_text = $('#s2_editParent_text').textbox('getValue');
	//queryId
	//$("#s3_editParent_text").val();
	var s3_text = $('#s3_editParent_text').val();
	var id =  $('#dg_enumsParent').datagrid('getSelected').id
	if(s1_text!=null && s1_text!='' && s2_text!=null && s2_text!=''){
		$.ajax({                                                                     
			url : "backEnumsAction_updateEnumsParent",
			type : 'post',
			data :'enumsParent.evalue='+s1_text+'&enumsParent.ename='+s2_text+'&enumsParent.edesc='+s3_text+"&enumsParent.id="+id,
			dataType : "json",
			async: false,
			success : function(root) {
				if(root.total==1){
					var content = "<div style='margin: 0 auto;'>修改成功！</div>";
					showMsgBox('提示', content, 2);
					$('#dd_dlg_parent_edit').dialog('close');
					$('#dg_enumsParent').datagrid("reload");
					
				}else{
					var content = "<div style='margin: 0 auto;'>修改失败,请联系管理员！</div>";
					showMsgBox('提示', content, 2);
				}
			}
		});
	}else{
		alertMsgBox("修改提示","码值和名称不能为空!");
	}
}

/**
 * 
 * 新增详细枚举值
 * 
 */
function saveBackEnums(){
	var s1_text = $("#s1_enums_text").val();
	var s2_text = $("#s2_enums_text").val();
	var enumsParent = $('#dg_enumsParent').datagrid('getSelected');
	if(enumsParent!=null){
		var s3_text = enumsParent.evalue;
		if(s1_text!=null && s1_text!='' && s2_text!=null){
			
			$.ajax({                                                                     
				url : "backEnumsAction_saveBackEnums",
				type : 'post',
				data :'backenums.ekey='+s1_text+'&backenums.evalue='+s2_text+'&backenums.queryId='+s3_text,
				dataType : "json",
				async: false,
				success : function(root) {
					if(root.total==1){
						var content = "<div style='margin: 0 auto;'>添加成功！</div>";
						showMsgBox('提示', content, 2);
						$("#dd_dlg_enums").dialog('close');
						onloadBackEnums(s3_text);
						
					}else{
						var content = "<div style='margin: 0 auto;'>添加失败,请联系管理员！</div>";
						showMsgBox('提示', content, 2);
					}
				}
			});
		}else{
			alertMsgBox("提示","码值和名称不能为空");
		}
	
	}else{
		alertMsgBox("提示","请选择枚举值类型！");
	}
}


function updateEnums(){
	//key
	var s1_text = $('#s1_editEnums_text').textbox('getValue');
	//value
	var s2_text = $('#s2_editEnums_text').textbox('getValue');
	var enums =  $('#dg_enums').datagrid('getSelected');
	var id = enums.id;
	if(s1_text!=null && s1_text!='' && s2_text!=null && s2_text!=''){
		$.ajax({                                                                     
			url : "backEnumsAction_updateEnums",
			type : 'post',
			data :'backenums.ekey='+s1_text+'&backenums.evalue='+s2_text+"&backenums.id="+id,
			dataType : "json",
			async: false,
			success : function(root) {
				if(root.total==1){
					var content = "<div style='margin: 0 auto;'>修改成功！</div>";
					showMsgBox('提示', content, 2);
					$('#dd_dlg_enums_edit').dialog('close');
					onloadBackEnums(enums.queryId);
					
				}else{
					var content = "<div style='margin: 0 auto;'>修改失败,请联系管理员！</div>";
					showMsgBox('提示', content, 2);
				}
			}
		});
	}else{
		alertMsgBox("修改提示","码值和名称不能为空!");
	}
}




