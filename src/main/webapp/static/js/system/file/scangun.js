$(function () {
	//下拉框，查询条件“状态”
	JY.Dict.setSelect("selectisValid","isValid",2,"全部");
	// 加载扫描枪数据
	getbaseList();
	//查询标间表单的“过滤”按钮，增加回车事件
	$("#baseForm").keydown(function(e){
		 keycode = e.which || e.keyCode;
		 if (keycode==13) {
			 search();
		 } 
	});
	//功能：新加
	$('#addBtn').on('click', function(e) {
		//通知浏览器不要执行与事件关联的默认动作
		e.preventDefault();
		cleanForm();
		loadOrgTree(); // 加载所有组织结构树
		JY.Model.edit("auDiv","新增",function(){
			 if(JY.Validate.form("auForm")){
				 var that =$(this);
				 JY.Ajax.doRequest("auForm",uucpath +'/backstage/scangun/add',null,function(data){
				     that.dialog("close");// 关闭窗口
				     JY.Model.info(data.resMsg,function(){search();});
				 });
			 }
		});
	});
	//功能：批量删除
	$('#delBatchBtn').on('click', function(e) {
		//通知浏览器不要执行与事件关联的默认动作		
		e.preventDefault();
		var chks =[];    
		$('#baseTable input[name="ids"]:checked').each(function(){    
			chks.push($(this).val());    
		});
		if(chks.length==0) {
			JY.Model.info("您没有选择任何内容!"); 
		}else{
			JY.Model.confirm("确认要删除选中的数据吗?",function(){	
				JY.Ajax.doRequest(null,uucpath +'/backstage/scangun/delBatch',{chks:chks.toString()},function(data){
					JY.Model.info(data.resMsg,function(){search();});
				});
			});		
		}
	});


});

// 搜索按钮
function search(){
	$("#searchBtn").trigger("click");
}
// 加载组织结构树
function loadOrgTree(){
	JY.Ajax.doRequest(null,uucpath +'/backstage/scangun/orgTree',null,function(data){
		$.fn.zTree.init(
			$("#orgTree"),
			{	view:{dblClickExpand:false,selectedMulti:false,nameIsHTML:true},
				data:{simpleData:{enable: true}},
				callback:{onClick: clickOrg}
			},
			data.obj);
	});
}
// 清空组织
function emptyOrg(){
	$("#orgName").prop("value","");
	$("#auForm input[name$='orgId']").prop("value","0");
}
// 显示组织树
var preisShow=false;//组织窗口是否显示
function showOrg() {
	if(preisShow){
		hideOrg();
	}else{
		var obj = $("#orgName");
		var offpos = $("#orgName").position();
		$("#orgContent").css({left:offpos.left+"px",top:offpos.top+obj.heith+"px"}).slideDown("fast");
		preisShow=true;
	}
}
// 选中某个组织
function clickOrg(e, treeId, treeNode) {
	var check = (treeNode && !treeNode.isParent);
	if(check){
		var zTree = $.fn.zTree.getZTreeObj("orgTree"),
		nodes = zTree.getSelectedNodes(),v ="",n ="",o="",p="";	
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";//获取name值
			n += nodes[i].id + ",";//获取id值
			o += nodes[i].other + ",";//获取自定义值
			var pathNodes=nodes[i].getPath();
			for(var y=0;y<pathNodes.length;y++){
				p+=pathNodes[y].name+"/";//获取path/name值
			}
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);	
		if (n.length > 0 ) n = n.substring(0, n.length-1);
		if (o.length > 0 ) o = o.substring(0, o.length-1);
		if (p.length > 0 ) p = p.substring(0, p.length-1);
		if(o=='o'){//判断是否组织
			$("#orgName").val(p);
			//n=n.replace("role","");
			$("#auForm input[name$='orgId']").prop("value",n);
			//因为单选选择后直接关闭，如果多选请另外写关闭方法
			hideOrg();
		}
	}
}
function hideOrg(){
	$("#orgContent").fadeOut("fast");
	preisShow=false;
}
function getbaseList(init){
	if(init==1)$("#baseForm .pageNum").val(1); //执行搜索初始化
	JY.Model.loading();
	JY.Ajax.doRequest("baseForm",uucpath +'/backstage/scangun/findByPage',null,function(data){
		$("#baseTable tbody").empty(); //搜索结果容器#baseTable tbody
        var obj = data.obj;
        var list = obj.list;
        var results = list.results;
        var permitBtn = obj.permitBtn;
        var pageNum = list.pageNum, pageSize = list.pageSize, totalRecord = list.totalRecord;
        var html="";
    	if(results != null && results.length > 0){
        	 var leng = (pageNum-1)*pageSize;//计算序号
        	 for(var i = 0;i<results.length;i++){
        		 var gun = results[i];
        		 html+="<tr>";
        		 html+="<td class='center'><label> <input type='checkbox' name='ids' value='"+gun.gunId+"' class='ace' /> <span class='lbl'></span></label></td>";
        		 html+="<td class='center hidden-480'>"+(i+leng+1)+"</td>";
        		 html+="<td class='center'>"+JY.Object.notEmpty(gun.gunNo)+"</td>";
        		 html+="<td class='center '>"+JY.Object.notEmpty(gun.orgName)+"</td>";
        		 if(gun.isValid == 1)
        		 	html+="<td class='center hidden-480'><span class='label label-sm label-success'>有效</span></td>";
        		 else
        		 	html+="<td class='center hidden-480'><span class='label label-sm arrowed-in'>无效</span></td>";
        		 html+="<td class='center hidden-480'>"+JY.Object.notEmpty(gun.description)+"</td>";
        		 html+=JY.Tags.setFunction(gun.gunId,permitBtn);
        		 html+="</tr>";
        	 }
        	 $("#baseTable tbody").append(html);
        	 JY.Page.setPage("baseForm","pageing",pageSize,pageNum,totalRecord,"getbaseList"); // 分页处理
        }else{
        	html+="<tr><td colspan='8' class='center'>没有相关数据</td></tr>";
        	$("#baseTable tbody").append(html);
        	$("#pageing ul").empty();//清空分页
        }
    	JY.Model.loadingClose();
	 });
}
// 查看文件
function check(gunId){
	cleanForm();
	JY.Ajax.doRequest(null,uucpath +'/backstage/scangun/orgTree',null,function(data){
		$.fn.zTree.init($("#orgTree"),{view:{dblClickExpand:false,selectedMulti:false,nameIsHTML:true},data:{simpleData:{enable: true}},callback:{onClick:clickOrg}},data.obj);
		JY.Ajax.doRequest(null,uucpath +'/backstage/scangun/find',{gunId:gunId},function(data){
		    setForm(data);
		    JY.Model.check("auDiv");
		});
	});
}
// 删除文件
function del(gunId){
	JY.Model.confirm("确认删除吗？",function(){
		JY.Ajax.doRequest(null,uucpath +'/backstage/scangun/del',{gunId:gunId},function(data){
			JY.Model.info(data.resMsg,function(){search();});
		});
	});
}


