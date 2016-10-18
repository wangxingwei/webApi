<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>选择权限</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="/static/application/css/power/style.css" />
    <link rel="stylesheet" type="text/css" href="/static/application/css/power/openwindow.css" />

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="/common/getallmenu.html">菜单维护</a></li>
    <li class="active">选择权限</li>
</ol>
<div class="tree">
    ${menu}
</div>
<button onclick="javascript:history.go(-1)">返回</button>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/application/js/power/tree.js"></script>
<script type="text/javascript">
    function selectPowerCode(uptaskid,powercode,type){
        location.href = "/common/addmenu.html?upmenuid="+uptaskid+"&powerCode="+powercode+"&type="+type;
    }
</script>

</body>
</html>