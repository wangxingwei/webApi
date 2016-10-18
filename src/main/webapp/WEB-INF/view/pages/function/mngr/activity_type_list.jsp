<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品分类</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">活动分类管理</a></li>
    <li class="active">活动分类查询</li>
</ol>
<div class="page-container">
    <form action="/hm/activity/queryhmactivitykid.html" method="post" id="submitform">
        <div class="row">
                <div class="col-sm-2 col-lg-1">
                    <label>分类名称:</label>
                </div>
                <div class="col-sm-2">
                    <input type="text" class="form-control"  name="activitykindname"
                           placeholder="请输入分类名称" value="${activitykindname}" >
                </div>
                <div class="col-sm-3 col-lg-2">
                    <label>活动类别标识：</label>
                </div>
                <div class="col-sm-2">
                    <select name="activitykindtypeflag" id="activitykindtypeflag" class="form-control">
                        <option value="">全选</option>
                        <option value="0" <c:if test="${activitykindtypeflag==0}">selected</c:if>  >非套餐类型</option>
                        <option value="1" <c:if test="${activitykindtypeflag==1}">selected</c:if>  >套餐类型</option>
                    </select>
                </div>
                <div class="col-sm-1">
                    <input type="submit" class="btn btn-success" value="查询"/>
                </div>
        </div>
    </form>
    <div class="table-responsive">

            <table class="table table-hover" >
                <thead>
                <tr>
                    <th>序号</th>
                    <th>类别名称</th>
                    <th>类别代码</th>
                    <th>活动类别</th>
                    <th>图片</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="container">
                    <c:forEach items="${activitykinds}" var="activitykind" varStatus="_status">
                        <tr>
                            <td>${_status.index+1}</td>
                            <td>${activitykind.activitykindname}</td>
                            <td>${activitykind.activitykindcode}</td>
                            <td>
                                <c:if test="${activitykind.activitykindtypeflag==0}">非套餐型</c:if>
                                <c:if test="${activitykind.activitykindtypeflag==1}">套餐型</c:if>
                            </td>
                            <td><img src="${activitykind.activitykindpicurl}" style="width:50px;height:50px;"/></td>
                            <td>
                                <button type="button" class="btn btn-info" onclick="javascript:window.location='/hm/activity/queryhmactivitykidinfo.html?activitykindid=${activitykind.activitykindid}'">编辑</button>&nbsp;
                                <button type="button" class="btn btn-danger" onclick="deleteActivityType(${activitykind.activitykindid})">删除</button>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>

         <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/activity/queryhmactivitykid.html"></w:pager>

    </div>
</div>

<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript">
    function deleteActivityType(id){
        if(confirm("确认删除")){
            $.ajax({
                url:"/hm/activity/deletehmactivitykidinfo.html",
                data:{
                    activitykindids:id
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        alert("删除成功！");
                        $("#submitform").submit();
                    }else{
                        alert("删除失败！");
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

