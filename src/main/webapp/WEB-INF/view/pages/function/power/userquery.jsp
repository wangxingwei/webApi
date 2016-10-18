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
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">用户管理</a></li>
    <li class="active">用户查询</li>
</ol>
<div   style="width:90%;margin:10px auto;margin-bottom:100px;" >
    <form action="/common/queryuser.html" method="post" name="subform" id="subform">
        <input type="hidden" name="edittype" value="query">
        <input type="hidden" name="type" value="1">
        用户名：<input type="text" name="querystring" value="${querystring}" ><input type="submit" value="查询">
    </form>
    <c:if test="${fn:length(saausers)>0}">
    <div class="table-responsive" style="margin-top:20px;">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>序号</th>
                <th>用户名</th>
                <th>状态</th>
                <th>权限管理员</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${saausers}" var="saauser" varStatus="_status">
                <tr>
                    <td>${_status.index+1}</td>
                    <td>${saauser.username}</td>
                    <td>
                        <c:if test="${saauser.userstate ==1 }">
                            有效
                        </c:if>
                        <c:if test="${saauser.userstate !=1 }">
                            无效
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${saauser.usersuperflag ==1 }">
                            是
                        </c:if>
                        <c:if test="${saauser.usersuperflag !=1 }">
                            否
                        </c:if>
                    </td>
                    <td>
                        <a class="btn btn-info" href="/common/menuforward.html?url=/function/power/adduser&param=(userid=${saauser.userid},username=${saauser.username})" class="a_href">编辑</a>
                        <a  class="btn btn-danger" href="javascript:deleteuser(${saauser.userid})" class="a_href">删除</a>
                        <c:if test="${saauser.userstate ==1 }">
                            <a class="btn btn-warning" href="javascript:validuser('${saauser.userid}',0)" class="a_href">标记无效</a>
                        </c:if>
                        <c:if test="${saauser.userstate !=1 }">
                            <a class="btn btn-warning" href="javascript:validuser('${saauser.userid}',1)" class="a_href">标记有效</a>
                        </c:if>
                        <c:if test="${saauser.usersuperflag ==1 }">
                            <a class="btn btn-danger" href="javascript:usersuperflag('${saauser.userid}',0)" class="a_href">取消权限管理员</a>
                        </c:if>
                        <c:if test="${saauser.usersuperflag !=1 }">
                            <a class="btn btn-danger" href="javascript:usersuperflag('${saauser.userid}',1)" class="a_href">提升权限管理员</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
    </c:if>
    <c:if test="${fn:length(saausers)==0&&edittype == 'query'}">
        查询无数据！
    </c:if>
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function deleteuser(userid) {
        if (confirm("确认删除？")) {
            $.ajax({
                url: "/common/deletesaauser.html",
                data: {
                    userid: userid
                },
                type: 'post',
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if ("success" == data) {
                        alert("删除成功！");
                        $("#subform").submit();
                    } else {
                        alert("删除失败！");
                    }
                },
                error: function () {
                    alert("获取数据异常！");
                }
            });
        }
    }
    function validuser(userid,state){
        if (confirm("确认？")) {
            $.ajax({
                url: "/common/updatesaauserstate.html",
                data: {
                    userid: userid,
                    state:state,
                    type:'1'
                },
                type: 'post',
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if ("success" == data) {
                        alert("操作成功！");
                        $("#subform").submit();
                    } else {
                        alert("操作失败！");
                    }
                },
                error: function () {
                    alert("获取数据异常！");
                }
            });
        }
    }
    function usersuperflag(userid,state){
        if (confirm("确认？")) {
            $.ajax({
                url: "/common/updatesaauserstate.html",
                data: {
                    userid: userid,
                    state:state,
                    type:'2'
                },
                type: 'post',
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if ("success" == data) {
                        alert("操作成功！");
                        $("#subform").submit();
                    } else {
                        alert("操作失败！");
                    }
                },
                error: function () {
                    alert("获取数据异常！");
                }
            });
        }
    }
</script>
</body>
</html>
