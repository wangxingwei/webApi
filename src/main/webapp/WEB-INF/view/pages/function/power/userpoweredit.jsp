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
    <li class="active">新增用户权限</li>
</ol>
<div   style="width:90%;margin:10px auto;margin-bottom:100px;" >
    <form action="/common/queryuser.html" method="post" >
        <input type="hidden" value="query" name="edittype">
        <div class="row">
            <div class="col-sm-1">
                <label>用户名:</label>
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="query" name="query"
                       placeholder="请输入用户名" >
            </div>
            <div class="col-sm-1">
                <button type="submit" class="btn btn-success" id="search">查询</button>
            </div>
        </div>
    </form>
    <%--<form action="/common/queryuser.html" method="post">
        <input type="hidden" name="edittype" value="query">
        用户名：<input type="text" name="query" ><input type="submit" value="查询">
    </form>--%>
      <c:if test="${fn:length(saausers)>0}">
    <div class="table-responsive" style="margin-top:20px;">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>序号</th>
                <th>用户名</th>
                <th>操作</th>
            </tr>
            </thead>
              <tbody>
              <c:forEach items="${saausers}" var="saauser" varStatus="_status">
                  <tr>
                      <td>${_status.index+1}</td>
                      <td>${saauser.username}</td>
                      <td><a class="btn btn-info" href="/common/edituserrole.html?editType=query&userid=${saauser.userid}&userName=${saauser.username}" class="a_href">配置权限</a></td>
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
</body>
</html>
