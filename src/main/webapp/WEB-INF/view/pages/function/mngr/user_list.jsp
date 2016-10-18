<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">用户管理</a></li>
    <li class="active">用户管理</li>
</ol>
<div class="page-container">
    <form action="/hm/mngr/usermanager.html" method="post" id="userform">
        <div class="row">

            <div class="col-sm-2 col-md-1">
                <label>账号:</label>
            </div>
            <div class="col-sm-2 col-md-2">
                <input type="text" class="form-control" id="queryString" name="queryString"
                       placeholder="请输入账号" value="${queryString}" >
            </div>


            <label class="col-sm-2 col-md-1 control-label">状态:</label>
            <div class="col-sm-2 col-md-2">
                <select class="form-control" name="userstate" id="userstate">
                    <option value="" >请选择状态</option>
                    <option value="1" ${userstate=="1"?"selected":""}>有效</option>
                    <option value="0" ${userstate=="0"?"selected":""}>无效</option>
                </select>
            </div>
        </div>
        <div class="row margin_top10">
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>登录时间:</label>
            </div>
            <div class="col-sm-2">
                <input type="text" class="timeinput form-control"  id="startDate" name="startDate"
                       placeholder="请输入起始日期" value="${startDate}"   onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" >
            </div>
            <div class="col-sm-1">
                至
            </div>
            <div class="col-sm-2">
                <input type="text" class="timeinput form-control"  id="endDate" name="endDate"
                       placeholder="请输入截止日期" value="${endDate}"   onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" >
            </div>

            <div class="col-sm-1">
                <input type="submit" class="btn btn-success" value="查询">
            </div>
        </div>
    </form>

    <div class="table-responsive">
        <c:if test="${fn:length(hmusers)>0}">
            <table class="table table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>账号</th>
                        <th>用户ID</th>
                        <th>用户头像</th>
                        <th>用户状态</th>
                        <th>注册时间</th>
                        <th>最后登录时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody id="container">
                    <c:forEach items="${hmusers}" varStatus="_status" var="hmuser">
                        <tr>
                            <td>${_status.index+1}</td>
                            <td>${hmuser.userloginname}</td>
                            <td>${hmuser.userid}</td>
                            <td><img src="${hmuser.userpic}" style="width:50px;height:50px;"/></td>
                            <td>
                                <c:if test="${hmuser.userstate == 1}">
                                    有效
                                </c:if>
                                <c:if test="${hmuser.userstate == 0}">
                                    无效
                                </c:if>
                            </td>
                            <td><fmt:formatDate value="${hmuser.userregistdate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${hmuser.userlastlogin}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                            <td> <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="changestate(${hmuser.userid},${hmuser.userstate})">状态变更</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/mngr/usermanager.html"></w:pager>

    </div>
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>
<script type="text/javascript">
    function changestate(userid,state){
        var state1 = "无效";
        if(state==0){
            state = 1;
            state1 = "有效";
        }else{
            state = 0;
        }
        if(confirm("确定将该用户标记为："+state1+"?")){
            $.ajax({
                url:"/hm/mngr/updateuserstate.html",
                data:{
                    userid:userid,
                    state:state
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        alert("更新成功！");
                        $("#userform").submit();
                    }else{
                        alert("更新成功！");
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

