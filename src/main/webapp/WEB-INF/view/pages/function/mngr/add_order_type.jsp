<%@ page import="java.util.Date" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>新增订单类型</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="/static/css/style.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<ol class="breadcrumb">
  <li><a href="javascript:void(0)">首页</a></li>
  <li><a href="/hm/mngr/orderManageController/orderTypeManager.html">APP订单类型</a></li>
  <li class="active">添加订单类型</li>
</ol>

<div   style="width:90%;margin:50px auto;margin-bottom:100px;" >
  <form class="form-horizontal" role="form" method="post" action="/hm/mngr/orderManageController/saveOrderType.html"  enctype="multipart/form-data">
    <input type="hidden" name="id" value="${orderManage.id}"/>

    <div class="form-group">
      <label class="col-sm-2 control-label" for="orderName"><span class="start">*</span>名称:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="orderName" name="orderName" value="${orderManage.orderName}" required placeholder="请输入订单类型名称"/>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="orderType"><span class="start">*</span>订单类型:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="orderType" name="orderType" value="${orderManage.orderType}" required placeholder="请输入订单类型"/>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2  control-label" for="orderState"><span class="start">*</span>状态:</label>
      <div class="col-sm-10">
        <select class="col-sm-10 form-control" name="orderState" id="orderState" required>
          <option value="1" <c:if test="${orderManage.orderState != '2'}">selected</c:if>>开启</option>
          <option value="2" <c:if test="${orderManage.orderState == '2'}">selected</c:if>>关闭</option>
        </select>
      </div>
    </div>


    <div class="form-group">
      <label class="col-sm-2 control-label" for="typeImage">商品图片：</label>
      <div class="col-sm-4">
        <c:if test="${orderManage.orderImag!=''}">
          <img src="${orderManage.orderImag}" width="25px" height="25px">
        </c:if>
      </div>
      <div class="col-sm-10">
          <input type="file" class="form-control" id="typeImage" name="typeImage" >
      </div>
    </div>


    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-2 col-xs-8 col-xs-offset-4">
        <button type="submit" class="btn btn-primary" style="width:100px;height:40px;">提&nbsp;&nbsp;交</button>
      </div>
    </div>
  </form>

</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>
</body>
</html>
