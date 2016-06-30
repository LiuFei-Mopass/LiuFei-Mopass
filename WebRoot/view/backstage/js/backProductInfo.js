$(function(){
	$('#dg_product').datagrid({    
		
	    url:'backProduct_getProductChildList',   
	    
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
		
		//toolbar: '#tb_product',
		
		onClickRow : function(rowIndex, rowData){
			onLoanProductInfo(rowData.id);
		},
		
		toolbar: [{
			iconCls: 'icon-search',
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
		}, {
			field : 'productName',
			title : '产品名称',
			width : 100,
			align : 'center'
		}, {
			field : 'parentId',
			title : '产品类型',
			width : 100,
			align : 'center',
			text  : '123'
		}, {
			field : 'isShow',
			title : '是否显示',
			width : 100,
			align : 'center'
		}, {
			field : 'isDelete',
			title : '是否删除',
			width : 100,
			align : 'center'
		}, {
			field : 'produntThumbnail',
			title : '产品缩略图',
			width : 300,
			align : 'center'
		}, {
			field : 'operation',
			title : '操作',
			width : 200,
			align : 'center',
			formatter : function(value,row,index){
				var u ="<a id='btnE_info_q'  class='editclsE_q' ></a>   ";
    			var d ="<a id='btnD_info_q'  class='editclsD_q' ></a> ";
    			return u +"  |  "+ d;
			}
		},
	    ]],
	    onLoadSuccess:function(data){  
	    	$('.editclsE_q').linkbutton({text:'图片预览',plain:true,iconCls:'icon-check'});
	    	$('.editclsD_q').linkbutton({text:'上传图片',plain:true,iconCls:'icon-upload'});
	    },
	    /*toolbar: [{
			iconCls: 'icon-search',
			text: '查询',
			width:100,
			handler: function(){
				
			}
		},'-',{
			iconCls: 'icon-search',
			text: '查询',
			width:100,
			handler: function(){
				
			}
		}],*/
	});
	page("product");   //翻页汉化
})


