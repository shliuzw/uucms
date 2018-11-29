<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 文件添加/修改的默认表单页面，此页面默认隐藏 -->
<div id="auDiv" class="hide">
	<form id="auForm" method="POST" onsubmit="return false;" >
		<table cellspacing="0" cellpadding="0" border="0" class="customTable">
			<tbody>
				<tr style="display:none">
					<td colspan="2" class="ui-state-error"><input type="hidden" name="gunId" ></td>
				</tr>
				<tr class="FormData" >
					<td class="CaptionTD">状态：</td>
					<td class="DataTD">&nbsp;
						<label class="inline isValidCheckbox">
							<input type="checkbox" checked="checked" sh-isValid="" role="checkbox" class="FormElement ace ace-switch ace-switch-5" />
							<span  class="lbl"></span>
							<!-- cb-isValid和Yes和No选择框配套使用-->
							<input type="hidden" hi-isValid=""  name="isValid" value="1" />
						</label>
					</td>
				</tr>
				<tr class="FormData">
                	<td class="CaptionTD"><font color="red">*</font>所属部门：</td>
                	<td class="DataTD">&nbsp;
                		<input id="orgName" jyValidate="required" type="text" readonly value="" class="FormElement ui-widget-content ui-corner-all isText300" onclick="showOrg(); return false;"/>
                		<input type="hidden" name="orgId" value="0" >
                		<a href="#" title="清空" onclick="emptyOrg(); return false;" class="lrspace3 aBtnNoTD" data-toggle="modal"><i class='icon-remove bigger-120 red'></i></a>
                		<div id='orgContent' class="menuContent ztreeMC" style="display: none; position: absolute;">
                			<ul id="orgTree" class="ztree fileOrgTree"></ul>
                		</div>
                	</td>
                </tr>
				<tr class="FormData">
					<td class="CaptionTD"><font color="red">*</font>扫描枪编码：</td>
					<td class="DataTD">&nbsp;
						<input type="text" jyValidate="required" maxlength="32" name="gunNo" class="FormElement ui-widget-content ui-corner-all isText300">
					</td>
				</tr>
				<tr class="FormData">
					<td class="CaptionTD">描述：</td>
					<td class="DataTD">&nbsp;
						<textarea rows="6" cols="10" maxlength="100" name="description" multiline="true" class="FormElement ui-widget-content ui-corner-all isSelect300"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>