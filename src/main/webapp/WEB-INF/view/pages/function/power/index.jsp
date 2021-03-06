<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>权限管理中心-首页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/menu.css" />
    <script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
    <script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/js/menu.js"></script>
    <style>
        body{overflow-y:hidden;}
    </style>
</head>
<body>
<!--导航开始-->
<div>
<nav class="navbar navbar-default" style="margin-bottom:0px;">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <img src="/static/power/user4.png" height="60px" style="vertical-align:middle;"/><span class="nav-title">&nbsp;&nbsp;欢迎使用权限管理系统</span>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav ">
                <%--<li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
              --%>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <%--<li ><a href="#">权限管理 <span class="sr-only">(current)</span></a></li>--%>
                <li class="dropdown" id="dropdownMenu">
                    <a href="#" class="dropdown-toggle"  data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>${sessionScope.get("USERLOGIN_SESSIONNAME").username}<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="/hm/mngr/logout.html">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
</div>
<!--导航结束-->
<!--左侧菜单开始-->
<div class="nav-down">
    <jsp:include page="left.jsp"/>
</div>
<!--左侧菜单结束-->
<div class="rightcon">
    <iframe id="iframe_context" src="" name="frmright" scrolling="yes" frameborder="0" style="border: 0px; height: 100%; width: 100%;sallowTransparency:true ;" >
    </iframe>
</div>

<script type="text/javascript">
    var winHeight=$(window).height();
    var offsetTop=$(".nav-top").height();
    $(".rightcon").css("height",winHeight-offsetTop);
    $(".nav-menu").css("height",winHeight-offsetTop);
    $(".leftmenu2").css("height",winHeight-offsetTop);
    $(window).resize(function(){
        var winHeight=$(window).height();
        var offsetTop=$(".nav-top").height();
        $(".rightcon").css("height",winHeight-offsetTop);
        $(".nav-menu").css("height",winHeight-offsetTop);
        $(".leftmenu2").css("height",winHeight-offsetTop);
    });
    var htmlSrc=$("#lista_first").attr("href");
    $("#iframe_context").attr("src",htmlSrc);
    $(".nav-menu a").click(function(){
        var htmlSrc=$(this).attr("href");

        $("#iframe_context").attr("src",htmlSrc);
    });

</script>

</body>
</html>
