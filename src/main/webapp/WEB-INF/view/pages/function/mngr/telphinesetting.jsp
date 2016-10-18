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
    <li class="active">客服电话设置</li>
</ol>
<div class="page-container">
    <div class="row">
        <div class="col-sm-2 col-md-2 col-lg-1">
            <label>客服电话:</label>
        </div>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="telphone" name="telphone"
                   placeholder="请输入客服电话" value="${hmsyssetting.telphone}" >
        </div>
        <div class="col-sm-4">
            <button type="button" class="btn btn-success" onclick="update()">更新</button>
        </div>

    </div>
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js" ></script>
<script type="text/javascript">
    function update(){
        if(confirm("确认更新？")){
            $.ajax({
                url:"/hm/mngr/updateSysConfig.html",
                data:{
                    telphone:$("#telphone").val(),
                    type:"1"
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        alert("更新成功！");
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

