<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增分类</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
    <script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="/hm/mngr/goodstypequery.html">商品分类管理</a></li>
    <li class="active">新增分类</li>
</ol>

<div   style="width:90%;margin:50px auto;">
        <form role="form" method="post" action="/hm/mngr/savegoodstype.html" enctype="multipart/form-data">
            <input type="hidden" name="goodstypeid" value="${hmgoodstype.goodstypeid}"/>
            <input type="hidden" name="goodstypepicurl" value="${hmgoodstype.goodstypepicurl}"/>
            <div class="form-group">
                <label for="goodstypetypecode"><span class="start">*</span>类别代码：</label>
                <input type="text" class="form-control" value="${hmgoodstype.goodstypetypecode}" id="goodstypetypecode" name="goodstypetypecode" required placeholder="请输入类别代码">
            </div>
            <div class="form-group">
                <label for="goodstypetypename"><span class="start">*</span>类别名称：</label>
                <input type="text" class="form-control" id="goodstypetypename" name="goodstypetypename" value="${hmgoodstype.goodstypetypename}" required placeholder="请输入类别名称">
            </div>
            <div class="form-group">
                <label for="goodstypedescribe">类别描述：</label>
                <input class="form-control" id="goodstypedescribe" name="goodstypedescribe" value="${hmgoodstype.goodstypedescribe}"  pattern="[\u4e00-\u9fa5\、]{1,6}" title="请输入汉字，不多于6个字" placeholder="请输入类别描述" />
            </div>
            <div class="form-group">
                <label for="goodstypeflag">类别标志：</label>
                <select class="form-control" name="goodstypeflag" id="goodstypeflag" required>
                    <option value="">请选择类别标志</option>
                    <option value="0" <c:if test="${hmgoodstype.goodstypeflag eq '0'}">selected</c:if>>普通品类</option>
                    <option value="1" <c:if test="${hmgoodstype.goodstypeflag eq '1'}">selected</c:if>>特价品类</option>
                </select>
            </div>
            <div class="form-group">
                <label for="goodstypetypesort"><span class="start">*</span>排序：</label>
                <c:choose>
                    <c:when test="${hmgoogstype.goodstypeid eq ''}">
                        <input type="text" class="form-control" id="goodstypetypesort" name="goodstypetypesort"
                               value="0" pattern="\d+"
                               title="请输入整数" required placeholder="请输入序号">
                    </c:when>
                    <c:otherwise>
                        <input type="text" class="form-control" id="goodstypetypesort" name="goodstypetypesort"
                               value="${hmgoodstype.goodstypetypesort}" pattern="\d+"
                               title="请输入整数" required placeholder="请输入序号">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="form-group">
                <label for="goodstypedescribe">首页推荐：</label>
                <input type="radio" name="goodstypeshowindex" value="1" <c:if test="${hmgoodstype.goodstypeshowindex==1}">checked</c:if>>是
                <input type="radio" name="goodstypeshowindex" value="0" <c:if test="${hmgoodstype.goodstypeshowindex!=1}">checked</c:if>>否
            </div>
            <div class="form-group">
                <label >是否开启：</label>
                <input type="radio" name="goodstypestate" value="1" <c:if test="${hmgoodstype.goodstypestate==1}">checked</c:if>>是
                <input type="radio" name="goodstypestate" value="0" <c:if test="${hmgoodstype.goodstypestate!=1}">checked</c:if>>否
            </div>
            <div class="form-group">
                <label for="typeImage">类别图片(150*150)：</label>
                <c:if test="${hmgoodstype.goodstypepicurl!=''}">
                    <img src="${hmgoodstype.goodstypepicurl}" width="25px" height="25px">
                </c:if>
                <input type="file" class="form-control" id="typeImage" name="typeImage">
            </div>
           <button type="submit" class="btn btn-primary" id="btn-submit"> 提交 </button>

        </form>

</div>

</body>
</html>
