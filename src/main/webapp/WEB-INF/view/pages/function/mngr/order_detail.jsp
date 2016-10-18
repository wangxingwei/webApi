<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>订单详情</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="/common/menuforward.html?url=/function/mngr/order_list">订单列表</a></li>
    <li class="active">订单详情</li>
</ol>
<div class="page-container">

    <!--订单详情开始-->
    <div class="orderList" id="orderList">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    订单详情
                </div>
            </div>
            <div class="panel-body">
                <ul>
                    <li>订单编号:${hmorder.ordercode}</li>
                    <li>下单时间:2015-10-20 12:11:10</li>
                    <li>订单状态:
                        <c:if test="${hmorder.orderstate==1}">待支付</c:if>
                        <c:if test="${hmorder.orderstate==2}">待发货</c:if>
                        <c:if test="${hmorder.orderstate==3}">待确认收货</c:if>
                        <c:if test="${hmorder.orderstate==4}">待评价</c:if>
                        <c:if test="${hmorder.orderstate==5}">完成</c:if></li>
                    <li class="order_title">收货信息：</li>
                    <li>收货码:${hmorder.orderbuyercode}</li>
                    <li>收货人:${hmorder.orderbuyer}</li>
                    <li>收货地址:${hmorder.orderaddress}</li>
                    <li>收货人联系方式:${hmorder.orderbuyermobile}</li>
                    <li>收货时间:${hmorder.orderreceivedate}</li>
                    <li class="order_title">付款信息：</li>
                    <li>付款方式: <c:if test="${hmorder.orderpaytype==1}">支付宝</c:if>
                        <c:if test="${hmorder.orderpaytype==2}">微信</c:if>
                        <c:if test="${hmorder.orderpaytype==3}">银联刷卡</c:if>
                        <c:if test="${hmorder.orderpaytype==4}">现金</c:if>
                        <c:if test="${hmorder.orderpaytype==5}">其他</c:if></li>
                    <li>商品数量:￥${hmorder.ordergoodscount}</li>
                    <li>商品总价:￥${hmorder.ordertotalprice}</li>
                    <li>优惠价格:￥${hmorder.orderfavorprice}</li>
                    <li>实际支付:￥${hmorder.orderrealpay}</li>
                    <li>支付时间:${hmorder.orderpaydate}</li>
                    <li class="order_title">发货信息：</li>
                    <li>发货人:${hmorder.ordersender}</li>
                    <li>发货地址:${hmorder.orderaddress}</li>
                    <li>发货人联系方式:${hmorder.ordersendmobile}</li>
                    <li>发货时间:${hmorder.ordersenddate}</li>
                    <li class="order_title">商品信息：</li>
                </ul>
                <!--商品列表-->
                <div class="table-responsive">
                    <table class="table" >
                        <thead>
                        <tr>
                            <th>商品名称</th>
                            <th>商品类别</th>
                            <th>数量</th>
                            <th>单价</th>
                            <th>总价</th>

                        </tr>
                        </thead>
                        <tbody id="container">
                        <c:forEach items="${hmorder.hmorderdetailList}" varStatus="_detail_status" var="hmorderdetail">
                            <tr>
                                <td><a href="/hm/page/addgoods.html?goodsid=${hmorderdetail.goodsid}&type=1" class="goodsName">${hmorderdetail.orderdetailgoodsname}</a></td>
                                <td><span class="orderSpan">${hmorderdetail.orderdetailgoodstypename}</span></td>
                                <td><span class="orderSpan">${hmorderdetail.orderdetailgoodscount}</span></td>
                                <td><span class="orderSpan">${hmorderdetail.orderdetailgoodsprice}</span></td>
                                <td><span class="orderSpan">${hmorderdetail.orderdetailgoodstotalprice}</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                   </div>
            </div>
        </div>


    </div>
    <!--订单详情结束-->

</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

