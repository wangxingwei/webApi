<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>角色维护</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="/static/application/css/power/style.css" />
    <link rel="stylesheet" type="text/css" href="/static/application/css/power/openwindow.css" />

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">角色维护</a></li>
    <li class="active"><c:if test="${editType=='query'}">查询</c:if>
        <c:if test="${editType=='edit'}">编辑</c:if>
        <c:if test="${editType=='add'}">新增</c:if>角色
    </li>
</ol>
<div   style="width:90%;margin:10px auto;margin-bottom:100px;" >
    <form action="/common/saverole.html" method="post" class="form-horizontal">
        <div class="form-group">
            <label >角色代码:</label>
                <c:if test="${editType=='edit'}">
                        <span>${saarole.rolecode}</span>
                        <input type="hidden" value="${saarole.rolecode}" name="rolecode" />
                </c:if>
                <c:if test="${editType!='edit'}">
                    <input type="text" value="${saarole.rolecode}" name="rolecode" required style="width:300px;"/>
                </c:if>
        </div>
        <div class="form-group">
            <label>角色名称:</label>
            <input type="text" value="${saarole.rolename}" name="rolename" required style="width:300px;"/>
        </div>
        <div class="form-group">
            <input type="checkbox" id="checkAll" />全选
        </div>
        <input type="hidden" value="1" name="roleisused"/>
        <input type="hidden" value="${editType}" name="editType"/>

        <div class="tree" id="tree">
            ${menu}
        </div>
        <c:if test="${editType=='edit'}">
            <button type="submit" class="btn btn-primary" style="width:100px;height:40px;margin-top:-100px;">更&nbsp;&nbsp;新</button>
        </c:if>
        <c:if test="${editType=='add'}">
            <button type="submit" class="btn btn-primary" style="width:100px;height:40px;margin-top:-100px;">保&nbsp;&nbsp;存</button>
        </c:if>
    </form>
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/application/js/power/tree.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js" ></script>
<script>
    $(function(){
        //全选
        checkedAll("checkAll","tree");//全选按钮的ID,内容列表容器ID
    })
</script>
</body>
</html>