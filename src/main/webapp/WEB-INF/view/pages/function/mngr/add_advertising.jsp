<%@ page import="java.util.Date" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>广告编辑</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="/static/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<ol class="breadcrumb">
  <li><a href="javascript:void(0)">首页</a></li>
  <li><a href="/hm/page/admanager.html">广告管理</a></li>
  <li class="active">广告编辑</li>
</ol>

<div   style="width:90%;margin:50px auto;margin-bottom:100px;" >

  <form class="form-horizontal" role="form" method="post" action="/hm/page/saveads.html"  enctype="multipart/form-data">

    <input type="hidden" name="adid" value="${ads.adid}"/>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="adtitle">广告标题:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="adtitle" name="adtitle" value="${ads.adtitle}"  placeholder="请输入广告标题"/>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-2  control-label" for="adsate"><span class="start">*</span>广告状态:</label>
      <div class="col-sm-10">
        <select class="col-sm-10 form-control" name="adsate" id="adsate" required>
          <option value="0" <c:if test="${ads.adsate == '0'}">selected</c:if>>无效</option>
          <option value="1" <c:if test="${ads.adsate != '0'}">selected</c:if>>有效</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-2  control-label" for="webviewurl">跳转url:</label>
      <div class="col-sm-10">
        <input type="text" class="col-sm-10 form-control" id="webviewurl" name="webviewurl" value="${ads.webviewurl}"   placeholder="请输入跳转url" />
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-2  control-label" for="adcontext">广告内容:</label>
      <div class="col-sm-10">
        <input type="text" class="col-sm-10 form-control" id="adcontext" name="adcontext" value="${ads.adcontext}"   placeholder="请输入广告内容" />
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-2 control-label" for="adimageurlfile"><span class="start">*</span>图片：</label>
      <div class="col-sm-4">
        <c:if test="${ads.adimageurl!=''}">
          <img src="${ads.adimageurl}" width="25px" height="25px">
        </c:if>
      </div>
      <div class="col-sm-10">
        <input type="file" class="form-control" id="adimageurlfile" name="adimageurlfile"
          <%--<c:if test="${ads.id==null}">--%>
            <%--required--%>
          <%--</c:if>--%>
                >
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
