<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>管理中心-首页</title>
    <meta charset="utf-8">
    <script type="text/javascript">
        function goback(url){
            if(url!=null && url!=''){
                location.href =url;
            }
            else{
                history.back();
            }
        }
    </script>
</head>
<body>
    <center>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    <!-- 提示图标 -->
    <c:if test="${message.type == 1}">
        <img src="/static/images/message/info.png" width="25px" height="25px">
    </c:if>
    <c:if test="${message.type == 2}">
        <img src="/static/images/message/warning.png" width="25px" height="25px">
    </c:if>
    <c:if test="${message.type == 3}">
        <img src="/static/images/message/error.png" width="25px" height="25px">
    </c:if>
    <c:if test="${message.type == 4}">
        <img src="/static/images/message/successpng.png" width="25px" height="25px">
    </c:if>
    <!--消息内容-->
    ${message.context}
    <!--控制返回-->
    <c:if test="${message.allowback == 1}">
        <input type="button" onclick="goback('${message.forwardUrl}')" name="返回" value="返回">
    </c:if>
    </center>
</body>
</html>
