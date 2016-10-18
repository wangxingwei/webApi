<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增菜单</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
    <script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">用户管理</a></li>
    <li class="active">新增用户</li>
</ol>
<div   style="width:90%;margin:50px auto;margin-bottom:100px;" >
    <form role="form" method="post" action="/common/savesaauser.html" >
        <input type="hidden" name="edittype" value="query">
        <input type="hidden" name="userid" value="${userid}">
        <input type="hidden" name="userstate" value="1">
        <input type="hidden" name="usersuperflag" value="1">
        <div class="form-group">
            <label class="control-label" for="username">用户名:</label>
            <input type="text" class="form-control" id="username" name="username" value="${username}" required placeholder="请输入用户名"/>
        </div>
        <div class="form-group">
            <label class="control-label" for="userpassword">密码(默认:123456):</label>
                <input type="text" class="form-control" id="userpassword" name="userpassword" value="${userpassword}"  placeholder="请输入密码"/>
        </div>
        <button type="submit" class="btn btn-primary"> 提交 </button>

    </form>
</div>
</body>
</html>
