<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>欢迎界面</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="<%=request.getContextPath() %>/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/static/css/style.css" />
    <script type="text/javascript" src="<%=request.getContextPath() %>/static/js/jquery-1.11.3.min.js"></script>
    <script src="<%=request.getContextPath() %>/static/frame/bootstrap/js/bootstrap.min.js"></script>
    <style>
        body{background-color:rgba(237,237,237,.2);}

    </style>

</head>
<body>
<div class="welcome-layout">
    <div class="welcome-title">
        <h1>请从新刷新页面</h1>
        <h2>在点击左侧菜单进行相关操作！>>></h2>
    </div>
</div>
</body>
</html>
