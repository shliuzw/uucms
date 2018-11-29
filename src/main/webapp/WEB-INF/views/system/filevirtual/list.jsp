<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html lang="en">
<head>
<%@include file="../common/includeBaseSet.jsp" %>
<%@include file="../common/includeSystemSet.jsp" %>
<link rel="stylesheet" href="${uucpath}/static/plugins/zTree/3.5/zTreeStyle.css" />
<link rel="stylesheet" type="text/css" href="${uucpath}/static/plugins/webuploader/css/webuploader.css" />
<link rel="stylesheet" type="text/css" href="${uucpath}/static/plugins/webuploader/image-upload/style.css" />
<link rel="stylesheet" href="${uucpath}/static/apidoc/JYUI/assets/css/jquery.gritter.css" />

<link rel="stylesheet" href="${uucpath}/static/apidoc/JYUI/assets/css/colorbox.css" />
<link rel="stylesheet" href="${uucpath}/static/apidoc/JYUI/assets/css/font-awesome.min.css" />

<script src="${uucpath}/static/plugins/zTree/3.5/jquery.ztree.core-3.5.min.js"></script>
<script src="${uucpath}/static/js/system/file/filevirtual.js"></script>
<script src="${uucpath}/static/js/system/index/index.js"></script>
<script src="${uucpath}/static/plugins/tabs/js/tab-control.min.js"></script>
<script type="text/javascript" src="${uucpath}/static/js/jquery/jquery.cookie.js"></script>
<script src="${uucpath}/static/apidoc/JYUI/assets/js/jquery.gritter.min.js"></script>

<script src="${uucpath}/static/js/ace/ace.min.js"></script>
<script src="${uucpath}/static/js/ace/ace-elements.min.js"></script>
</head>
<body>
<div class="page-content">
	<div class="row-fluid">
		<div class="col-xs-12">
			<!-- 查询条件form -->
			<form id="baseForm" class="form-inline" method="POST" onsubmit="return false;">
				<!-- 查询条件DIV -->
				<div class="row">
					<div class="widget-main">
						<input type="text" name="fileName" placeholder="这里输入文件名"   class="input-large">&nbsp;&nbsp;
						<span id="selectisValid"><label></label>：<select  data-placeholder="状态" name="isValid" class="chosen-select isSelect75"></select></span>&nbsp;&nbsp;
						<button id='searchBtn' class="btn btn-warning  btn-xs" title="过滤" type="button" onclick="getbaseList(1)"><i class="icon-search bigger-110 icon-only"></i></button>
					</div>
				</div>
				<!-- 初始化分页参数 -->
				<input type='hidden' class='pageNum' name='pageNum' value='1'/>
				<input type='hidden' class='pageSize'  name='pageSize' value='15'/>
			</form>
			<!-- 文件记录表格 -->
			<table id="baseTable" class="table table-striped table-bordered table-hover" >
				<thead>
					<tr>
						<th style="width:3%" class="center">
							<label><input type="checkbox" class="ace" ><span class="lbl"></span></label>
						</th>
						<th style="width:5%"  class="center hidden-480">序号</th>
						<th style="width:10%" class="center">文件名</th>
						<th style="width:10%" class="center">条形码</th>
						<th style="width:8%"  class="center ">所属部门</th>
						<th style="width:5%"  class="center hidden-480">状态</th>
						<th style="width:15%" class="center hidden-480">描述</th>
						<th style="width:15%" class="center">操作</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<!-- File功能列表，对应菜单定义 -->
			<div class="row">
				<div class="col-sm-4">
					<div class="dataTables_info customBtn" >
						<c:forEach var="pbtn" items="${permitBtn}">
							<a href="#" title="${pbtn.name}" id="${pbtn.btnId}" class="lrspace3" ><i class='${pbtn.icon} bigger-220'></i></a>
						</c:forEach>
					</div>
				</div>
				<div class="col-sm-8">
					<!--设置分页位置-->
					<div id="pageing" class="dataTables_paginate paging_bootstrap">
						<ul class="pagination"></ul>
					</div>
				</div>
			</div>
			<!-- #addorUpdateFrom 引入文件添加/修改表单页面，默认隐藏 -->
			<%@include file="form.jsp" %>
			<%@include file="listTracker.jsp" %>
			<!-- #dialog-confirm 引入操作的交互等待页面 -->
			<%@include file="../common/dialog.jsp" %>
		</div>
	</div>
</div>
<div id="cboxOverlay" style="opacity: 1; cursor: auto; visibility: visible; background: rgba(0,0,0,0.8); display: none;">
	<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: block; visibility: visible; top: 35px; left: 552px; position: absolute; width: 580px; height: 608px; opacity: 1; cursor: auto;padding-top: 15px;">
		<div id="cboxContent" style="float: left; width: 500px; height: 528px;">
			<div id="cboxLoadedContent" style="width: 500px; overflow: hidden; height: 500px;">
				<img class="cboxPhoto" src="" alt="" style="cursor: pointer; width: 500px; height: 500px; float: none;">
			</div>
			<div id="cboxCurrent" style="float: left; display: block;">
				2 of 8
			</div>
			<button type="button" id="boxPrevious" onclick="imgViewPrev();" style="display: block;position: absolute;bottom: 0px;left: 0px;">
			<i class="fa fa-arrow-left">&laquo;</i>
			</button>
			<button type="button" id="boxNext" onclick="imgViewNext();" style="display: block;position: absolute;bottom: 0px;left: 25px;"><i class="fa fa-arrow-right">&raquo;</i></button><button id="cboxSlideshow" style="display: none;"></button>

		</div>
    	<div onclick="overLayHide();" style="position: absolute;right: 25px;top: 0px;border-radius: 30px; font-weight: bold;color: #fff;background:rgba(0,0,0,.6);padding:10px;cursor:pointer;">×</div>
    </div>
</div>

</body>
</html>