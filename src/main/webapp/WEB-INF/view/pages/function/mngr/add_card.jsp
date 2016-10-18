<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>套餐添加</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />
    <style>
        .customer-table th{background:#eee;}
    </style>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="/common/menuforward.html?url=/function/mngr/card_manage">卡券管理</a></li>
    <li class="active">卡券添加</li>
</ol>
<div class="page-container">
    <form action="/hm/card/saveOrUpdateCoupons.html" method="post" enctype="multipart/form-data" id="form1">
        <div class="search-layout clearfix">
            <label>卡券ID:</label>
            <input type="hidden"   name="couponsid" value="${hmcoupons.couponsid}" class="form-control">
            <input type="text"   name="couponsidview" value="${hmcoupons.couponsid}" class="form-control" disabled>
        </div>
        <div class="search-layout clearfix">
            <label>卡券类型:</label>
            <select name="couponstypeid" class="form-control float_left" required>
                <c:forEach  items="${hmcouponstypes}" var="type">
                    <option value="${type.couponstypeid}" ${hmcouponstype.couponstypeid==type.couponstypeid?"selected":""}>${type.couponstypename}</option>
                </c:forEach>

            </select>
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>卡券额度:</label>
            <input type="text" placeholder="请输入卡券额度"  name="couponsmoney" value="${hmcoupons.couponsmoney}" class="form-control" required pattern="\d+(\.\d{1,2})?" title="请输入数字，保留两位小数">元
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>使用额度:</label>
            <input type="text" placeholder="请输入使用额度"  name="couponsstartmoney" value="${hmcoupons.couponsstartmoney}" class="form-control" required pattern="\d+(\.\d{1,2})?" title="请输入数字，保留两位小数">元
        </div>
        <div class="search-layout clearfix">
            <label>有效期:</label>
            <input type="text" placeholder="请输入开始日期"  required class="timeinput form-control" name="couponsstartdate" value="<fmt:formatDate value="${hmcoupons.couponsstartdate}" pattern="yyyy-MM-dd"></fmt:formatDate>" onclick="SelectDate(this,'yyyy-MM-dd')">
            <label style="text-align:center;">&nbsp;~&nbsp;</label>
            <input type="text" placeholder="请输入结束日期"  required name="couponsenddate" value="<fmt:formatDate value="${hmcoupons.couponsenddate}" pattern="yyyy-MM-dd"></fmt:formatDate>" class="timeinput form-control"   onclick="SelectDate(this,'yyyy-MM-dd')">

        </div>

        <div class="search-layout clearfix margin_top10">
            <label>图片:</label>
            <input type="file" value="" name="image"/>
            <c:if test="${hmcoupons.couponsPic  != null}">
                <img src="${hmcoupons.couponsPic}" style="width:50px;height:50px;"/>
            </c:if>
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>活动备注:</label>
            <textarea  name="couponsNote" style="width:700px;height:200px;border:1px solid #ccc;" >
                ${hmcoupons.couponsNote}
            </textarea>

        </div>
        <div class="margin_top20 margin_bottom20">
            <button type="submit" class="btn btn-primary" id="submitBtn" style="width:150px;margin-left:80px;">保存</button>
        </div>
    </form>

</div>


<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>


</body>
</html>

