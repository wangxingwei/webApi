<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>基础权限维护</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="/static/application/css/power/style.css" />
    <link rel="stylesheet" type="text/css" href="/static/application/css/power/openwindow.css" />
    <script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
    <script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/application/js/power/tree.js"></script>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">基础权限维护</a></li>
    <li class="active">基础权限维护</li>
</ol>

<div id="light" class="white_content">
    <div style="text-align: center">
        <h2>新增权限代码</h2>
        <form action="/common/savePowerCode.html" method="post" name="addpower" id="addpower">
            <table width="100%">
                    <tr>
                        <td align="right">
                        <input type="hidden" name="powercodeuptakid" id="powercodeuptakid"/>
                        <input type="hidden" name="powercodevalidate" value="1"/>
                        权限名称:</td>
                        <td><input type="text" name="powercodetaskname" id ="powercodetaskname" value="${powercodetaskname}"/><span class="start">*</span></td>
                    </tr>
                    <tr>
                        <td align="right">权限代码:</td>
                        <td><input type="text" name="powercodetaskcode" id = "powercodetaskcode" value="${powercodetaskcode}"/><span class="start">*</span></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <button type="button" onclick="submitForm()" id="subbutton">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" onclick="document.getElementById('light').style.display='none';" id="closebutton">关闭</button>
                        </td>
                    </tr>
            </table>
        </form>
    </div>
</div>
<div class="tree">
    ${menu}
</div>
<script type="text/javascript">

    function addMethod(code){
        document.getElementById('powercodeuptakid').value=code;
        document.getElementById('light').style.display='block';
    }
    function deleteMethod(code){
        if(confirm("确认删除？\n注意：如果当前存在子权限节点，将一并删除！\n注意：如果目前权限下有菜单关联，菜单将会失效！")){
            $.ajax({
                url:"/common/deletepowercode.html",
                data:{
                    code:code
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        alert("删除成功！");
                        window.location.href =  "/common/getallpowercode.html";
                    }else{
                        alert("删除失败！");
                    }
                },
                error:function(){
                    alert("获取数据异常！");
                }
            });

        }
    }
    function submitForm(){
        if(document.getElementById("powercodetaskname").value==''){
            alert("请填写权限值！");
            document.getElementById("powercodetaskname").focus();
            return ;
        }
        if(document.getElementById("powercodetaskcode").value==''){
            alert("请填写权限代码！");
            document.getElementById("powercodetaskcode").focus();
            return;
        }
        document.getElementById('subbutton').style.display = "none";
        $.ajax({
            url:"/common/savePowerCode.html",
            data:$('#addpower').serialize(),// 你的formid
            type:'post',
            cache:false,
            dataType:'json',
            success:function(data) {
                if("success"==data.status){
                    alert("保存成功！");
                    window.location.href =  "/common/getallpowercode.html";
                }else{
                    alert(data.result);
                }
            },
            error:function(){
                alert("获取数据异常！");
            }
        });
    }
</script>
</body>
</html>