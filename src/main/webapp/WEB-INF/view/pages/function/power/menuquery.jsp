<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>菜单维护</title>
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
    <li><a href="javascript:void(0)">菜单维护</a></li>
    <li class="active">菜单维护</li>
</ol>
<div class="alert alert-warning" role="alert">
    <h4>新增菜单主要只针对系统外部扩展菜单，因系统内菜单可能涉及系统升级，为确保系统稳定，目前暂不提供修改权限！</h4>
</div>

<div class="tree">
    ${menu}
</div>
<script type="text/javascript">

    function addMethod(code){
        location.href="/common/getallpowercodeformenuadd.html?upmenuid="+code;
    }
    function editMethod(code){
        location.href="/common/getallpowercodeformenuedit.html?menuid="+code;
    }
    function deleteMethod(code){
        if(confirm("确认删除？\n注意：如果当前存在子菜单节点，将一并删除！")){
            $.ajax({
                url:"/common/deletemenu.html",
                data:{
                    menuid:code
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        alert("删除成功！");
                        window.location.href =  "/common/getallmenu.html";
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
</script>
</body>
</html>