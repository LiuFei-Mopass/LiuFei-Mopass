$(function(){
	$('#dg').datagrid({    
		
	    url:'backProduct_getProductToJson',   //?pageNumber=0&pageSize=5
	    
	    loadMsg : '正在玩命的为您加载。。。', //加载数据是显示的提示 
		
	    pagination : true, //是否显示分页工具栏
		
		fitColumns : true,  //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
		
		rownumbers : false,  //是否显示行号
		
		//fit:true, //自动适应高度和宽度
		
		striped : true,  //表格显示条纹striped
		
		pageSize:5,  //初始页面显示数据条数
		
		pageNumber:1, //当前页码
		
		pageList:[1,5,10,15], // 选择当页显示数据显示条数
		
		
		scrollbarSize: 0,   //滚动条的宽度
		
		
		
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
				var u ="<a id='btnE'  class='editclsE' >编辑</a>   ";
    			var d ="<a id='btnD'  class='editclsD' >删除</a> ";
    			return u +"  |  "+ d;
				
	        	/*var isdelete = $("#tb").datagrid("getRows")[index].isdelete;
	        	if(row.editing){
	        		var s ="<a  href='javascript:void(0)' onclick='saverow("+index+")' >保存</a>";
	        		var q ="<a  href='javascript:void(0)' onclick='cancelrow("+index+")'>取消</a>";
	        		return s +"  |  "+ q;
	        	}else{
	        		if(isdelete=="是"){
	        			var s ="<a  href='javascript:void(0)' onclick='rsaverow("+index+")' >恢复数据</a>";
	        			return s;
	        		}else{
	        			var u ="<a href='javascript:void(0)' onclick='updaterow("+index+")' >编辑</a> ";
	        			var d ="<a href='javascript:void(0)' onclick='deleterow("+index+")'>删除</a>";
	        			return u +"  |  "+ d;
	        		}
	        	}*/
				
			}
		},
	    ]],
	    onLoadSuccess:function(data){  
	    	$('.editclsE').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
	    	$('.editclsD').linkbutton({text:'删除',plain:true,iconCls:'icon-edit'});
	    },
	    toolbar: [{
			iconCls: 'icon-search',
			text: '查询',
			width:100,
			handler: function(){
				
			}
		},'-',{
			iconCls: 'icon-help',
			handler: function(){alert('帮助按钮')}
		}],
		


	});
	page();   //翻页汉化
})

function page(){
	$('#dg').datagrid("getPager").pagination({
		beforePageText:'当前第',
		afterPageText:'页/共{pages}页',
		displayMsg:'当前第 {from} - {to} 条数据   共 {total} 条数据',
	});
};
