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
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />
    <style>
        .customer-table th{background:#eee;}
    </style>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">用户管理</a></li>
    <li class="active">用户管理</li>
</ol>
<div class="page-container">
    <form action="" method="post" id="submitform">
        <div class="search-layout clearfix">
            <label>用户等级:</label>
            <select name="userlevel" class="form-control float_left" >
                <option value="">全部</option>
                <option value="钻石">钻石</option>
                <option value="金">金</option>
                <option value="银">银</option>
                <option value="铜">铜</option>

            </select>
            <label>用户状态:</label>
            <select name="userstate" class="form-control float_left" >
                <option value="">全部</option>
                <option value="1">激活</option>
                <option value="2">半休眠</option>
                <option value="3">休眠</option>
                <option value="4">黑名单</option>
            </select>
            <label>登录城市:</label>
            <select name="logincity" class="form-control float_left" >
                <option value="">全部</option>
                <option value="1">北京</option>
                <option value="2">上海</option>
                <option value="3">深圳</option>
                <option value="4">广州</option>
            </select>
            <label>来源:</label>
            <input type="text" value="" name="source" class="form-control float_left"/>
        </div>
        <div class="search-layout clearfix">
            <label>渠道:</label>
            <input type="text" value="" name="channel" class="form-control float_left"/>
            <label>版本号:</label>
            <input type="text" value="" name="version" class="form-control float_left"/>
            <label>用户电话:</label>
            <input type="text" value="" name="phonenumber" class="form-control float_left"/>
            <label>用户名:</label>
            <input type="text" value="" name="username" class="form-control float_left"/>
        </div>
        <div class="search-layout clearfix">
            <label>登录时间:</label>
            <input type="text" placeholder="请输入开始日期"  class="timeinput form-control" name="startDate" value="" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')">
            <label style="text-align:center;">&nbsp;~&nbsp;</label>
            <input type="text" placeholder="请输入结束日期"  name="endDate" value="" class="timeinput form-control"   onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')">
            <button type="submit" class="btn btn-success">查询</button>
            <%--<button type="button" class="btn btn-danger" id="delete_btn">删除</button>--%>
            <input type="file" name="userfile" style="display:inline;float:none;"/>
            <button type="button" class="btn btn-default" id="import">导入</button>
            <button type="button" class="btn btn-default" id="export">导出</button>
        </div>
    </form>
    <div class="table-responsive margin_top10">

        <table class="table table-bordered customer-table" >
            <thead>
            <tr>
                <th><input type="checkbox" value="" id="checkAll"/>全选</th>
                <th>用户ID</th>
                <th>用户电话</th>
                <th>用户昵称</th>
                <th>登录城市</th>
                <th>来源</th>
                <th>渠道</th>
                <th>终端机型&版本号</th>
                <th>用户等级</th>
                <th>用户状态</th>
                <th>最后使用终端机型&版本号</th>
                <th>最后登录时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="container">
           <%for(int i=0;i<5;i++){%>
                <tr>
                    <td><input type="checkbox" value="<%=(i+1)%>"/></td>
                    <td>1001</td>
                    <td>18201114642</td>
                    <td>上歪歪</td>
                    <td>北京</td>
                    <td>朋友推荐</td>
                    <td>传单扫码下载</td>
                    <td>iphone 6s & V.001</td>
                    <td>钻石</td>
                    <td>激活</td>
                    <td>iphone 6s & V.001</td>
                    <td>2015-11-16 18:23:12</td>
                    <td><a onclick="javascript:window.location='/common/menuforward.html?url=/function/mngr/edit_user'" class="btn btn-info">编辑</a></td>

                </tr>
            <%}%>

            </tbody>
        </table>


        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/activity/querypackagelist.html"></w:pager>

    </div>
</div>


<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js" ></script>
<script type="text/javascript">
    $(function(){
        //全选
        checkedAll("checkAll","container");//全选按钮的ID,内容列表容器ID
        deleteFn("delete_btn","container","");//删除按钮ID,内容列表容器ID,删除的请求路径

    })
    function callback(){
        $("#submitform").submit();
    }
</script>
</body>
</html>

