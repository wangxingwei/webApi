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
    <li class="active">未审核</li>
</ol>
<div class="page-container">
    <form method="post" action="/hm/page/marketCateList.html?type=0&branchId=3" id="formid"></form>
    <div class="table-responsive">
        <c:if test="${fn:length(marketCateList)>0}">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                        <%-- <th>商超品类ID</th>--%>
                    <th>商超ID</th>
                    <th>商超名称</th>
                    <th>品类ID</th>
                    <th>品类名称</th>
                    <th>审核</th>
                </tr>
                </thead>
                <tbody id="container">
                <c:forEach items="${marketCateList}" var="marketcate" varStatus="_status">
                    <tr>
                        <td>${_status.count}</td>
                            <%--<td>${marketcate.marketcateid}</td>--%>
                        <td>${marketcate.marketid}</td>
                        <td>${marketcate.marketname}</td>
                        <td>${marketcate.cateid}</td>
                        <td>${marketcate.catename}</td>
                        <td>
                            <button type="button" class="btn btn-info" onclick="pass(${marketcate.marketcateid})">通过
                            </button>
                            <button type="button" class="btn btn-danger" onclick="reject(${marketcate.marketcateid})">
                                驳回
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

        <w:pager pageNo="${pageNo}" recordCount="${totalCount}"
                 url="/hm/page/marketCateList.html?type=0&branchId=3"></w:pager>

    </div>
</div>

<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js"></script>

<script type="text/javascript">

    /*审核：通过*/
    function pass(id) {
        if (confirm("确认通过")) {
            $.ajax({
                url: "/hm/mngr/updateAuditMarketCate.html",
                data: {
                    marketCateId: id,
                    type: 1
                },
                type: 'post',
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if ("success" == data) {
                        alert("操作成功！");
                        $("#formid").submit();
                    } else {
                        alert("审核失败！");
                    }
                },
                error: function () {
                    alert("获取数据异常！");
                }
            });
        }
    }

    /*审核：驳回*/
    function reject(id) {
        if (confirm("确认驳回")) {
            $.ajax({
                url: "/hm/mngr/updateAuditMarketCate.html",
                data: {
                    marketCateId: id,
                    type: 2
                },
                type: 'post',
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if ("success" == data) {
                        alert("操作成功！");
                        $("#formid").submit();
                    } else {
                        alert("审核失败！");
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

