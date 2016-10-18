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
            <label>交易时间:</label>
            <input type="text" placeholder="请输入开始日期"  class="timeinput form-control" name="startDate" value="" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')">
            <label style="text-align:center;">&nbsp;~&nbsp;</label>
            <input type="text" placeholder="请输入结束日期"  name="endDate" value="" class="timeinput form-control"   onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')">
            <label>交易类型:</label>
            <select name="tradetype" class="form-control float_left" >
                <option value="">全部</option>
                <option value="消费">消费</option>
                <option value="充值">充值</option>
                <option value="返利">返利</option>
            </select>
            <label>交易方式:</label>
            <select name="trademethod" class="form-control float_left" >
                <option value="">全部</option>
                <option value="1">现金</option>
                <option value="2">支付宝</option>
                <option value="3">微信</option>
                <option value="4">支付返利</option>
            </select>
        </div>
        <div class="search-layout clearfix">
            <label>用户电话:</label>
            <input type="text" value="" placeholder="请输入用户电话" name="phonenumber" class="form-control float_left"/>
            <label>用户昵称:</label>
            <input type="text" value="" placeholder="请输入用户昵称" name="username" class="form-control float_left"/>
            <button type="submit" class="btn btn-success">查询</button>
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
                <th>交易时间</th>
                <th>交易类型</th>
                <th>交易编号</th>
                <th>交易金额</th>
                <th>交易方式</th>
                <th>余额变动</th>
                <th>当前余额</th>
            </tr>
            </thead>
            <tbody id="container">

                <tr>
                    <td><input type="checkbox" value="1"/></td>
                    <td>1001</td>
                    <td>18201114642</td>
                    <td>上歪歪</td>
                    <td>2015-11-16 18:23:12</td>
                    <td>消费</td>
                    <td>120003</td>
                    <td>40</td>
                    <td>支付宝</td>
                    <td>-40</td>
                    <td>340</td>
                </tr>
                <tr>
                    <td><input type="checkbox" value="2"/></td>
                    <td>1001</td>
                    <td>18201114642</td>
                    <td>上歪歪</td>
                    <td>2015-11-17 18:23:12</td>
                    <td>返利</td>
                    <td>120004</td>
                    <td>40</td>
                    <td>支付返利</td>
                    <td>+100</td>
                    <td>440</td>
                </tr>


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

