<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>APP订单类型</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link rel="stylesheet" type="text/css" href="/static/css/style.css"/>
  <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<ol class="breadcrumb">
  <li><a href="javascript:void(0)">首页</a></li>
  <li><a href="javascript:void(0)">订单管理</a></li>
  <li class="active">APP订单类型</li>
</ol>
<div class="page-container">
  <div class="row">
    <div class="col-sm-12" align="right">
      <button type="button" class="btn btn-info" onclick="javascript:window.location='/hm/mngr/orderManageController/addOrderType.html'">新增</button>
    </div>
  </div>
  <div class="row">
  <div class="table-responsive">
    <c:if test="${fn:length(ordermanage)>0}">
      <table class="table table-hover" >
        <thead>
        <tr>
          <th>序号</th>
          <th>名称</th>
          <th>订单类型</th>
          <th>图片</th>
          <th>订单状态</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody id="container">
        <c:forEach items="${ordermanage}" var="ordermanage" varStatus="_status">
          <tr>
            <td>${_status.index+1}</td>
            <td>${ordermanage.orderName}</td>
            <td>${ordermanage.orderType}</td>
            <td><img src="${ordermanage.orderImag}" style="width:50px;height:50px;"/></td>
            <td>
              <c:if test="${ordermanage.orderState == '1'}">
                开启
              </c:if>
              <c:if test="${ordermanage.orderState == '2'}">
                关闭
              </c:if>
            </td>
            <td>
              <button type="button" class="btn btn-info" onclick="javascript:window.location='/hm/mngr/orderManageController/addOrderType.html?id=${ordermanage.id}'">编辑</button>&nbsp;
              <button type="button" class="btn btn-danger" onclick="deletegoods(${ordermanage.id})">删除</button>&nbsp;
              <button type="button" class="btn btn-info" onclick="updateGoodtype(${ordermanage.id},${ordermanage.orderState})">
                <c:if test="${ordermanage.orderState == '1'}">
                  关闭
                </c:if>
                <c:if test="${ordermanage.orderState == '2'}">
                  开启
                </c:if>
              </button>&nbsp;
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:if>

    <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/mngr/orderManageController/orderTypeManager.html"></w:pager>

  </div>
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
        url: "/hm/mngr/orderManageController/deleteOrder.html",
        data: {
          id: id
        },
        type: 'post',
        cache: false,
        dataType: 'text',
        success: function (data) {
          if ("success" == data) {
            alert("删除成功！");
            location.reload();
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
    var state_s = "开启";
    if(state==1){
      state =2;
      state_s = "关闭";
    }else{
      state = 1;
    }
    if(confirm("确认"+state_s)){
      $.ajax({
        url:"/hm/mngr/orderManageController/updateOrderManage.html",
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
            location.reload();
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

