$(function () {
	//下拉框，查询条件“状态”
//	JY.Dict.setSelect("selectisValid","isValid",2,"全部");
	// 加载文件数据
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
		JY.Dict.setSelect("selectFileProp","fileProp","1");
		JY.Model.edit("auDiv","新增",function(){
			 if(JY.Validate.form("auForm")){
				 var that =$(this);
				 JY.Ajax.doRequest("auForm",uucpath +'/backstage/file/add',null,function(data){
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
				JY.Ajax.doRequest(null,uucpath +'/backstage/file/delBatch',{chks:chks.toString()},function(data){
					JY.Model.info(data.resMsg,function(){search();});
				});
			});		
		}
	});
	//功能：备份文件
    $('#copyBatchBtn').on('click', function(e) {
    	//通知浏览器不要执行与事件关联的默认动作
        e.preventDefault();
        JY.Ajax.doRequest(null,uucpath +'/backstage/file/copyBatchInit',null,function(data){
            setFormBackup(data); // 修改表单赋值
            JY.Model.edit("auDivBackup","备份文件",function(){
            	 if(JY.Validate.form("auFormBackup")){
            		 var that =$(this);
            		 JY.Ajax.doRequest("auFormBackup",uucpath +'/backstage/file/copyBatch',null,function(data){
            		    that.dialog("close");// 关闭窗口
            		 });
            	 }
            });
        });
    });
	// 表单中的录入时间
	$("input[name='inputTime']").datetimepicker({
    	format:'yyyy-mm-dd hh:ii:00',language:'zh-CN',weekStart:1,todayBtn:1,autoclose: 1,todayHighlight: 1,startView: 2,minView:0,
    	}).on('changeDate', function(ev){
        	var beginTime=$("input[name='inputTime']").val();
    });

    $("input[name='beginTime']").datetimepicker({
    		format:'yyyy-mm-dd hh:ii:00',language:'zh-CN',weekStart:1,todayBtn:1,autoclose: 1,todayHighlight: 1,startView: 2,minView:0,
          }).on('changeDate', function(ev){
        	  	var beginTime=$("input[name='beginTime']").val();
        	  	$("input[name='endTime']").datetimepicker('setStartDate',beginTime);
        	 });
    	$("input[name='endTime']").datetimepicker({
    		format: 'yyyy-mm-dd hh:ii:00',language:'zh-CN',weekStart: 1,todayBtn:1,autoclose:1,todayHighlight:1,startView:2,minView:0,
    	}).on('changeDate', function(ev){
    	  	var endTime=$("input[name='endTime']").val();
    	  	$("input[name='beginTime']").datetimepicker('setEndDate',endTime);
    	});
});

