<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>意见反馈</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">系统设置</a></li>
    <li class="active">意见反馈</li>
</ol>
<div class="page-container">
    <div class="row">
        <form action="/hm/page/suggestion.html" method="post" name="sug_submitform" id="sug_submitform">
            <div class="col-sm-2 col-md-1">
                <label>用户名:</label>
            </div>
            <div class="col-sm-3 col-md-2">
                <input type="text" class="form-control" id="queryName" name="queryName"
                       placeholder="请输入用户名" value="${queryName}" >
            </div>
            <div class="col-sm-2 col-md-1">
                <label>内容:</label>
            </div>
            <div class="col-sm-3 col-md-2">
                <input type="text" class="form-control" id="queryString" name="queryString"
                       placeholder="请输入反馈内容" value="${queryString}" >
            </div>

            <div class="col-sm-4">
                <input type="hidden" name="pageSize" value="${pageSize}">
                <input type="submit" class="btn btn-success" value="查询">
                <button type="button" class="btn btn-danger" id="delete_btn">删除</button>
            </div>
        </form>
    </div>
    <div class="table-responsive margin_bottom100">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th width="8%"><input type="checkbox" id="checkAll"/>全选</th>
                <th width="92%">内容</th>
            </tr>
            </thead>
            <tbody id="container">
                <c:forEach items="${hmsyssuggestions}" varStatus="_status" var="hmsyssuggestion">
                    <tr>
                        <td><input type="checkbox" value="${hmsyssuggestion.syssuggestionid}"/></td>
                        <td>
                            <div class="feedback">
                                <div class="feedback-content">
                                        ${hmsyssuggestion.syssuggestioncontext}
                                </div>
                                <div class="feedback-footer float_left">
                                    <span>用户名:${hmsyssuggestion.username}</span><span>反馈时间:${hmsyssuggestion.syssuggestiondate}</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
           <w:pager pageNo="${pageno}" recordCount="${totalCount}" url="/hm/page/suggestion.html"></w:pager>
    </div>
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js" ></script>
<script type="text/javascript">
    $(function(){
        //全选
        checkedAll("checkAll","container");//全选按钮的ID,内容列表容器ID
        deleteFn("delete_btn","container","/hm/mngr/deletesuggestion.html");//删除按钮ID,内容列表容器ID,删除的请求路径
    })
    function callback(){
        $("#sug_submitform").submit();
    }
</script>
</body>
</html>

