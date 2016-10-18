<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>餐饮商品管理</title>
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
  <li class="active">餐饮商品管理</li>
</ol>
<div class="page-container">
  <form method="post" action="/hm/mngr/goods/takeawayGoodsManager.html" id="takeawayGoodsid">
    <div class="row margin_top10">
      <div class="col-sm-2 col-md-2 col-lg-1">
        <label>商品类型:</label>
      </div>
      <div class="col-sm-4 col-md-3 col-lg-2">
        <select class="form-control" name="goodstype" id="goodstype">
          <option value="" selected>全部</option>
          <option value="BF" <c:if test="${goodstype == 'BF'}">selected</c:if>>早餐</option>
          <option value="LD" <c:if test="${goodstype == 'LD'}">selected</c:if>>外卖</option>
        </select>
      </div>
      <div class="col-sm-2 col-md-2 col-lg-1">
        <label>商品状态:</label>
      </div>
      <div class="col-sm-4 col-md-3 col-lg-2">
        <select class="form-control" name="goodsstate" id="goodsstate">
          <option value="">全部</option>
          <option value="0" <c:if test="${goodsstate == '0'}">selected</c:if>>已下线</option>
          <option value="1" <c:if test="${goodsstate == '1'}">selected</c:if>>已上线</option>
        </select>
      </div>

      <div class="col-sm-1">
        <input type="submit" class="btn btn-success" value="查询">
      </div>
      <div class="col-sm-1">
      <button type="button" class="btn btn-info"
              onclick="javascript:window.location='/hm/mngr/goods/addTakeawayGoods.html'">
        新增</button>
      </div>
    </div>
  </form>
  <div class="table-responsive">
    <c:if test="${fn:length(hmtakeawaygoods)>0}">
      <table class="table table-hover" >
        <thead>
        <tr>
          <th>序号</th>
          <th>套餐ID</th>
          <th>商品类型</th>
          <th>商品图片</th>
          <th>商品名称</th>
          <th>价格</th>
          <th>状态</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody id="container">
        <c:forEach items="${hmtakeawaygoods}" var="hmtakeawaygood" varStatus="_status">
          <tr>
            <td>${_status.index+1}</td>
            <td>${hmtakeawaygood.ldGoodId}</td>
            <td>
              <c:if test="${hmtakeawaygood.ldGoodType == 'LD'}">
                外卖
              </c:if>
              <c:if test="${hmtakeawaygood.ldGoodType == 'BF'}">
                早餐
              </c:if>
            </td>
            <td><img src="${hmtakeawaygood.ldGoodsPicSrc}" style="width:50px;height:50px;"/></td>
            <td>${hmtakeawaygood.ldGoodName}</td>
            <td>${hmtakeawaygood.ldGoodPrice}</td>
            <td>
              <c:if test="${hmtakeawaygood.ldGoodsState == '1'}">
                已上线
              </c:if>
              <c:if test="${hmtakeawaygood.ldGoodsState == '0'}">
                已下线
              </c:if>
            </td>
            <td>
              <button type="button" class="btn btn-info" onclick="javascript:window.location='/hm/mngr/goods/addTakeawayGoods.html?ldGoodId=${hmtakeawaygood.ldGoodId}'">编辑</button>&nbsp;
              <button type="button" class="btn btn-danger" onclick="deletegoods(${hmtakeawaygood.ldGoodId})">删除</button>&nbsp;
              <button type="button" class="btn btn-info" onclick="updateGoodtype(${hmtakeawaygood.ldGoodId},${hmtakeawaygood.ldGoodsState})">
                <c:if test="${hmtakeawaygood.ldGoodsState == '0'}">
                  上架
                </c:if>
                <c:if test="${hmtakeawaygood.ldGoodsState == '1'}">
                  下架
                </c:if>
              </button>&nbsp;
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:if>

    <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/mngr/goods/takeawayGoodsManager.html"></w:pager>

  </div>
</div>

<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js" ></script>

<script type="text/javascript">

  function deletegoods(id) {
    if (confirm("确认删除")) {
      $.ajax({
        url: "/hm/mngr/goods/deleteTakeawayGoods.html",
        data: {
          id: id
        },
        type: 'post',
        cache: false,
        dataType: 'text',
        success: function (data) {
          if ("success" == data) {
            alert("删除成功！");
            $("#takeawayGoodsid").submit();
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
  function updateGoodtype(id,state){
    var state_s = "上架";
    if(state==1){
      state =0;
      state_s = "下架";
    }else{
      state = 1;
    }
    if(confirm("确认"+state_s)){
      $.ajax({
        url:"/hm/mngr/goods/updateTakeawayGoodsState.html",
        data:{
          id:id,
          state:state
        },
        type:'post',
        cache:false,
        dataType:'text',
        success:function(data) {
          if("success"==data){
            alert("操作成功！");
            $("#takeawayGoodsid").submit();
          }else{
            alert("操作失败！");
          }
        },
        error:function(){
          alert("获取数据异常！");
        }
      });

    }
  }
</script>
</body>
</html>

