<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>未审核</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css"/>
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">商超品类审核管理</a></li>
    <li class="active">已审核</li>
</ol>
<div class="page-container">
    <%--    <form method="post" action="/hm/page/marketCateList.html?type=1&branchId=3" id="formid"></form>--%>
    <div class="table-responsive">
        <c:if test="${fn:length(marketCateList)>0}">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>商超ID</th>
                    <th>商超名称</th>
                    <th>品类ID</th>
                    <th>品类名称</th>
                    <th>审核状态</th>
                </tr>
                </thead>
                <tbody id="container">
                <c:forEach items="${marketCateList}" var="marketcate" varStatus="_status">
                    <tr>
                        <td>${_status.count}</td>
                        <td>${marketcate.marketid}</td>
                        <td>${marketcate.marketname}</td>
                        <td>${marketcate.cateid}</td>
                        <td>${marketcate.catename}</td>
                        <td>
                            <c:if test="${marketcate.stateflag eq '1'}">通过</c:if>
                            <c:if test="${marketcate.stateflag eq '2'}">驳回</c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <w:pager pageNo="${pageNo}" recordCount="${totalCount}"
                 url="/hm/page/marketCateList.html?type=1&branchId=3"></w:pager>
    </div>
</div>
</body>
</html>

