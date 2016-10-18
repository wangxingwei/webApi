<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>角色查询</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">角色维护</a></li>
    <li class="active">角色查询</li>
</ol>
<div   style="width:90%;margin:10px auto;margin-bottom:100px;" >
    <form action="/common/queryrole.html" method="post" id="queryform" name="queryform">
        <div class="row">
            <div class="col-sm-2">
                <label>角色名称或代码:</label>
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="queryString" name="queryString"
                       placeholder="角色名称或代码" value="" >
            </div>
            <div class="col-sm-1">
                <button type="submit" class="btn btn-success" id="search">查询</button>
            </div>
        </div>
    </form>
    <c:if test="${fn:length(saaroles)>0}">
        <div class="table-responsive" style="margin-top:20px;">
            <table class="table table-hover" >
                <thead>
                <tr>
                    <th>序号</th>
                    <th>角色名称</th>
                    <th>角色代码</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="container">
                <c:forEach items="${saaroles}" var="saarole" varStatus="_status">
                    <tr>
                        <td>${_status.index+1}</td>
                        <td>${saarole.rolename}</td>
                        <td>${saarole.rolecode}</td>
                        <td>${saarole.rolecreatetime}</td>
                        <td>
                            <button type="button" class="btn btn-warning" onclick="javascript:window.location='/common/showrole.html?editType=query&roleCode=${saarole.rolecode}'">查看</button>
                            <button type="button" class="btn btn-info" onclick="javascript:window.location='/common/showrole.html?editType=edit&roleCode=${saarole.rolecode}'">编辑</button>
                            <button type="button" class="btn btn-danger" onclick="javascript:deleteRole('${saarole.rolecode}','${saarole.rolename}')">删除</button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </c:if>
    <c:if test="${fn:length(saaroles)==0 and queryflag==1}">
        <h2>无数据！</h2>
    </c:if>
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function deleteRole(rolecode,rolename){
        if(confirm("确认删除角色？"+rolename)){
            $.ajax({
                url:"/common/deleterole.html",
                data:{
                    rolecode:rolecode
                },
                type:'post',
                cache:false,
                dataType:'json',
                success:function(data) {
                    if("success"==data.status){
                        alert("删除成功！");
                        $("#queryform").submit();
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
