<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 文件添加/修改的默认表单页面，此页面默认隐藏 -->
<div id="auDivBackup" class="hide">
	<form id="auFormBackup" method="POST" onsubmit="return false;" >
		<table cellspacing="0" cellpadding="0" border="0" class="customTable">
			<tbody>
				<tr class="FormData">
                    <td class="CaptionTD">&nbsp;源路径：</td>
                    <td class="DataTD">
						<input name="srcDir" style="width:400px" value="" type="text" >
					</td>
                </tr>
				<tr class="FormData">
                	<td class="CaptionTD">目的路径：</td>
                	<td class="DataTD">
                		<input name="destDir" style="width:350px" value="" type="text" >
                	</td>
                </tr>
			</tbody>
		</table>
	</form>
</div>