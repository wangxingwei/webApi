<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>专题活动</title>
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
    <li><a href="javascript:void(0)">活动管理</a></li>
    <li class="active">专题活动</li>
</ol>
<div class="page-container">
    <form action="" method="post" >
        <div class="search-layout clearfix">
            <label>活动状态:</label>
            <select name="" class="form-control float_left" >
                <option value="">全部</option>
                <option value="1">未开始</option>
                <option value="2">进行中</option>
                <option value="3">已结束</option>
            </select>

            <label>活动时间:</label>
            <input type="text" placeholder="请输入开始日期"  class="timeinput form-control"  onclick="SelectDate(this,'yyyy-MM-dd')">
            <label style="text-align:center;">&nbsp;~&nbsp;</label>
            <input type="text" placeholder="请输入结束日期"  class="timeinput form-control"   onclick="SelectDate(this,'yyyy-MM-dd')">
            <input type="checkbox" value="" class="checkbox"/>
            <label style="text-align:left;">包含删除</label>

            <button type="button" class="btn btn-info" onclick="javascript:window.location='/common/menuforward.html?url=/function/mngr/add_subject_activity'">新增</button>
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>活动名称:</label>
            <input type="text" placeholder="请输入活动名称"  class="form-control" >
            <label>&nbsp;合作方:</label>
            <input type="text" placeholder="请输入合作方"  class="form-control">

                <button type="button" class="btn btn-success">查询</button>
                <button type="button" class="btn btn-info" id="edit_btn">编辑</button>
                <button type="button" class="btn btn-danger" id="delete_btn">删除</button>
                <button type="button" class="btn btn-default">导出</button>

        </div>
    </form>
    <div class="table-responsive margin_top10">

            <table class="table table-bordered customer-table">
                <thead>
                <tr>
                    <th><input type="checkbox" value=""/>全选</th>
                    <th>活动ID</th>
                    <th>活动名称</th>
                    <th>合作方</th>
                    <th>活动头图</th>
                    <th>详情描述</th>
                    <th>url</th>
                    <th>活动备注</th>
                    <th>活动状态</th>
                    <th>上线时间</th>
                    <th>下线时间</th>
                    <th>排序</th>
                </tr>
                </thead>
                <tbody id="container">

                        <tr>
                            <td><input type="checkbox" value="1"/></td>
                            <td>101</td>
                            <td>jflsj</td>
                            <td>京东</td>
                            <td><img src="/static/images/2.png" style="width:50px;height:50px;"/></td>
                            <td><span class="text_splice" title="企业颁给他“能手”，同事喊他“大师”">“天天正能量”...</span></td>
                            <td><a target="_blank" href="http://www.baidu.com" title="http://www.baidu.com"><span class="text_splice">http://www.baidu.com</span></a></td>
                            <td>jlfjsldfjldsjflsdjf</td>
                            <td>开始</td>
                            <td>2015-10-23 12:23</td>
                            <td>2015-11-23 12:23</td>
                            <td><a href="#" class="btn btn-warning">置顶</a></td>
                        </tr>

                </tbody>
            </table>


        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/mngr/goodstypequery.html"></w:pager>

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
        //编辑
        $("#edit_btn").click(function(){
            var id= $("#container").find("[type='checkbox']:checked").val();
            alert(id);
            if(id!=null && id!=""){
                window.location='/common/menuforward.html?url=/function/mngr/add_subject_activity';
            }else{
                alert("请选择一条记录!");
            }
        });
    })

</script>
</body>
</html>

