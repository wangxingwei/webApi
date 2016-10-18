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
    <li><a href="javascript:void(0)">活动分类管理</a></li>
    <li class="active">新增活动分类</li>
</ol>

<div   style="width:90%;margin:50px auto;">
        <form role="form" method="post" action="/hm/activity/savehmactivitykid.html" enctype="multipart/form-data">
            <input type="hidden" name="activitykindid" value="${hmactivitykind.activitykindid}"/>
            <input type="hidden" name="activitykindpicurl" value="${hmactivitykind.activitykindpicurl}"/>

            <div class="form-group">
                <label for="activitykindname"><span class="start">*</span>类别名称：</label>
                <input type="text" class="form-control" id="activitykindname" name="activitykindname" value="${hmactivitykind.activitykindname}" required placeholder="请输入类别名称">
            </div>
            <div class="form-group">
                <label for="activitykindremark">类别备注：</label>
                <input type="text" class="form-control" id="activitykindremark" name="activitykindremark" value="${hmactivitykind.activitykindremark}" placeholder="请输入类别备注">
            </div>
            <div class="form-group">
                <label for="activitykindcode"><span class="start">*</span>类别代码：</label>
                <input type="text" class="form-control" id="activitykindcode" name="activitykindcode" value="${hmactivitykind.activitykindcode}" <c:if test="${hmactivitykind.activitykindcode !=null }">readonly</c:if>  required placeholder="请输入类别代码">
            </div>
            <div class="form-group">
                <label for="activitykindtypeflag">活动类别标识：</label>
               <select name="activitykindtypeflag" id="activitykindtypeflag" class="form-control">
                   <option value="0" <c:if test="${hmactivitykind.activitykindtypeflag==0}">selected</c:if>  >非套餐类型</option>
                   <option value="1" <c:if test="${hmactivitykind.activitykindtypeflag==1}">selected</c:if>  >套餐类型</option>
               </select>

            </div>

            <div class="form-group">
                <label for="typeImage">类别图片：</label>

                <img src="${hmactivitykind.activitykindpicurl}" width="25px" height="25px">

                <input type="file" class="form-control" id="picurl" name="picurl">
            </div>
           <button type="submit" class="btn btn-primary" id="btn-submit"> 提交 </button>

        </form>

</div>

</body>
</html>
