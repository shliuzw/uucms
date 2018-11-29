<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 跟踪明细的默认页面，此页面默认隐藏 -->
<div id="auDivTracker" class="hide">
	<div class="row-fluid">
		<div class="col-xs-12">
			<!-- 文件记录表格 -->
			<table id="baseTableTracker" class="table table-striped table-bordered table-hover" >
				<thead>
					<tr>
						<th style="width:3%" class="center">
							<label><input type="checkbox" class="ace" ><span class="lbl"></span></label>
						</th>
						<th style="width:5%"  class="center hidden-480">序号</th>
						<th style="width:10%" class="center">文件名</th>
						<th style="width:10%" class="center">条形码</th>
						<th style="width:8%"  class="center ">扫描部门</th>
						<th style="width:15%" class="center hidden-480">扫描时间</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>