onLoanProductInfo("");
function onLoanProductInfo(id){
	$('#dg_productInfo').datagrid({    
		
	    url:'backProduct_getProductInfoChildList?id='+id,   
	    
	    loadMsg : '正在玩命的为您加载。。。', //加载数据是显示的提示 
		
//	    pagination : true, //是否显示分页工具栏
		
		fitColumns : true,  //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
		
		rownumbers : false,  //是否显示行号
		
		singleSelect : true,  //只允许选择一行
		
		fit:true, //自动适应高度和宽度
		
		striped : true,  //表格显示条纹
		
//		pageSize:5,  //初始页面显示数据条数
//		
//		pageNumber:0, //当前页码
//		
//		pageList:[1,5,10,15], // 选择当页显示数据显示条数
		
		scrollbarSize: 0,   //滚动条的宽度
		
		//toolbar: '#tb_productInfo',
		
		toolbar: [{
					iconCls: 'icon-add',
					text : "新增",
					width :70,
					handler: function(){
						var selectRow = $('#dg_product').datagrid('getSelected');
						if(selectRow!=null){
							$('#dd_productInfo_add').dialog({    
							    title: '新增产品',    
							    width: 400,    
							    height: 200,    
							    closed: false,    
							    cache: false,    
							    modal: true,
							    inline : true,
							    iconCls: 'icon-add',
							    buttons:[{
									text:'保存',
									iconCls:'icon-save',
									handler:function(){saveProductInfo();}
								},{
									text:'取消',
									iconCls:'icon-cancel',
									handler:function(){
										$('#dd_productInfo_add').dialog("close");
									}
								}],
							});
							$("#dd_productInfo_add div").removeClass("hide");
						}else{
							
							alertMsgBox("提示","请选择产品所属类型!",'error');
						}}
				},'-',{
					iconCls: 'icon-edit',
					text : "修改",
					width :70,
					handler: function(){
						var selectRow = $('#dg_product').datagrid('getSelected');
						if(selectRow!=null){
							var selectRowc = $('#dg_productInfo').datagrid('getSelected');
							if(selectRowc!=null){
								$('#dd_productInfo_update').dialog({    
								    title: '修改产品',    
								    width: 400,    
								    height: 200,    
								    closed: false,    
								    cache: false,    
								    modal: true,
								    inline : true,
								    iconCls: 'icon-edit',
								    buttons:[{
										text:'保存',
										iconCls:'icon-save',
										handler:function(){updateProductInfo($('#productName').textbox('getValue'),"")}
									},{
										text:'取消',
										iconCls:'icon-cancel',
										handler:function(){
											$('#dd_productInfo_update').dialog("close");
										}
									}],
								}); 
								$("#dd_productInfo_update div").removeClass("hide");
								$('#productName').textbox('setValue',selectRowc.productName);
							}else{
								alertMsgBox("提示","请选择产品型号!",'error');
							}
						}else{
							alertMsgBox("提示","请选择产品所属类型!",'error');
						}
						
					}},'-',{
						iconCls: 'icon-cancel',
						text : "删除",
						width :70,
						handler: function(){
							var selectRow = $('#dg_productInfo').datagrid('getSelected');
							if(selectRow!=null){
								$('#delete_productInfo').dialog({    
								    width:600,    
								    height:400,    
								    modal:true,
								    collapsible:false,
								    minimizable:false,
								    maximizable:false,
								    iconCls: 'icon-cancel',
								    buttons:[{
										text:'确定',
										iconCls:'icon-save',
										handler:function(){
											updateProductInfo("", 1);
										}
									},{
										text:'取消',
										iconCls:'icon-cancel',
										handler:function(){
											$('#delete_productInfo').dialog("close");
										}
									}],
								});  
							}else{
								alertMsgBox("提示","请选择产品所属类型!",'error');
							}
							
						}}],
	    columns:[[    
	        {
			field : 'id',
			title : '产品编号',
			width : 100,
			align : 'center'
		}, {
			field : 'productName',
			title : '产品名称',
			width : 100,
			align : 'center'
		}, {
			field : 'parentId',
			title : '产品类型',
			width : 100,
			align : 'center',
			text  : '123'
		}, {
			field : 'isShow',
			title : '是否显示',
			width : 100,
			align : 'center'
		}, {
			field : 'isDelete',
			title : '是否删除',
			width : 100,
			align : 'center'
		}, {
			field : 'productInfoImg',
			title : '产品缩略图',
			width : 300,
			align : 'center'
		}, {
			field : 'operation',
			title : '操作',
			width : 200,
			align : 'center',
			formatter : function(value,row,index){
				var u ="<a id='btnE_info'  class='editclsE' ></a>   ";
    			var d ="<a id='btnD_info'  class='editclsD' ></a> ";
    			return u +"  |  "+ d;
			}
		},
	    ]],
	    onLoadSuccess:function(data){  
	    	$('.editclsE').linkbutton({
	    		text:'图片预览',
	    		plain:true,
	    		iconCls:'icon-check',
	    		onClick : function(){
	    			$('#dd_checkImg').dialog({    
	    			    title: '图片预览',
	    			});
	    			$("#dd_checkImg").dialog("open");
	    			$('#dd_checkImgContent').removeClass("hide");
	    			getImgSize();
	    			/*var selectRow = $('#dg_productInfo').datagrid('getSelected');
	    			var url = "view/reception/upload/images/"+selectRow.productInfoImg;
	    			$("#checkImg").attr({ src: url, alt: selectRow.productInfoImg });*/
	    		},
			});
	    	$('.editclsD').linkbutton({
	    		text:'上传图片',
	    		plain:true,
	    		iconCls:'icon-upload',
	    		onClick : function(){
	    			$("#dd_uploadFile").dialog("open");
	    			$('#dialogContent').removeClass("hide");
	    		},
    		});
	    },
	});
	page("productInfo");   //翻页汉化
}


function uploadFile(){
	
	 $.get("backUploadFileAction_uploadFil", function (data) {  
         alert(data);  
         if (data == "Success") {  
             ImageHideFile.val("");  
             myimg.remove();  
         }  
     });  
	
	
	/*$.ajax({                                                                     
		url : 'backUploadFileAction_uploadFile',
		type : 'post',
		data :"upload="+$("#uploadFile").val(),
		dataType : "json",
		async: false,
		success : function(root) {
			if(root.total==1){
				var content = "<div style='margin: 0 auto;'>上传成功！</div>";
				showMsgBox('提示', content, 2);
				$("#dd_uploadFile").dialog('close');
				
			}else{
				var content = "<div style='margin: 0 auto;'>上传失败,请联系管理员！</div>";
				showMsgBox('提示', content, 2);
			}
		}
	});*/
}


