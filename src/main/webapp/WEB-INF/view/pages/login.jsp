<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>惠民-登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/css/login.css" rel='stylesheet' type='text/css'/>
</head>
<body>
<h1><img src="/static/images/login/logo.png" alt="中商-惠民"/></h1>

<div class="login-form">
    <div class="close"></div>
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"></div>
    <div class="avtar"><img src="/static/images/login/avtar.png"/></div>
    <c:if test="${userName==null or userName == '用户名'}">
        <c:set var="userName" value="请输入用户名！"></c:set>
    </c:if>
    <form method="post" action="/hm/mngr/login.html">
        <input type="text" name="userName" id="userName" class="text" value="${userName}" onFocus="this.value = '';"
               onBlur="if (this.value == '') {this.value = '请输入用户名！';}">

        <div class="key"><input type="password" name="password" id="password" value="Password" onFocus="this.value = '';"
                                onBlur="if (this.value == '') {this.value = 'Password';}"></div>
        <p class="tipmessage">${MESSAGE}</p>
        <div class="signin"><input type="submit" value="登录"></div>
</form>
</div>
<div class="copy-rights">
    <p>Copyright &copy; 2015.中商惠民 All rights reserved.</p>

    <p>技术支持：北京力天兄弟科技有限公司</p>
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script type="application/x-javascript">
    $(document).ready(function (c) {
        if(top.location!=self.location){
           top.location=self.location;
        }

        $('.close').on('click', function (c) {
            $('.login-form').fadeOut('slow', function (c) {
                $('.login-form').remove();
            });
        });
    });
    addEventListener("load", function () {
     setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    }
</script>

</body>
</html>