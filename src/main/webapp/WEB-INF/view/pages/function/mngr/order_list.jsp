<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>订单管理</title>
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
    <li class="active">订单查询</li>
</ol>
<div class="page-container">
    <form action="/hm/mngr/orderquery.html" method="post" id="orderqueryform">
    <div class="row">
        <div class="col-sm-2 col-lg-1">
            <label>订单号:</label>
        </div>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="orderId" name="orderId"
                   placeholder="请输入订单号" value="${orderId}" >
        </div>
        <label class="col-sm-2 col-lg-1 control-label">状态:</label>
        <div class="col-sm-2">
            <select class="form-control" name="orderState" id="orderState">
                <option value="" >请选择订单状态</option>
                <option value="1" <c:if test="${orderState==1}">selected</c:if>>待支付</option>
                <option value="2" <c:if test="${orderState==2}">selected</c:if>>待发货</option>
                <option value="3" <c:if test="${orderState==3}">selected</c:if>>待确认收货</option>
                <option value="4" <c:if test="${orderState==4}">selected</c:if>>待评价</option>
                <option value="5" <c:if test="${orderState==5}">selected</c:if>>完成</option>
            </select>
        </div>
        <div class="col-sm-2 col-lg-1">
            <label>商品名称:</label>
        </div>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="goodsname" name="goodsname"
                   placeholder="请输入商品名称" value="${goodsname}" >
        </div>
        <%--<div class="col-sm-1">
            <button type="submit" class="btn btn-success" >查询</button>
        </div>--%>
     </div>
    <div class="row margin_top10">

         <div class="col-sm-2 col-lg-1">
             <label>客户姓名:</label>
         </div>
         <div class="col-sm-2">
             <input type="text" class="form-control" id="" name=""
                    placeholder="请输入客户姓名" value="" >
         </div>
         <div class="col-sm-2 col-lg-1">
             <label>下单时间:</label>
         </div>
         <div class="col-sm-2">
             <input type="text" placeholder="请输入下单日期"  class="timeinput form-control"  onclick="SelectDate(this,'yyyy-MM-dd')">
         </div>
        <div class="col-sm-1">
            <button type="submit" class="btn btn-success" >查询</button>
        </div>
    </div>
    </form>
    <div class="margin_top20 margin_bottom10">
        <input type="checkbox" id="checkAll"/>全选</th>&nbsp;&nbsp;<button type="button" class="btn btn-danger" id="delete_btn">删除</button>
    </div>
    <!--订单列表开始-->
    <div class="orderList" id="orderList">
        <c:if test="${fn:length(hmorders)>0}">
            <c:forEach items="${hmorders}" var="hmorder" varStatus="_status">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <input type="checkbox" value="${hmorder.orderid}"/>&nbsp;${hmorder.orderdate} &nbsp;&nbsp;
                            订单号:<a href="/common/menuforward.html?url=/function/mngr/order_detail">${hmorder.ordercode}</a>
                            &nbsp;&nbsp;订单状态:
                            <c:if test="${hmorder.orderstate==1}">待支付</c:if>
                            <c:if test="${hmorder.orderstate==2}">待发货</c:if>
                            <c:if test="${hmorder.orderstate==3}">待确认收货</c:if>
                            <c:if test="${hmorder.orderstate==4}">待评价</c:if>
                            <c:if test="${hmorder.orderstate==5}">完成</c:if> &nbsp;&nbsp;收货人:${hmorder.orderbuyer} &nbsp;&nbsp;总计:¥ ${hmorder.orderrealpay}
                            <a href="/hm/mngr/showorder.html?orderid=${hmorder.orderid}" class="float_right"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>订单详情</a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <!--商品列表-->
                        <div class="table-responsive">
                            <table class="table" >
                                <thead>
                                <tr>
                                    <th >序号</th>
                                    <th>商品名称</th>
                                    <th>商品类别</th>
                                    <th>数量</th>
                                    <th>单价</th>
                                    <th>总价</th>
                                    <th>详情</th>

                                </tr>
                                </thead>
                                <tbody id="container">
                                <c:forEach items="${hmorder.hmorderdetailList}" varStatus="_detail_status" var="hmorderdetail">
                                    <tr>
                                        <td><span class="orderSpan">${_detail_status.index+1}</span></td>
                                        <td><a href="/hm/page/addgoods.html?goodsid=${hmorderdetail.goodsid}&type=1" class="goodsName">${hmorderdetail.orderdetailgoodsname}</a></td>
                                        <td><span class="orderSpan">${hmorderdetail.orderdetailgoodstypename}</span></td>
                                        <td><span class="orderSpan">${hmorderdetail.orderdetailgoodscount}</span></td>
                                        <td><span class="orderSpan">${hmorderdetail.orderdetailgoodsprice}</span></td>
                                        <td><span class="orderSpan">${hmorderdetail.orderdetailgoodstotalprice}</span></td>
                                        <td><a href="/hm/page/addgoods.html?goodsid=${hmorderdetail.goodsid}&type=1" class="goodsName">详情</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                           </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>

        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/mngr/orderquery.html"></w:pager>

    </div>
    <!--订单列表结束-->

</div>

<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js" ></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>
<script type="text/javascript">
    $(function(){
        //全选
        checkedAll("checkAll","orderList");//全选按钮的ID,内容列表容器ID
        deleteFn("delete_btn","orderList","/hm/mngr/deleteorder.html");//删除按钮ID,内容列表容器ID,删除的请求路径
    })
    function  callback(){
        $("#orderqueryform").submit();
    }
</script>
</body>
</html>

