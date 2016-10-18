<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品详情</title>
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
    <li class="active">商品详情</li>
</ol>
<div class="page-container">
    <!--商品详情开始-->
    <div class="orderList" id="orderList">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    商品详情
                </div>
            </div>
            <div class="panel-body">
                <ul class="goods_detail">
                    <li>商品编码:SHBXU213</li>
                    <li>商品名称:天成果园 现货进口新鲜水果墨西哥牛油果鳄梨5个江浙沪包邮包邮</li>
                    <li>商品类别:水果</li>
                    <li>商品品牌:墨西哥牛油果鳄梨</li>
                    <li>商品条码:123456231234</li>
                    <li>商品状态:正常</li>
                    <li>商品单价:￥2</li>
                    <li>商品数量:2</li>
                    <li>商品单位:个</li>
                    <li>商品总额:￥8</li>
                    <li>实际支付价格:￥8</li>
                    <li>规格说明:暂无</li>
                </ul>
                商品图片:<img src="/static/images/goods.png" style="width:100px;height:100px;"/>
            </div>
        </div>
    </div>
    <!--商品详情结束-->
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

