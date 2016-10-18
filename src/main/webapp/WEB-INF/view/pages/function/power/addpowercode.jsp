<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>管理中心-首页</title>
</head>
<body>
  <center>
        <h1>新增权限代码</h1>
      <form action="/common/savePowerCode.html" method="post">
        <input type="hidden" name="powercodeuptakid" value="${code}">
        <input type="hidden" name="powercodevalidate" value="1">
        权限名称：<input type="text" name="powercodetaskname" value="${powercodetaskname}">
        权限代码：<input type="text" name="powercodetaskcode" value="${powercodetaskcode}">
        <input type="submit" value="提交">

      </form>
  </center>
</body>
</html>
