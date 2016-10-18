<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>活动详情</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
    <script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
    <style>
        body{background-color:rgba(237,237,237,.2);}
        #activitytitle{
            background: url('/static/images/activitytitle.png') repeat-y center;
            font-size: 35px;;
            height:60px;
            color:white;
        }
    </style>
</head>
<body>
<div style="width:100%;margin:0 auto;">
    <div class="text-center"><h3 id="activitytitle" ></h3></div>
    <div class="activity-layout">
    </div>
    <div class="activity-content">
        <p id="activitycontext"></p>
    </div>
</div>
<script>
    $(function(){
            $.ajax({
                url:"/hm/welcome/event_details.html",
                type:"get",
                data:{activity_id:'${activity_id}'},
                success:function(result){
                    var result=JSON.parse(result);
                    $("#activitytitle").html(result.data.activitytitle);
                    $("#activitycontext").html(result.data.activitycontext);
                    $.each(result.data.piclist,function(i,item){
                        $(".activity-layout").append("<img src='"+item.picurl+"'/>");
                    });
                    if(result.code==0){
                        alert("请求失败!");
                        return;
                    }
                },
                error:function(){
                    alert("请求失败!");
                }
            });


    })
</script>
</body>
</html>
