<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>管理中心-首页</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/static/application/css/index/style.css" />
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/application/css/style.css" />
    <script type="text/javascript" src="/static/application/js/jquery-1.11.3.min.js"></script>
    <script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/application/js/index/index.js"></script>
    <link href="/static/application/css/webwidget_vertical_menu.css" rel="stylesheet" type="text/css"></link>
    <script type="text/javascript" src="/static/application/js/webwidget_vertical_menu.js"></script>
    <style>
        body{overflow-y:hidden;}
    </style>
</head>
<body >
<script language="javascript" type="text/javascript">
    $(function() {
        $("#webwidget_vertical_menu").webwidget_vertical_menu({
            menu_width: '160',
            menu_height: '35',
            menu_margin: '2',
            menu_text_size: '12',
            menu_text_color: '#CCC',
            menu_background_color: '#000000',
            menu_border_size: '2',
            menu_border_color: '#DEDEDE',
            menu_border_style: 'solid',
            menu_background_hover_color: '#38A3D5',
            directory: 'images'
        });
    });
</script>
<div style="height:760px">
    <div class="nav-top">
        <span><img src="/static/images/logo.png" height="60px" style="vertical-align:middle;"/>&nbsp;&nbsp;惠付通后台管理系统&nbsp;&nbsp;</span>
         <span style="font-size: 12px">
            <marquee width=300 height=25px; behavior=alternate direction=up scrollamount=2 align=middle >系统公告：大家好！!</marquee>
        </span>
        <div class="nav-topright">
            <p id="show_time"></p>
            <span>您好：${sessionScope.get("USERLOGIN_SESSIONNAME").username}</span>
            <span>
                <c:if test="${sessionScope.login == 'login' or sessionScope.manger == 'manger'}">
                    <a href="/common/powerindex.do">&nbsp;权限管理&nbsp;</a>
                </c:if>
            </span>
            <span><a href="javascript:if(confirm('确定要注销登录吗?'))location='/hm/game/logout.html'" target="_self" style="color: #ffffff">注销</a></span>
        </div>
    </div>
    <div class="nav-down" style="height:580px;">
        <div id="webwidget_vertical_menu" class="webwidget_vertical_menu" style="float:left; width: 160px;height: auto;">
            <!-- 菜单部分 end -->
            <ul>
            <li>
                <a href="/common/menuforward.html?url=/function/power/powercodequery" target="frmright">用户管理</a>
            </li>
            <li>
                    <a>商品分类管理</a>
                    <ul>
                        <li>
                            <a href="/common/menuforward.html?url=/function/power/menuquery" target="frmright">新增商品分类</a>
                        </li>
                        <li>
                            <a href="/common/menuforward.html?url=/function/power/menuquery" target="frmright">查询商品分类</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a>商品管理</a>
                    <ul>
                        <li>
                            <a href="/common/menuforward.html?url=/function/power/menuquery" target="frmright">新增商品</a>
                        </li>
                        <li>
                            <a href="/common/menuforward.html?url=/function/power/menuquery" target="frmright">查询商品</a>
                        </li>
                    </ul>
                </li>
            <li>
                <a>订单管理</a>
                <ul>
                    <li>
                        <a href="/common/menuforward.html?url=/function/power/rolequery" target="frmright">订单查询</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="/common/menuforward.html?url=/function/power/userpowerquery" target="frmright">广告管理</a>
            </li>
                <li>
                    <a>系统管理</a>
                    <ul>
                        <li>
                        <a href="/common/menuforward.html?url=/function/power/userpowerquery" target="frmright">用户意见管理</a>
                        </li>
                        <li>
                        <a href="/common/menuforward.html?url=/function/power/userpowerquery" target="frmright">系统维护</a>
                        </li>
                    </ul>
                </li>
                </ul>
            <%--      <div style="clear: both"></div>--%>
        </div>
        <div style="width:auto;left: 1px; height: auto;overflow:hidden;">
            <iframe id="iframe_context" src="http://www.baidu.com" name="frmright" scrolling="yes" frameborder="0" style="border: 0px; height: 580px; width: 100%;sallowTransparency:true ;" >

            </iframe>
        </div>
    </div>
    <div style="text-align:center;height:20px;padding-bottom: 0px;margin-bottom: 1px;">
        <p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
        <p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
    </div>
</div>
</body>
<script type="text/javascript">
    var winHeight=$(window).height();
    var offsetTop=$(".nav-top").height();
    $(".rightcon").css("height",winHeight-offsetTop);
    $(".leftmenu1").css("height",winHeight-offsetTop);
    $(".leftmenu2").css("height",winHeight-offsetTop);
    $(window).resize(function(){
        var winHeight=$(window).height();
        var offsetTop=$(".nav-top").height();
        $(".rightcon").css("height",winHeight-offsetTop);
        $(".leftmenu1").css("height",winHeight-offsetTop);
        $(".leftmenu2").css("height",winHeight-offsetTop);
    });
    var htmlSrc=$("#lista_first").attr("href");
    $("#iframe_context").attr("src",htmlSrc);
    $(".menu_list a").click(function(){
        var htmlSrc=$(this).attr("href");
        $("#iframe_context").attr("src",htmlSrc);
    });

    // alert(winHeight+","+offsetTop);
    function tick()
    {
        var today;
        today = new Date();
        document.getElementById("show_time").innerHTML = showLocale(today);
        window.setTimeout("tick()", 1000);
    }
    tick();

</script>
</html>
