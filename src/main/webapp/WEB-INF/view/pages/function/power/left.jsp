<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<div class="nav-menu">
    <div class="menu-oc" ><i title="收起" class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" style="font-size:30px;padding-left:10px;color:#337ab7"></i></div>
    <ul>
        <li><a>基础权限维护</a>
            <ul>
                <li><a  id="lista_first" href="/common/getallpowercode.html">基础权限维护</a></li>
            </ul>
        </li>
        <li><a>菜单维护</a>
            <ul>
                <li><a href="/common/getallmenu.html">菜单维护</a></li>
            </ul>
        </li>
        <li><a>角色维护</a>
            <ul>
                <li><a href="/common/queryrole.html">角色查询</a></li>
                <li><a href="/common/showrole.html?editType=add">新增角色</a></li>
            </ul>
        </li>
        <li><a>用户权限维护</a>
            <ul>
                <li><a href="/common/queryuserrole.html?edittype=query&querystring=">用户权限查询</a></li>
                <li><a href="/common/queryuser.html">新增用户权限</a></li>
            </ul>
        </li>
        <li><a>用户管理</a>
            <ul>
                <li><a href="/common/queryuser.html?edittype=query&type=1">用户查询</a></li>
                <li><a href="/common/menuforward.html?url=/function/power/adduser">新增用户</a></li>
            </ul>
        </li>
        <li>
            <a href="/common/cleanmemorycache.do">清理系统缓存</a>
        </li>

    </ul>
</div>
<div class="leftmenu2">
    <div class="menu-oc1"><i title="展开" class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" style="font-size:30px;color:#337ab7;"></i></div>
</div>