// 搜索按钮
function search(){
	$("#searchBtn").trigger("click");
}
// 加载组织结构树
function loadOrgTree(){
	JY.Ajax.doRequest(null,uucpath +'/backstage/file/orgTree',null,function(data){
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
	JY.Ajax.doRequest("baseForm",uucpath +'/backstage/file/findByPage',null,function(data){
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
        		 var file = results[i];
        		 html+="<tr>";
        		 html+="<td class='center'><label> <input type='checkbox' name='ids' value='"+file.fileId+"' class='ace' /> <span class='lbl'></span></label></td>";
        		 html+="<td class='center'>"+JY.Date.Default(file.inputTime)+"</td>";
        		 html+="<td class='center hidden-480'>"+(i+leng+1)+"</td>";
        		 html+="<td class='center'>"+JY.Object.notEmpty(file.fileNo)+"</td>";
        		 html+="<td class='center'>"+JY.Object.notEmpty(file.fileName)+"</td>";
        		 html+="<td class='center'>"+JY.Object.notEmpty(file.itemName)+"</td>";
        		 html+="<td class='center '>"+JY.Object.notEmpty(file.orgName)+"</td>";
        		 if(file.isValid == 1)
        		 	html+="<td class='center hidden-480'><span class='label label-sm label-success'>有效</span></td>";
        		 else
        		 	html+="<td class='center hidden-480'><span class='label label-sm arrowed-in'>无效</span></td>";
        		 html+="<td class='center hidden-480'>"+JY.Object.notEmpty(file.description)+"</td>";
        		 html+=JY.Tags.setFunction(file.fileId,permitBtn);
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
function check(accountId){
	cleanForm();
	JY.Ajax.doRequest(null,uucpath +'/backstage/file/orgTree',null,function(data){
		$.fn.zTree.init($("#orgTree"),{view:{dblClickExpand:false,selectedMulti:false,nameIsHTML:true},data:{simpleData:{enable: true}},callback:{onClick:clickOrg}},data.obj);
		JY.Ajax.doRequest(null,uucpath +'/backstage/file/find',{accountId:accountId},function(data){
		    setForm(data);
		    JY.Model.check("auDiv");
		});
	});
}
// 删除文件
function del(fileId){
	JY.Model.confirm("确认删除吗？",function(){	
		JY.Ajax.doRequest(null,uucpath +'/backstage/file/del',{fileId:fileId},function(data){
			JY.Model.info(data.resMsg,function(){search();});
		});
	});
}

//上传文件
function uploadPic(fileId){
	JY.Model.editBig("wrapperUp","上传图片" ,fileId);
}


//上传文件
function imageView(fileId){
	loadFileImages(fileId, 1);

}
//图片展示列表分页切换加载图片方法
function loadFileImages(fileId, pageNow){
	JY.Ajax.doRequest(null,uucpath +'/backstage/fileImage/findByPage',{"fileId":fileId, "pageNum" : pageNow},function(data){
		if(data && data.res == 1){
			if(data.obj.list.totalRecord>0){
				var imgList = '';
				var fiPageNow = data.obj.list.pageNum;
				var fiPageCount = data.obj.list.totalPage;
				var fiPagePrev = fiPageNow > 1?(fiPageNow-1):1;
				var fiPageNext = fiPageNow < fiPageCount?(fiPageNow+1):fiPageCount;
				var fiPageStart = fiPageNow > 5?fiPageNow-5:1;
				var fiPageEnd = (fiPageCount-fiPageNow)>5?(fiPageNow+5):fiPageCount;

				var viewCount = data.obj.list.results.length;
				$.each(data.obj.list.results, function(index, fiItem){
					imgList += "<li imageId="+fiItem.imageId +">";
					imgList += "<a href='javascript:void(0);' imgUrl='"+uucpath  + fiItem.barcode+ "' data-rel='colorbox' img-index='"+index+"' class='cboxElement' onclick='imgOverView(\" "+ uucpath  + fiItem.barcode+"\","+index+","+viewCount+");'>"+
									"<img width='150px' height='150px' alt='150x150' src='"+uucpath + fiItem.barcode+"'> </a>"+
									"<div class='tools tools-bottom'>" +
									   "<a href='javascript:void(0)' onclick='fileImageDel(\""+fiItem.imageId +"\");'><i class='icon-remove red'></i></a>"
									"</div></li>";
				})
				$("#imagePreviewBoxID").html(imgList);

				//组装分页按钮部分
				var pageIndexStr = "";
				var pageBox = "<ul class='pagination'>";
				if(fiPageNow!=1){
					pageBox += "<li class='prev'><span onclick='loadFileImages(\""+fileId+"\" ,"+fiPagePrev+");'><i class='icon-double-angle-left'></i></span></li>";
				}else{
					pageBox += "<li class='prev disabled'><span><i class='icon-double-angle-left'></i></span></li>";
				}
				//根据起始页和end页装配当前页码
				for(var i = fiPageStart; i <= fiPageEnd; i++){
					if(fiPageNow==i){
						pageBox +="<li class='active'><span>"+i+"</span></li>";
					}else{
						pageBox +="<li><span  onclick='loadFileImages(\""+fileId+"\" ,"+i+");'>"+i+"</span></li>";
					}
				}
				if(fiPageNow!=fiPageCount){
					pageBox += "<li class='next'><span onclick='loadFileImages(\""+fileId+"\" ,"+fiPageNext+");'><i class='icon-double-angle-right'></i></span></li>";
				}else{
					pageBox += "<li class='next disabled'><span><i class='icon-double-angle-right'></i></span></li>";
				}
				pageBox +="</ul>";
				$("#pageSwitchBoxID").html(pageBox);
				JY.Model.imgPreview("fileImagePreviewID","图片预览" ,fileId);
				//图片预览
				/*$('.ace-thumbnails [data-rel="colorbox"]').on("click",function(){
					var imgViewObj = this;
					console.log(imgViewObj);
					var viewNow = imgViewObj.attr("img-index");
					var url = imgViewObj.attr("href");
					console.log(document);
					console.log(window);

					//添加浮层
					imgOverView(url, viewNow, viewCount);
				})*/

			}else{
				console.log("该文件未上传图片")
			}

		}else{
			console.log("获取数据失败")
		}

	});
}

$(function(){
	$(".cboxPhoto").click(function(e){
		var imgImg = $(this);
		var e = event || window.event;
		var eventLeft = e.clientX;
		var imgLeft = imgImg.offset().left
		var imgWidth = imgImg.css("width").replace("px","");
		var lOrR = imgWidth/(eventLeft-imgLeft)
		if(lOrR>2){
			imgViewPrev();
		}else{
			imgViewNext();
		}
	})
})


function imgOverView(url, viewNow, viewCount){
	//imgReload(url)
	$("#cboxOverlay").show();
	$(".cboxPhoto").attr("src", url);
	$(".cboxPhoto").attr("view-now", viewNow);
	$(".cboxPhoto").attr("view-count", viewCount);
	$("#cboxCurrent").text((viewNow+1)+"/"+viewCount);
}

function imgViewPrev(){
	var viewNow =  $(".cboxPhoto").attr("view-now");
	var viewCount =  $(".cboxPhoto").attr("view-count");
	if(viewNow > 0){
		--viewNow;
		var imgBox = $('.ace-thumbnails [data-rel="colorbox"]').get(viewNow);
		var imgSrc = $(imgBox).attr("imgUrl")
		imgReload(imgSrc);
		console.log(imgSrc);
		$(".cboxPhoto").attr("src", imgSrc);
		$(".cboxPhoto").attr("view-now", viewNow);
		$(".cboxPhoto").attr("view-count", viewCount);
		$("#cboxCurrent").text((viewNow+1)+"/"+viewCount);
	}
}


function imgViewNext(){
	var viewNow =  $(".cboxPhoto").attr("view-now");
    var viewCount =  $(".cboxPhoto").attr("view-count");
    if(parseInt(viewNow)){
    	viewNow = parseInt(viewNow);
    }
    if(viewNow < viewCount-1){
    	++viewNow;
    	var imgBox = $('.ace-thumbnails [data-rel="colorbox"]').get(viewNow);
    	var imgSrc = $(imgBox).attr("imgUrl")
    	imgReload(imgSrc);
    	console.log(imgSrc);
    	//重新调整大孝
    	$(".cboxPhoto").attr("src", imgSrc);
		$(".cboxPhoto").attr("view-now", viewNow);
		$(".cboxPhoto").attr("view-count", viewCount);
		$("#cboxCurrent").text((viewNow+1)+"/"+viewCount);
    }

}

function imgReload(imgSrc){
	var imgPanel = $("#colorbox");
	var imgComponent = $("")
	var imgObj = new Image();
	var imgWidth = 300;
	var imgHeight = 300;
	var imgWidthShow = 600;
	var imgHeightShow = 500;
	var imgZoom = 1;
	imgObj.src = imgSrc;

	if(imgObj.complete){
		imgWidth = imgObj.width;
		imgHeight = imgObj.height;
	 }else{
		 // 加载完成执行
		imgObj.onload = function(){
		imgWidth = imgObj.width;
		imgHeight = imgObj.height;
		};
	 }
	if(imgWidth>700){
		imgZoom = 700/imgWidth;
		imgWidthShow = 700;
		imgHeightShow = imgHeight*imgZoom;
	}else if(imgWidth < 300){
		imgZoom = 300/imgWidth;
		imgWidthShow = 300;
		imgHeightShow = imgHeight*imgZoom;
	}else{
		imgWidthShow=imgWidth;
		imgHeightShow=imgHeight;
	}

	if(imgHeightShow>700){
    		imgZoom = 700/imgHeightShow;
    		imgHeightShow = 700;
    		imgWidthShow = imgWidthShow*imgZoom;
    	}else if(imgHeightShow < 100){
    		imgZoom = 100/imgHeightShow;
    		imgWidthShow = 100;
    		imgWidthShow = imgWidthShow*imgZoom;
    	}

	console.log("height:" + imgHeight + ",width:" + imgWidth);
	console.log("imgHeightShow:" + imgHeightShow + ",imgWidthShow:" + imgWidthShow);
	var imgOverLayW = $("#cboxOverlay").css("width").replace("px","");
	var imgOverLayH = $("#cboxOverlay").css("Height").replace("px","");
	var offLeft = (imgOverLayW-imgWidthShow-100)/2;
	var offTop = (imgOverLayH-imgHeightShow-100)/2;
	 //img面板
	 imgPanel.css({"width":imgWidthShow+70, "height":imgHeightShow+100, "top":offTop, "left": offLeft});
//	 $("#cboxWrapper").css({"width":imgWidthShow+80, "height":imgHeightShow+80});
	 $("#cboxContent").css({"width":imgWidthShow, "height":imgHeightShow+28});
	 $("#cboxLoadedContent").css({"width":imgWidthShow, "height":imgHeightShow});
	 $(".cboxPhoto").css({"width":imgWidthShow, "height":imgHeightShow});
}

function overLayHide(){
	$("#cboxOverlay").hide();
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
function edit(fileId){
	cleanForm();
	JY.Ajax.doRequest(null,uucpath +'/backstage/file/orgTree',null,function(data){
		$.fn.zTree.init(
			$("#orgTree"),
			{view:{dblClickExpand:false,selectedMulti:false,nameIsHTML:true},data:{simpleData:{enable: true}},callback:{onClick:clickOrg}},
			data.obj);
		JY.Ajax.doRequest(null,uucpath +'/backstage/file/find',{fileId:fileId},function(data){
		    setForm(data); // 修改表单赋值
		    JY.Model.edit("auDiv","修改",function(){
		    	if(JY.Validate.form("auForm")){
					var that =$(this);
					JY.Ajax.doRequest("auForm",uucpath +'/backstage/file/update',null,function(data){
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
	$("#selectFileProp select").empty();
	$(".chosen-select").removeClass("chosen-select");
	$(".chosen-select").chosen();
	hideOrg();
}
// 修改表单赋值
function setForm(data){
	var file = data.obj;
	JY.Dict.setSelect("selectFileProp","fileProp","1","",file.fileProp);
	$("#auForm input[name$='fileId']").val(file.fileId);
	JY.Tags.isValid("auForm",(JY.Object.notNull(file.isValid)?file.isValid:"0"));
	$("#auForm input[name$='fileName']").val(JY.Object.notEmpty(file.fileName));
	$("#auForm input[name$='fileName']").prop("disabled",true);
	$("#auForm input[name$='fileNo']").val(JY.Object.notEmpty(file.fileNo));
	$("#auForm input[name$='inputTime']").val(JY.Object.notEmpty(file.inputTime));
	$("#auForm input[name$='barcode']").val(JY.Object.notEmpty(file.barcode));
	$("#auForm textarea[name$='description']").val(JY.Object.notEmpty(file.description));//描述
	var treeObj = $.fn.zTree.getZTreeObj("orgTree");
	var nodes = treeObj.getNodesByParam("id",""+file.orgId);
	if(nodes.length>0){
		treeObj.selectNode(nodes[0]);
		clickOrg(null,null,nodes[0]);
	}
}

// 备份表单赋值
function setFormBackup(data){
	var file = data.obj;
	$("#auFormBackup input[name$='srcDir']").val(file.srcDir);
	$("#auFormBackup input[name$='destDir']").val(file.destDir);
}