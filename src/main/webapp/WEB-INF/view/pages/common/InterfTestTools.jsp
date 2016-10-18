<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>接口测试界面</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="/static/css/test.css" />
</head>
<body>
    <div class="title"><h1>接口测试界面</h1></div>
    <form action="" method="post"  id="form1" name="form1">
        <div class="search-layout clearfix margin_top10">
            <label><span class="start">*</span>接口url:</label>
            <input type="text" placeholder="请输入接口url"  name="url" id="url" value="" class="form-control" required >
        </div>
        <div class="search-layout clearfix margin_top10">
            <label><span class="start">*</span>请求方式:</label>
            <select name="methodType" class="form-control" required id="methodTpe">
                <option value="get">get</option>
                <option value="post">post</option>
            </select>
        </div>
        <div class="search-layout clearfix">
            <label>参数列表:</label>
            <img src="/static/images/plus1.gif" style="width:22px;height:22px;margin-top:4px;" id="add_btn" class="add_btn"/>
        </div>

        <div id="args-container">

                <div class="search-layout clearfix margin_top10 args">
                    <label>&nbsp;</label>
                    <span class="span">参数名:</span>
                    <input type="text" placeholder="请输入参数名"  name="argsName" value="" class="form-control" style="width:150px;">
                    <span class="span">参数值:</span>
                    <input type="text" placeholder="请输入参数值"  name="argsValue" value="" class="form-control" style="width:150px;">
                    <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNew(this)"/>
                </div>

        </div>
        <div class="button-layout">
            <button type="button" class="btn btn-primary" id="submitBtn" style="width:150px;margin-left:80px;">提交</button>
        </div>
    </form>
    <div class="search-layout clearfix result-layout">
        <label>测试结果:</label>
        <textarea name="result" id="result">
        </textarea>
    </div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script>
    $(".add_btn").hover(function(){
        $(this).attr("src","/static/images/plus2.gif");
    },function(){
        $(this).attr("src","/static/images/plus1.gif");
    });
    $("#add_btn").click(function(){
        var areaDiv = document.getElementById("template").innerHTML;
        $("#args-container").append(areaDiv);
    });
    function deleteNew(obj){
        $(obj).parent().remove();
    }
    $("#clearResult").click(function(){
        $("#result").val("");
    });
    $("#submitBtn").click(function(){
        var url=$("#url").val();
        var methodType=$("#methodType").val();
        var argsObj={};
        var args=$(".args");
        for(var i=0;i<args.length;i++){
            var argsName=$(args[i]).find("input[name='argsName']").val();
            var argsValue=$(args[i]).find("input[name='argsValue']").val();
            argsObj[argsName]=argsValue;
            //console.log("argsName:"+argsName+",argsValue:"+argsValue);
        }
        if(url!=""){
            $.ajax({
                url:url,
                type:methodType,
                data:argsObj,
                dataType:"text",
                success:function(data){
                    $("#result").val(data);
                },
                error:function(){
                    alert("获取数据异常");
                    $("#result").val("获取数据异常!");
                }
            });
        }
    });
</script>
<script type="text/template" id="template">
    <div class="search-layout clearfix margin_top10 args">
            <label>&nbsp;</label>
            <span class="span">参数名:</span>
            <input type="text" placeholder="请输入参数名"  name="argsName" value="" class="form-control"  style="width:150px;">
            <span class="span">参数值:</span>
            <input type="text" placeholder="请输入参数值"  name="argsValue" value="" class="form-control"  style="width:150px;">
            <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNew(this)"/>
    </div>
</script>
</body>
</html>

