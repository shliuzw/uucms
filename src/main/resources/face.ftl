<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <script language="javascript">
    function preview(oper){
        if (oper < 10){
            bdhtml=window.document.body.innerHTML;//获取当前页的html代码
            sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域
            eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域
            prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18);//从开始代码向后取html
            prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
            window.document.body.innerHTML=prnhtml;
            window.print();
            window.document.body.innerHTML=bdhtml;
        } else {
            window.print();
        }
    }
    </script>
    <style>
    	body{TEXT-ALIGN: center;}
    </style>
</head>
<body>
<div align="right"><input type="button" name="printBtn" onclick="preview(1)" value="打 印"/></div></br>
<!--startprint1-->
</br></br></br></br></br>
<div style="width:100%; text-align:center">
    <image src="${barcodeUrl}"/></br></br></br></br></br></br>
    <div style="font-size:50pt;font-family:仿宋;">${fileName}</div></br></br></br></br></br></br></br></br></br></br></br>
</div>
<div style="width:75%; text-align:right;font-size:20pt;font-family:仿宋;">${orgName}</div></br></br>
<div style="width:75%; text-align:right;font-size:16pt;font-family:仿宋;">${createTime?string("yyyy-MM-dd")}</div></br></br></br></br></br></br></br>
<div style="width:90%; text-align:left;font-size:15pt">
    局领导：
    <table style="width:20%;" cellpadding="1" cellspacing="0" border="1" bordercolor="#555">
            <tbody>
                <tr>
                    <td style="width:15%;font-size:14pt;white-space: nowrap;text-align:center">
                        &nbsp;&nbsp;张&nbsp;&nbsp;&nbsp;&nbsp;猛&nbsp;&nbsp;
                    </td>
                    <td style="width:15%;font-size:14pt;white-space: nowrap;text-align:center">
                        &nbsp;&nbsp;武&nbsp;&nbsp;&nbsp;&nbsp;虹&nbsp;&nbsp;
                    </td>
                    <td style="width:15%;font-size:14pt;white-space: nowrap;text-align:center">
                        &nbsp;&nbsp;宋立忠&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;<br />
                        &nbsp;&nbsp;<br />
                        &nbsp;&nbsp;
                    </td>
                    <td>
                    &nbsp;&nbsp;
                        <br />&nbsp;&nbsp;<br />
                        &nbsp;&nbsp;<br />
                        &nbsp;&nbsp;
                    </td>
                    <td>
                    &nbsp;&nbsp;
                        <br />&nbsp;&nbsp;<br />
                        &nbsp;&nbsp;<br />
                        &nbsp;&nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
	</div>
<!--endprint1-->
</body>
</html>