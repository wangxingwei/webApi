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

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">用户权限维护</a></li>
    <li class="active">用户权限查询</li>
</ol>
<div   style="width:90%;margin:10px auto;margin-bottom:100px;" >
   <form action="/common/queryuserrole.html" method="post" >
       <input type="hidden" value="query" name="edittype">
       <div class="row">
            <div class="col-sm-2">
                <label>用户名或角色:</label>
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="querystring" name="querystring"
                       placeholder="请输入用户名或角色" >
            </div>
            <div class="col-sm-1">
                <button type="submit" class="btn btn-success" id="search">查询</button>
            </div>
        </div>
    </form>
    <c:if test="${fn:length(userrolevos)>0}">
        <div class="table-responsive" style="margin-top:20px;">
            <table class="table table-hover" >
                <thead>
                <tr>
                    <th>序号</th>
                    <th>用户名</th>
                    <th>角色</th>
                    <th>角色代码</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="container">
                <c:forEach items="${userrolevos}" var="userrolevo" varStatus="_status">
                    <tr>
                        <td>${_status.index+1}</td>
                        <td>${userrolevo[0].username}</td>
                        <td>${userrolevo[1].rolename}</td>
                        <td>${userrolevo[1].rolecode}</td>
                        <td>${userrolevo[2].userrolecreatedate}</td>
                        <td>
                            <button type="button" class="btn btn-warning" onclick="javascript:window.location='/common/showrole.html?editType=query&roleCode=${userrolevo[1].rolecode}'">查看角色权限</button>
                            <button type="button" class="btn btn-info" onclick="javascript:window.location='/common/edituserrole.html?editType=edit&userid=${userrolevo[0].userid}&userName=${userrolevo[0].username}'">编辑用户角色</button>

                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </c:if>
    <c:if test="${fn:length(userrolevos)==0&&edittype == 'query'}">
        查询无数据！
    </c:if>
</div>
</body>
</html>
