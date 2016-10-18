<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增商品</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/style.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="/hm/page/goodslist.html">商品管理</a></li>
    <li class="active">新增商品</li>
</ol>

<div   style="width:90%;margin:50px auto;margin-bottom:100px;" >
        <form class="form-horizontal" role="form" method="post" action="/hm/mngr/savegoods.html"  enctype="multipart/form-data">
            <input type="hidden" name="goodsid" value="${hmgoods.goodsid}"/>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="goodscode"><span class="start">*</span>商品编码:</label>
                <div class="col-sm-10">
                    <input type="text" class="col-sm-10 form-control" id="goodscode" name="goodscode" value="${hmgoods.goodscode}" required placeholder="请输入商品编码"/>
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="goodsname"><span class="start">*</span>商品名称:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="goodsname" name="goodsname" value="${hmgoods.goodsname}" required placeholder="请输入商品名称"/>
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-2  control-label" for="goodsname"><span class="start">*</span>商品类别:</label>
                <div class="col-sm-10">
                    <select class="col-sm-10 form-control" name="hmgoodstypeid" id="hmgoodstypeid" required>
                        <option value="">请选择商品类别</option>
                        <c:forEach items="${hmgoodstypes}" var="hmgoodstype">
                            <option value="${hmgoodstype.goodstypeid}" <c:if test="${hmgoodstype.goodstypeid==hmgoods.hmgoodstype.goodstypeid}">selected</c:if>>${hmgoodstype.goodstypetypename}</option>
                        </c:forEach>
                    </select>
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-2  control-label" for="goodsprice"><span class="start">*</span>商品单价:</label>
                <div class="col-sm-10">
                     <input type="text" class="col-sm-10 form-control" id="goodsprice" name="goodsprice" value="${hmgoods.goodsprice}" pattern="\d{1,}(\.\d{1,2})?" title="请输入整数或保留两位小数" required placeholder="请输入商品单价" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2  control-label" for="goodsactualprice"><span class="start">*</span>商品优惠价:</label>
                <div class="col-sm-10">
                     <input type="text" class="col-sm-10 form-control" id="goodsactualprice" value="${hmgoods.goodsactualprice}" name="goodsactualprice" pattern="\d{1,}(\.\d{1,2})?" title="请输入整数或保留两位小数" required placeholder="请输入商品单价" />
                </div>
            </div>
           <div class="form-group">
                <label class="col-sm-2  control-label" ><span class="start">*</span>过期时间:</label>
                <div class="col-sm-10">
                    <input type="text" placeholder="请输入过期时间"  required name="goodsoutdate" value="<fmt:formatDate value="${hmgoods.goodsoutdate}" pattern="yyyy-MM-dd"></fmt:formatDate>" class="timeinput form-control"   onclick="SelectDate(this,'yyyy-MM-dd')">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2  control-label" for="goodsunitname">商品单位:</label>
                <div class="col-sm-10">
                    <input type="text" class="col-sm-10 form-control" value="${hmgoods.goodsunitname}" id="goodsunitname" name="goodsunitname"  placeholder="请输入商品单位"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2  control-label" for="goodsbrand">商品品牌:</label>
                <div class="col-sm-10">
                    <input type="text" class="col-sm-10 form-control" value="${hmgoods.goodsbrand}" id="goodsbrand" name="goodsbrand"  placeholder="请输入商品品牌"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2  control-label" for="goodsbarcode">商品条码:</label>
                <div class="col-sm-10">
                    <input type="text" class="col-sm-10 form-control" value="${hmgoods.goodsbarcode}" id="goodsbarcode" name="goodsbarcode"  placeholder="请输入商品条码"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2  control-label" for="goodsbrand">商品状态:</label>
                <div class="col-sm-10">
                    <select class="form-control" name="goodsstate" id="goodsstate" placeholder="请选择商品状态">
                        <option value="" selected>请选择商品状态</option>
                        <option value="1" <c:if test="${hmgoods.goodsstate == 1}">selected</c:if>>正常</option>
                        <option value="2" <c:if test="${hmgoods.goodsstate == 2}">selected</c:if>>人工下架</option>
                        <option value="3" <c:if test="${hmgoods.goodsstate == 3}">selected</c:if>>自然下架</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2  control-label" for="goodsbarcode">促销标签:</label>
                <div class="col-sm-10">
                    <input type="file" class="col-sm-10 form-control" value="" name="saletab"  />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2  control-label" for="goodstypespecifications">规则说明:</label>
                <div class="col-sm-10">
                    <textarea class="col-sm-10 form-control" id="goodstypespecifications" name="goodstypespecifications" rows="3">${hmgoods.goodstypespecifications}
                    </textarea>
                </div>
            </div>
            <div id="form-container">
                <div class="form-group">
                    <label class="col-sm-2 control-label" >商品图片(400*400):</label>
                    <div class="col-sm-10">
                    <for:forEach items="${images}" var="image">

                        <div class="row">
                            <div class="col-sm-4">
                                <img src="${image}" width="50px" height="50px">
                                <input type="hidden" name="goodsimageurl" value="${image}">
                                <input type="file" name="goodsImage">
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-danger" onclick="deleteNew(this)">删除</button>
                            </div>
                        </div>
                    </for:forEach>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 col-sm-offset-2">
                    <button type="button" class="btn btn-success" onclick="addNew()" >添加一个</button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2 col-xs-8 col-xs-offset-4">
                    <c:if test="${type!=1}">
                        <button type="submit" class="btn btn-primary" style="width:100px;height:40px;">提&nbsp;&nbsp;交</button>
                    </c:if>
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
