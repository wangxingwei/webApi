<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>活动管理</title>
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
    <li><a href="javascript:void(0)">活动管理</a></li>
    <li class="active">活动管理</li>
</ol>
<div id="light" class="white_content">
    <div style="text-align: center;margin-top:20px;">
        <textarea id="activitycontextid" style="border:1px solid #ccc;width:80%;height:120px;"></textarea>
        <button type="button" onclick="document.getElementById('light').style.display='none';" id="closebutton">关闭</button>

    </div>
</div>

<div class="page-container">
    <form class="form-horizontal" method="post" action="/hm/page/activitymanager.html" id="goodtypeid">
        <div class="row">
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>活动标题:</label>
            </div>
            <div class="col-sm-3 col-md-2">
                <input type="text" class="form-control" id="queryString" name="queryString"
                       placeholder="请输入活动标题" value="${queryString}" >
            </div>
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>活动状态:</label>
            </div>
            <div class="col-sm-3 col-md-2">
                <select class="form-control" name="activitystate" id="activitystate">
                    <option value="">全部</option>
                    <option value="1" ${activitystate=="1"?"selected":""}>有效</option>
                    <option value="0" ${activitystate=="0"?"selected":""}>无效</option>
                </select>
            </div>
            <div class="col-sm-1">
                <input type="submit" class="btn btn-success" value="查询"/>
            </div>

        </div>
    </form>
    <div class="table-responsive">
        <c:if test="${fn:length(activitys)>0}">
            <table class="table table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>活动标题</th>
                        <th>活动图片</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody id="container">
                    <c:forEach items="${activitys}" var="packagetype" varStatus="_status">
                        <tr>
                            <td>
                                ${_status.index+1}
                                <input type="hidden" id="activitycontext[${_status.index+1}]" value="${packagetype.activitycontext}">
                            </td>
                            <td>${packagetype.activitytitle}</td>
                            <td><img src="${packagetype.images.get(0)}" height="30px" width="30px"></td>
                            <td>
                                <c:if test="${packagetype.activitystate == 1}">有效</c:if>
                                <c:if test="${packagetype.activitystate == 0}">无效</c:if>
                            </td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="deleteImage(${packagetype.activityid})">删除</button>
                                <a class="btn btn-info" href="/hm/page/addactivity.html?activityid=${packagetype.activityid}">编辑</a>
                                <button type="button" class="btn btn-warning" onclick="showcontext(${_status.index+1})">显示详情</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/page/activitymanager.html"></w:pager>

    </div>
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function deleteImage(id){
        if(confirm("确认删除")){
            $.ajax({
                url:"/hm/mngr/deleteactivity.html",
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
    function showcontext(index){
        document.getElementById('activitycontextid').value=document.getElementById('activitycontext['+index+']').value;
        document.getElementById('light').style.display='block';
    }
</script>
</body>
</html>
