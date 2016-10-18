<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>广告管理</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="stylesheet" type="text/css" href="/static/application/css/power/openwindow.css" />
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">广告管理</a></li>
    <li class="active">广告管理</li>
</ol>

<div class="page-container">
    <form class="form-horizontal" method="post" action="/hm/page/admanager.html" id="goodtypeid">
        <div class="row">
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>广告标题:</label>
            </div>
            <div class="col-sm-3 col-md-2">
                <input type="text" class="form-control" id="title" name="title"
                       placeholder="请输入广告标题" value="${title}" >
            </div>
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>广告状态:</label>
            </div>
            <div class="col-sm-3 col-md-2">
                <select class="form-control" name="state" id="state">
                    <option value="">全部</option>
                    <option value="1" ${state=="1"?"selected":""}>有效</option>
                    <option value="0" ${state=="0"?"selected":""}>无效</option>
                </select>
            </div>
            <div class="col-sm-1">
                <input type="submit" class="btn btn-success" value="查询"/>
            </div>
            <div class="col-sm-1">
                <button type="button" class="btn btn-info"
                        onclick="javascript:window.location='/hm/page/addad.html'">
                    新增</button>
            </div>
        </div>
    </form>
    <div class="table-responsive">
        <c:if test="${fn:length(ads)>0}">
            <table class="table table-hover" >
                <thead>
                <tr>
                    <th>序号</th>
                    <th>标题</th>
                    <th>图片</th>
                    <th>内容</th>
                    <th>状态</th>
                    <th>跳转url</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="container">
                <c:forEach items="${ads}" var="ads" varStatus="_status">
                    <tr>
                        <td>${_status.index+1}</td>
                        <td>${ads.adtitle}</td>
                        <td><img src="${ads.adimageurl}" height="30px" width="30px"></td>
                        <td>${ads.adcontext}</td>
                        <td>
                            <c:if test="${ads.adsate == 1}">有效</c:if>
                            <c:if test="${ads.adsate == 0}">无效</c:if>
                        </td>
                        <td>${ads.webviewurl}</td>
                        <td>
                            <button type="button" class="btn btn-danger" onclick="deleteImage(${ads.adid})">删除</button>
                            <a class="btn btn-info" href="/hm/page/addad.html?id=${ads.adid}">编辑</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/page/admanager.html"></w:pager>

    </div>
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function deleteImage(id){
        if(confirm("确认删除")){
            $.ajax({
                url:"/hm/mngr/deleteimage.html",
                data:{
                    id:id
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        alert("删除成功！");
                        $("#goodtypeid").submit();
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
