<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css"/>
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">商品管理</a></li>
    <li class="active">商品列表</li>
</ol>
<div class="page-container">
    <form method="post" action="/hm/page/goodslist.html" id="goodtypeid">
        <div class="row">
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>商品编码:</label>
            </div>
            <div class="col-sm-4 col-md-3 col-lg-2">
                <input type="text" class="form-control" id="goodscode" name="goodscode"
                       placeholder="请输入商品编码" value="${goodscode}">
            </div>
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>商品名称:</label>
            </div>
            <div class="col-sm-4 col-md-3 col-lg-2">
                <input type="text" class="form-control" id="goodsname" name="goodsname"
                       placeholder="请输入商品名称" value="${goodsname}">
            </div>
        </div>
        <div class="row margin_top10">
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>商品状态:</label>
            </div>
            <div class="col-sm-4 col-md-3 col-lg-2">
                <select class="form-control" name="goodsstate" id="goodsstate">
                    <option value="" selected>请选择商品状态</option>
                    <option value="1" <c:if test="${goodsstate == 1}">selected</c:if>>正常</option>
                    <option value="2" <c:if test="${goodsstate == 2}">selected</c:if>>人工下架</option>
                    <option value="3" <c:if test="${goodsstate == 3}">selected</c:if>>自然下架</option>
                </select>
            </div>
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>类别:</label>
            </div>
            <div class="col-sm-4 col-md-3 col-lg-2">
                <select class="form-control" name="gooodstype" id="gooodstype">
                    <option value="">请选择商品类别</option>
                    <c:forEach items="${hmgoodstypes}" var="hmgoodstype">
                        <option value="${hmgoodstype.goodstypeid}"
                                <c:if test="${hmgoodstype.goodstypeid==gooodstype}">selected</c:if>>${hmgoodstype.goodstypetypename}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-sm-1">
                <input type="submit" class="btn btn-success" value="查询">
            </div>
        </div>
    </form>
    <div class="table-responsive">
        <c:if test="${fn:length(goods)>0}">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th><input type="checkbox" value="" id="checkAll"/>全选</th>
                    <th>商品ID</th>
                    <th>商品编码</th>
                    <th>商品名称</th>
                    <th>商品类别</th>
                    <th>商品单价(元)</th>
                    <th>商品单位</th>
                    <th>销售规格</th>
                    <th>商品品牌</th>
                    <th>商品状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="container">
                <c:forEach items="${goods}" var="good" varStatus="_status">
                    <tr>
                        <td><input type="checkbox" value="${good.goodsid}"/></td>
                        <td>${good.goodsid}</td>
                        <td>${good.goodscode}</td>
                        <td>${good.goodsname}</td>
                        <td>${good.hmgoodstype.goodstypetypename}</td>
                        <td>${good.goodsprice}</td>
                        <td>${good.goodsunitname}</td>
                        <td>${good.goodstypespecifications}</td>
                        <td>${good.goodsbrand}</td>
                        <td>
                            <c:if test="${good.goodsstate == 1}">
                                正常
                            </c:if>
                            <c:if test="${good.goodsstate == 2}">
                                人工下架
                            </c:if>
                            <c:if test="${good.goodsstate == 3}">
                                自然下架
                            </c:if>
                        </td>
                        <td>
                            <button type="button" class="btn btn-info"
                                    onclick="javascript:window.location='/hm/page/addgoods.html?goodsid=${good.goodsid}'">
                                编辑
                            </button>
                            <button type="button" class="btn btn-danger" onclick="deletgoods(${good.goodsid})">删除</button>
                            <c:if test="${good.goodsstate == 1}">
                                <button type="button" class="btn btn-warning" id="down" >下架</button>
                            </c:if>
                            <c:if test="${good.goodsstate == 2}">
                                <button type="button" class="btn btn-warning" id="up" >上架</button>
                            </c:if>
                            <c:if test="${good.goodsstate == 3}">
                                <button type="button" class="btn btn-warning" id="up" >上架</button>
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/page/goodslist.html"></w:pager>

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
        //参数：按钮ID,内容列表容器ID,请求路径,确认信息，成功提示信息,失败提示信息，成功后执行的方法
        checkAllFn("up","container","","确认上架吗","上架成功","上架失败",callback);//上架
        checkAllFn("down","container","","确认下架吗","下架成功","下架失败",callback);//下架

    })
    function callback(){
        $("#submitform").submit();
    }
    function deletgoods(id) {
        if (confirm("确认删除")) {
            $.ajax({
                url: "/hm/mngr/deletegoode.html",
                data: {
                    id: id
                },
                type: 'post',
                cache: false,
                dataType: 'text',
                success: function (data) {
                    if ("success" == data) {
                        alert("删除成功！");
                        $("#goodtypeid").submit();
                    } else {
                        alert("删除失败！");
                    }
                },
                error: function () {
                    alert("获取数据异常！");
                }
            });

        }
    }
</script>
</body>
</html>

