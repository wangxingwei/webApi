<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<div class="nav-menu">
    <ul>
        <li><a>广告管理</a>
            <ul>
                <li><a  id="lista_first" href="/hm/page/admanager.html">广告管理</a></li>
            </ul>
        </li>
        <li><a>商品分类管理</a>
            <ul>
                <li><a href="/common/menuforward.html?url=/function/mngr/add_goods_category">新增分类</a></li>
                <li><a href="/hm/mngr/goodstypequery.html">商品分类列表</a></li>

            </ul>
        </li>
        <li><a>商品管理</a>
            <ul>
                <li><a href="/hm/page/addgoods.html">新增商品</a></li>
                <li><a href="/hm/page/goodslist.html">商品列表</a></li>

            </ul>
        </li>
        <li><a>订单管理</a>
            <ul>
                <li><a href="/hm/mngr/orderquery.html">订单查询</a></li>
                <li><a href="/common/menuforward.html?url=/function/mngr/assessment">订单评价</a></li>

            </ul>
        </li>
        <li><a>活动管理</a>
            <ul>
                <li><a href="/hm/page/activitymanager.html">活动管理</a></li>
            </ul>
        </li>
        <li><a>用户管理</a>
            <ul>
                <li><a href="/hm/mngr/usermanager.html">用户管理</a></li>
            </ul>
        </li>
        <li><a>报表统计</a>
            <ul>
                <li><a href="/hm/page/daySalesStatistics.html">日销售统计</a></li>
                <li><a href="/hm/page/weekSalesStatistics.html">周销售统计</a></li>
                <li><a href="/hm/page/monthSalesStatistics.html">月销售统计</a></li>
                <li><a href="/hm/page/goodsSalesStatistics.html">商品销售统计</a></li>
                <li><a href="/hm/page/goodsSalesRanking.html">商品销售排行</a></li>
            </ul>
        </li>
        <li><a>系统设置</a>
            <ul>
                <li><a href="/hm/page/suggestion.html">意见反馈设置</a></li>
                <li><a href="addmenu">客服电话设置</a></li>
            </ul>
        </li>
    </ul>
</div>


