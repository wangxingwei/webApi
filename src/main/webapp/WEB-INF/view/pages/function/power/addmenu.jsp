<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增菜单</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="/static/application/css/power/style.css" />
    <script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
    <script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="/common/getallmenu.html">菜单维护</a></li>
    <li><a href="/common/getallpowercodeformenuadd.html?upmenuid=${saamenu.menuupperid}">选择权限</a></li>
    <li class="active">新增菜单</li>
</ol>
<div   style="width:90%;margin:50px auto;margin-bottom:100px;" >
    <form class="form-horizontal" role="form" method="post" action="/common/savemenu.html" >
        <input type="hidden" value="${saamenu.id}" name="id"/>
        <input type="hidden" value="${saapowercode.powercodetaskcode}" name="powercodetaskcode"/>
        <input type="hidden" value="${saamenu.menulevel}" name="menulevel"/>
        <input type="hidden" value="1" name="menuvalidate"/>
        <input type="hidden" value="${saamenu.menuupperid}" name="menuupperid"/>
        <input type="hidden" value="${saamenu.menudeleteflag}" name="menudeleteflag"/>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="menuname"><span class="start">*</span>菜单名称:</label>
            <div class="col-sm-10">
                <input type="text" class="col-sm-10 form-control" id="menuname" name="menuname" value="${saamenu.menuname}" required placeholder="请输入菜单名称"/>
            </div>

        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="menuurl">跳转地址:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="menuurl" name="menuurl" value="${saamenu.menuurl}"  placeholder="请输入跳转地址"/>
            </div>

        </div>
        <div class="form-group">
            <label class="col-sm-2  control-label" for="menuopentype">打开方式:</label>
            <div class="col-sm-10">
                <select class="col-sm-10 form-control" name="menuopentype" id="menuopentype">
                    <option value="">----请选择---</option>
                    <option value="_blank"
                            <c:if test="${saamenu.menuopentype == '_blank'}">selected</c:if> >新窗口中打开
                    </option>
                    <option value="_self"
                            <c:if test="${saamenu.menuopentype == '' || saamenu.menuopentype == '_self'}">selected</c:if> >
                        当前位置打开
                    </option>
                    <option value="_parent"
                            <c:if test="${saamenu.menuopentype == '_parent'}">selected</c:if> >原窗口打开
                    </option>
                    <option value="_top"
                            <c:if test="${saamenu.menuopentype == '_top'}">selected</c:if> >整个窗口中打开
                    </option>
                </select>
            </div>

        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="menusort"><span class="start">*</span>排序序号:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="menusort" name="menusort" value="${saamenu.menusort}" pattern="\d+" title="请输入整数" required placeholder="请输入排序序号"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-4 col-xs-8 col-xs-offset-4">
                <button type="submit" class="btn btn-primary" style="width:100px;height:40px;">提&nbsp;&nbsp;交</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" style="width:100px;height:40px;" onclick="javascript:history.go(-1)">返&nbsp;&nbsp;回</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>