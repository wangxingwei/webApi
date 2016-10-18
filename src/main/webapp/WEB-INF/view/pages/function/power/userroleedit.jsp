<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>角色查询</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
    <script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
    <style>
        .roleList{border:0px solid #ccc;padding:20px 0px;}
        .roleList button{margin-top:20px;margin-left:10%;width:100px;}
        .roleList tr{height:30px;}
        .roleList td{padding-left:10px;}
        .roleList .title{font-weight:bold;}
    </style>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">用户权限维护</a></li>
    <li class="active">配置权限</li>
</ol>
<div   style="width:90%;margin:10px auto;margin-bottom:100px;" >
    <div class="panel panel-default">
        <div class="panel-body">
            <form action="/common/saveuserrole.html" method="post">
                <div class="roleList">
                    <table width="100%">

                        <tr>
                            <td align="right" class="title" width="10%"> 用户名：<input type="hidden" value="${userid}" name="userid"></td>
                            <td align="left" width="90%">${userName}<input type="hidden" name="userName" value="${userName}" ></td>
                        </tr>
                        <tr>
                            <td  align="right" class="title">勾选角色列表：</td>
                            <td align="left">${rolemap}</td>
                        </tr>
                    </table>
                    <c:if test="${edittype!='query'}">
                        <button type="submit" class="btn btn-primary" >提交</button>
                    </c:if>
                </div>

            </form>
        </div>
    </div>

</div>
</body>
</html>