//删除图片文件
function fileImageDel(imageId){
	JY.Ajax.doRequest(null,uucpath +'/backstage/fileImage/delFileImage',{"imageId":imageId},function(data){
		if(data.res == 1){
			console.log("成功删除该图片");
			$("#imagePreviewBoxID").children("li[imageId="+imageId+"]").remove();
		}else{
			console.log(data.res.resMsg);
		}
	});
}

// 修改文件
function edit(gunId){
	cleanForm();
	JY.Ajax.doRequest(null,uucpath +'/backstage/scangun/orgTree',null,function(data){
		$.fn.zTree.init(
			$("#orgTree"),
			{view:{dblClickExpand:false,selectedMulti:false,nameIsHTML:true},data:{simpleData:{enable: true}},callback:{onClick:clickOrg}},
			data.obj);
		JY.Ajax.doRequest(null,uucpath +'/backstage/scangun/find',{gunId:gunId},function(data){
		    setForm(data); // 修改表单赋值
		    JY.Model.edit("auDiv","修改",function(){
		    	if(JY.Validate.form("auForm")){
					var that =$(this);
					JY.Ajax.doRequest("auForm",uucpath +'/backstage/scangun/update',null,function(data){
					    that.dialog("close");
					    JY.Model.info(data.resMsg,function(){search();});
					});
				}
		    });
		});
	});
}
// 清空表单
function cleanForm(){
	JY.Tags.isValid("auForm","1");
	JY.Tags.cleanForm("auForm");
	$("#auForm input[name$='orgId']").val('0');//上级资源
	$("#auForm input[name$='fileName']").prop("disabled",false);
	hideOrg();
}
// 表单赋值
function setForm(data){
	var gun = data.obj;
	$("#auForm input[name$='gunId']").val(gun.gunId);
	JY.Tags.isValid("auForm",(JY.Object.notNull(gun.isValid)?gun.isValid:"0"));
	$("#auForm input[name$='gunNo']").val(JY.Object.notEmpty(gun.gunNo));
	$("#auForm input[name$='gunNo']").prop("disabled",true);
	$("#auForm textarea[name$='description']").val(JY.Object.notEmpty(gun.description));//描述
	var treeObj = $.fn.zTree.getZTreeObj("orgTree");
	var nodes = treeObj.getNodesByParam("id",""+gun.orgId);
	if(nodes.length>0){
		treeObj.selectNode(nodes[0]);
		clickOrg(null,null,nodes[0]);
	}
}
