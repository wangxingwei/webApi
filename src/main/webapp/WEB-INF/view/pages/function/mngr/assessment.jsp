<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>订单评价</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">订单管理</a></li>
    <li class="active">订单评价</li>
</ol>
<div class="page-container">
    <div class="row">
        <form action="/hm/mngr/orderevaquery.html" method="post" id="queryid">
            <div class="col-sm-1">
                <label>评论者:</label>
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" id="userloginname" name="userloginname"
                       placeholder="请输入评论者" value="${userloginname}" >
            </div>
            <div class="col-sm-1">
                <label>订单号:</label>
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" id="orderCode" name="orderCode"
                       placeholder="请输入订单编号" value="${orderCode}" >
            </div>
            <div class="col-sm-1">
                <label>关键字:</label>
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" id="orderevacontext" name="orderevacontext"
                       placeholder="请输入评价关键字" value="${orderevacontext}" >
            </div>
            <div class="col-sm-3">
                <button type="submit" class="btn btn-success">查询</button>
                <button type="button" class="btn btn-danger" id="delete_btn">删除</button>
            </div>
        </form>
    </div>
    <div class="table-responsive margin_bottom100" >
        <table class="table table-hover" >
            <thead>
            <tr>
                <th width="6%"><input type="checkbox" id="checkAll"/>全选</th>
                <th width="85%">评价内容</th>
                <th width="9%">操作</th>
            </tr>
            </thead>
            <tbody id="container">
                <c:forEach items="${hmorderevas}" var="hmordereva" varStatus="_status">
                    <tr>
                        <td><input type="checkbox" value="${hmordereva.orderevaid}"/></td>
                        <td>
                            <div class="feedback">
                                <div class="feedback-content">

                                    <div class="start">星级：
                                        <c:if test="${hmordereva.orderevalevel>0}">
                                            <c:forEach begin="1" end="${hmordereva.orderevalevel}" >
                                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                            </c:forEach>
                                        </c:if>


                                    </div>
                                   ${hmordereva.orderevacontext}
                                </div>
                                <div class="feedback-footer float_left">
                                    <span>评论者: ${hmordereva.hmorder.hmuser.userloginname}</span><span>评价时间:${hmordereva.orderevadate}</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <a href="/hm/mngr/showorder.html?orderid=${hmordereva.hmorder.orderid}" class="float_right"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>订单详情</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/mngr/orderevaquery.html"></w:pager>

    </div>
</div>


<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js" ></script>
<script type="text/javascript">

    $(function(){
        //全选
        checkedAll("checkAll","container");//全选按钮的ID,内容列表容器ID
        deleteFn("delete_btn","container","/hm/mngr/deleteordereva.do");//删除按钮ID,内容列表容器ID,删除的请求路径
    })
    function callback(){
        $("#queryid").submit();
    }
</script>
</body>
</html>

