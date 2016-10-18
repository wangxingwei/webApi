<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>卡券管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />
    <style>
        .customer-table th{background:#eee;}
    </style>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">卡券管理</a></li>
    <li class="active">卡券管理</li>
</ol>
<div class="page-container">
    <form action="/hm/card/getCouponsList.html" method="post" id="submitform">
        <input type="hidden" value="${pageNo}" id="pageNo"/>
        <input type="hidden" value="${pageSize}" id="pageSize"/>
        <div class="search-layout clearfix">
            <label>登记时间:</label>
            <input type="text" placeholder="请输入开始日期"  class="timeinput form-control" name="startDate" value="${startDate}" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')">
            <label style="text-align:center;">&nbsp;~&nbsp;</label>
            <input type="text" placeholder="请输入结束日期"  name="endDate" value="${endDate}" class="timeinput form-control"   onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')">
            <input type="checkbox" value="1" name="delFlag" class="checkbox" <c:if test="${delFlag==1}">checked</c:if>/>
            <label style="text-align:left;">包含删除</label>
        </div>
        <div class="search-layout clearfix">
            <label>卡券额度:</label>
            <input type="text" name="cardMoney" value="${cardMoney}" class="form-control" pattern="\d+" title="请输入整数" />

            <label>卡券类型:</label>
            <select name="cardType" class="form-control float_left" >
                <option value="">全部</option>
                <c:forEach  items="${hmcouponstypes}" var="type">
                    <option value="${type.couponstypeid}" ${cardType==type.couponstypeid?"selected":""}>${type.couponstypename}</option>
                </c:forEach>

            </select>
            <button type="submit" class="btn btn-success" >查询</button>
            <button type="button" class="btn btn-info" onclick="javascript:window.location='/hm/card/getCouponsById.html'">新增</button>

            <button type="button" class="btn btn-danger" id="delete_btn">删除</button>
            <button type="button" class="btn btn-default" id="export">导出</button>

        </div>
    </form>
    <div class="table-responsive margin_top10">

            <table class="table table-bordered customer-table" >
                <thead>
                <tr>
                    <th><input type="checkbox" value="" id="checkAll"/>全选</th>
                    <th>卡券ID</th>
                    <th>额度(元)</th>
                    <th>卡券类别</th>
                    <th>使用限额</th>
                    <th>图片</th>
                    <th>备注</th>
                    <th>登记时间</th>
                    <th>删除时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="container">
                    <c:forEach items="${pages}" var="card">
                        <tr>
                            <td><input type="checkbox" value="${card.couponsid}"/></td>
                            <td>${card.couponsid}</td>
                            <td>${card.couponsmoney}</td>
                            <td>${card.hmcouponstype.couponstypename}</td>
                            <td>${card.couponsstartmoney}</td>
                            <td><img src="${card.couponsPic}" style="width:50px;height:50px;"/></td>
                            <td><span class="text_splice" title="${card.couponsNote}">${card.couponsNote}</span></td>
                            <td><fmt:formatDate value="${card.couponscreatedate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${card.couponsdeldate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                            <c:if test="${card.couponsdelflag != 1}">
                                <td>
                                    <a onclick="updatePackage(${card.couponsid})" class="btn btn-warning">置顶</a>
                                    <a href="/hm/card/getCouponsById.html?couponsId=${card.couponsid}" class="btn btn-default">编辑</a>
                                </td>

                            </c:if>
                            <c:if test="${card.couponsdelflag == 1}">
                                <td><a onclick="restoreActivityType(${card.couponsid})" class="btn btn-default">恢复</a></td>
                            </c:if>

                        </tr>
                    </c:forEach>

                </tbody>
            </table>


        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/card/getCouponsList.html"></w:pager>

    </div>
</div>


<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js" ></script>
<script type="text/javascript">
    $(function(){
        //全选
        checkedAll("checkAll","container");//全选按钮的ID,内容列表容器ID
        deleteFn("delete_btn","container","/hm/card/deleteCoupons.html");//删除按钮ID,内容列表容器ID,删除的请求路径

    })
    function callback(){
        $("#submitform").submit();
    }
    function restoreActivityType(id){

        if(confirm("确定恢复?")){
            $.ajax({
                url:"/hm/card/deleteCoupons.html",
                data:{
                    id:id
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {

                   $("#submitform").submit();
                },
                error:function(){
                    alert("获取数据异常！");
                }
            });

        }
    }
    function updatePackage(id){
        if(confirm("确认置顶？")){
            $.ajax({
                url:"/hm/card/sortCoupons.html",
                data:{
                    couponsId:id
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        alert("置顶成功！");
                        $("#submitform").submit();
                    }else{
                        alert("置顶失败！");
                    }
                },
                error:function(){
                    alert("获取数据异常！");
                }
            });

        }
    }
        /*$("#export").click(function(){
            var pageNo=$("#pageNo").val();
            var pageSize=$("#pageSize").val();
            console.log("pageNo"+pageNo+"pageSize:"+pageSize);
            $.ajax({
                url:"/hm/card/exportExcel.html",
                data:{pageNo:pageNo,pageSize:pageSize},
                type:'get',
                cache:false,
                dataType:'text',
                success:function(data) {
                    console.log(data);
                    if("success"==data){
                       alert("导出成功!");
                    }
                },
                error:function(){
                    alert("获取数据异常！");
                }
            });
        });*/

</script>
</body>
</html>

