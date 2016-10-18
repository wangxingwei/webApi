<%@ page import="java.util.Date" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>添加商品</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="/static/css/style.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<ol class="breadcrumb">
  <li><a href="javascript:void(0)">首页</a></li>
  <li><a href="/hm/mngr/goods/takeawayGoodsManager.html">餐饮商品管理</a></li>
  <li class="active">添加商品</li>
</ol>
<p align="right"><button type="button" class="btn btn-info"
           onclick="javascript:window.location='/hm/mngr/goods/takeawayGoodsManager.html'">
  关闭</button></p>
<div   style="width:90%;margin:50px auto;margin-bottom:100px;" >
  <form class="form-horizontal" role="form" method="post" action="/hm/mngr/goods/saveTakeawayGoods.html"  enctype="multipart/form-data">
    <input type="hidden" name="ldGoodId" value="${hmtakeawaygoods.ldGoodId}"/>

    <div class="form-group">
      <label class="col-sm-2 control-label" for="ldGoodName"><span class="start">*</span>商品名称:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="ldGoodName" name="ldGoodName" value="${hmtakeawaygoods.ldGoodName}" required placeholder="请输入商品名称"/>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2  control-label" for="ldGoodType"><span class="start">*</span>商品类别:</label>
      <div class="col-sm-10">
        <select class="col-sm-10 form-control" name="ldGoodType" id="ldGoodType" required>
          <option value="LD" <c:if test="${hmtakeawaygoods.ldGoodType == 'LD'}">selected</c:if>>外卖</option>
          <option value="BF" <c:if test="${hmtakeawaygoods.ldGoodType != 'LD'}">selected</c:if>>早餐</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2  control-label" for="ldGoodPrice"><span class="start">*</span>商品价格:</label>
      <div class="col-sm-10">
        <input type="text" class="col-sm-10 form-control" id="ldGoodPrice" name="ldGoodPrice" value="${hmtakeawaygoods.ldGoodPrice}" pattern="\d{1,}(\.\d{1,2})?" title="请输入整数或保留两位小数" required placeholder="请输入商品单价" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2  control-label" for="ldGoodsOriginalPrice"><span class="start">*</span>商品原价格:</label>
      <div class="col-sm-10">
        <input type="text" class="col-sm-10 form-control" id="ldGoodsOriginalPrice" value="${hmtakeawaygoods.ldGoodsOriginalPrice}" name="ldGoodsOriginalPrice" pattern="\d{1,}(\.\d{1,2})?" title="请输入整数或保留两位小数" required placeholder="请输入商品单价" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2  control-label" for="idGoodsUnitName">商品单位:</label>
      <div class="col-sm-10">
        <input type="text" class="col-sm-10 form-control" value="${hmtakeawaygoods.idGoodsUnitName}" id="idGoodsUnitName" name="idGoodsUnitName"  placeholder="请输入商品单位"/>
      </div>
    </div>

  <div class="form-group">
    <label class="col-sm-2  control-label" for="specification">规格:</label>
   <div class="col-sm-10">
     <input type="text" class="col-sm-10 form-control" value="${hmtakeawaygoods.specification}" id="specification" name="specification"  placeholder="请输入规格"/>
   </div>
  </div>

    <div class="form-group">
      <label class="col-sm-2 control-label" for="typeImage">商品图片：</label>
      <div class="col-sm-4">
      <c:if test="${hmtakeawaygoods.ldGoodsPicSrc!=''}">
        <img src="${hmtakeawaygoods.ldGoodsPicSrc}" width="25px" height="25px">
      </c:if>
      </div>
      <div class="col-sm-10">
      <input type="file" class="form-control" id="typeImage" name="typeImage" >
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2  control-label" for="ldGoodsGroup"><span class="start">*</span>商品分组:</label>
      <div class="col-sm-10">
        <select class="col-sm-10 form-control" name="ldGoodsGroup" id="ldGoodsGroup" required>
          <option value="0"
                  <c:if test="${ hmtakeawaygoods.ldGoodsGroup=='0'}">selected</c:if>
                    >请选择</option>
          <option value="10"
                  <c:if test="${hmtakeawaygoods.ldGoodsGroup=='10'}">selected</c:if>
                  >连锁店</option>
          <option value="20"
                  <c:if test="${hmtakeawaygoods.ldGoodsGroup=='20'}">selected</c:if>
                  >一碗汤面</option>
        </select>
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
<script type="text/javascript">
  function addNew(){
    var areaDiv = document.getElementById("treeTemplate").innerHTML;
    $("#form-container").append(areaDiv);
  }
  function deleteNew(obj){
    $(obj).parent().parent().remove();
  }
</script>
<script type="text/template" id="treeTemplate">
  <div class="form-group">
    <label class="col-sm-2 control-label" >添加图片(400*400):</label>
    <div class="col-sm-4 col-md-3 col-lg-2">
      <input type="hidden" name="goodsimageurl">
      <input type="file" name="goodsImage">
    </div>
    <div class="col-sm-2">
      <button type="button" class="btn btn-danger" onclick="deleteNew(this)">删除</button>
    </div>
  </div>
</script>
</body>
</html>
