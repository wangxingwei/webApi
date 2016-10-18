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
    <li><a href="javascript:void(0)">套餐分类管理</a></li>
    <li class="active">新增套餐分类</li>
</ol>

<div   style="width:90%;margin:50px auto;">
        <form role="form" method="post" action="/hm/activity/savepackagetype.do">
            <input type="hidden" name="packagetypeid" value="${hmpackagetype.packagetypeid}"/>
            <div class="form-group">
                <label for="packagetypename"><span class="start">*</span>类别名称：</label>
                <input type="text" class="form-control" id="packagetypename" name="packagetypename" value="${hmpackagetype.packagetypename}" required placeholder="请输入类别名称">
            </div>
            <div class="form-group">
                <label for="packagetypecode"><span class="start">*</span>类别代码：</label>
                <input type="text" class="form-control" id="packagetypecode" name="packagetypecode" value="${hmpackagetype.packagetypecode}" <c:if test="${hmpackagetype.packagetypecode!=null}">readonly</c:if> required placeholder="请输入类别代码">
            </div>
           <button type="submit" class="btn btn-primary" id="btn-submit"> 提交 </button>
        </form>

</div>

</body>
</html>