function uploadFileBox(){
	var selectRow = $('#dg_productInfo').datagrid('getSelected');
	var tit = selectRow.productName;
	var name = selectRow.productName+".jpg";
	var id = selectRow.id;
	 $.ajaxFileUpload({
          url:'uploadFileAction?name='+name+"&id="+id, //需要链接到服务器地址
          type:"post",
          secureuri:false,
          fileElementId:'file',                     //文件选择框的id属性
          dataType: 'json',                      //服务器返回的格式
          
          success: function (data, status){
             //从服务器返回的json中取出message中的数据,其中message为在struts2中action中定义的成员变量
              var content = "<div style='margin: 0 auto;'>"+data.message+"</div>";
				showMsgBox('提示', content, 2);
				$("#dd_uploadFile").dialog('close');
				$('#dg_productInfo').datagrid("reload");
          },
          error: function (data, status, e) {//服务器响应失败处理函数
        	  var content = "<div style='margin: 0 auto;'>"+data.message+"</div>";
				showMsgBox('提示', content, 2);
          }
      });
}


function getImgSize(){
	
	var rowData = $('#dg_productInfo').datagrid('getSelected');
	/*var url ="Http://tsingcaic368869.3001.vh.cnolnic.com/machline/"+rowData.productInfoImg;
	$("#checkImg").attr({ src: url});*/
	
	$.ajax({                                                                     
		url : 'backProduct_getImgSize',
		type : 'post',
		data :"id="+rowData.id,
		dataType : "json",
		async: false,
		success : function(root) {
			var data = root.rows;
			var url = data[0].url;
			if(url!="" && url !=null ){
				$("#checkImg").attr({ src: url});
			}
		}
	});
}



function uploadFileAct(){
	var selectRow = $('#dg_productInfo').datagrid('getSelected');
	var tit = selectRow.productName;
	var name = selectRow.id+"/"+tit+".jpg";
	alert($("#file").val() + name);
	$.ajax({                                                                     
		url : 'backUploadFileAction_uploadFile_FTP',
		type : 'post',
		data :"url="+$("#file").val()+"&name="+name,
		dataType : "json",
		async: false,
		success : function(root) {
			var data = root.total;
			alert(data);
		}
	});
}


function updateProductInfo(productName,isDelete){
	var id = $('#dg_productInfo').datagrid('getSelected').id;
	$.ajax({                                                                     
		url : 'backProduct_updateProductInfo',
		type : 'post',
		data :"name="+productName+"&id="+id+"&is_delete="+isDelete,
		dataType : "json",
		async: false,
		success : function(root) {
			if(root.total==1){
				var content = "<div style='margin: 0 auto;'>修改成功！</div>";
				showMsgBox('提示', content, 2);
				$("#dd_productInfo_update").dialog('close');
				$('#dg_productInfo').datagrid("reload");
			}else{
				var content = "<div style='margin: 0 auto;'>修改失败,请联系管理员！</div>";
				showMsgBox('提示', content, 3);
			}
		}
	});
}


function saveProductInfo(){
	var parentId = $('#dg_product').datagrid('getSelected').id;
	var name = $("#productName-add").val();
	$.ajax({                                                                     
		url : 'backProduct_saveProductInfo',
		type : 'post',
		data :"name="+name+"&parentId="+parentId,
		dataType : "json",
		async: false,
		success : function(root) {
			if(root.total==1){
				var content = "<div style='margin: 0 auto;'>添加成功！</div>";
				showMsgBox('提示', content, 2);
				$("#dd_productInfo_add").dialog('close');
				$('#dg_productInfo').datagrid("reload");
			}else{
				var content = "<div style='margin: 0 auto;'>添加失败,请联系管理员！</div>";
				showMsgBox('提示', content, 2);
			}
		}
	});
}