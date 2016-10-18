<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>套餐管理</title>
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
    <li><a href="javascript:void(0)">套餐管理</a></li>
    <li class="active">套餐管理</li>
</ol>
<div class="page-container">
    <form action="/hm/activity/querypackagelist.html" method="post" id="submitform">
        <div class="search-layout clearfix">
            <label>套餐状态:</label>
            <select name="packagestate" class="form-control float_left" >
                <option value="">全部</option>
                <option value="1" <c:if test="${packagestate==1}">selected</c:if>>未上架</option>
                <option value="2" <c:if test="${packagestate==2}">selected</c:if>>销售中</option>
                <option value="3" <c:if test="${packagestate==3}">selected</c:if>>已下架</option>

            </select>
            <label>套餐分类:</label>
            <select name="packagetypeid" class="form-control float_left" >
                <option value="">全部</option>
               <c:forEach items="${hmpackagetypes}" var="hmpackagetype">
                    <option value="${hmpackagetype.packagetypeid}" <c:if test="${packagetypeid==hmpackagetype.packagetypeid}">selected</c:if> >${hmpackagetype.packagetypename}</option>
               </c:forEach>
            </select>
            <label>套餐名称:</label>
            <input type="text" placeholder="请输入套餐名称" name="packagename" value="${packagename}"  class="form-control" >
            <input type="checkbox" value="1" name="isdel" class="checkbox" <c:if test="${isdel==1}">checked</c:if> />
            <label style="text-align:left;">包含删除</label>

            <button type="submit" class="btn btn-success">查询</button>
        </div>
        <div class="clearfix margin_top10">
                <button type="button" class="btn btn-info" onclick="javascript:window.location='/hm/activity/querypackageinfo.html'">新增</button>
                <button type="button" class="btn btn-danger" id="delete_btn">删除</button>
                <button type="button" class="btn btn-default" id="export">导出</button>

        </div>
    </form>
    <div class="table-responsive margin_top10">

            <table class="table table-bordered customer-table" >
                <thead>
                <tr>
                    <th><input type="checkbox" value="" id="checkAll"/>全选</th>
                    <th>套餐ID</th>
                    <th>套餐名称</th>
                    <th>套餐分类</th>
                    <th>商品个数</th>
                    <th>套餐图片</th>
                    <th>套餐备注</th>
                    <th>套餐状态</th>
                    <th>上线时间</th>
                    <th>下线时间</th>
                    <th>删除时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="container">
                    <c:forEach items="${hmpackages}" var="hmpackage">
                        <tr>
                            <td><input type="checkbox" value="${hmpackage.packageid}"/></td>
                            <td>${hmpackage.packageid}</td>
                            <td>${hmpackage.packagename}</td>
                            <td>${hmpackage.hmpackagetype.packagetypename}</td>
                            <td>${hmpackage.packagegoodscount}</td>
                            <td><img src="${hmpackage.packagepic}" style="width:50px;height:50px;"/></td>
                            <td><span class="text_splice" title="${hmpackage.packageNote}">${hmpackage.packageNote}</span></td>
                            <td>
                                <c:if test="${hmpackage.packagestate==1}">未上架</c:if>
                                <c:if test="${hmpackage.packagestate==2}">销售中</c:if>
                                <c:if test="${hmpackage.packagestate==3}">已下架</c:if>
                            </td>
                            <td><fmt:formatDate value="${hmpackage.packageonlinedate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${hmpackage.packageofflinedate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${hmpackage.packagedeletedate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                            <c:if test="${hmpackage.packagedelflag != 1}">
                                <td>
                                    <a onclick="updatePackage(${hmpackage.packageid})" class="btn btn-warning">置顶</a>
                                    <a href="/hm/activity/querypackageinfo.html?packageid=${hmpackage.packageid}" class="btn btn-default">编辑</a>
                                </td>

                            </c:if>
                            <c:if test="${hmpackage.packagedelflag == 1}">
                                <td><a onclick="deleteActivityType(${hmpackage.packageid},2)" class="btn btn-default">恢复</a></td>
                            </c:if>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>


        <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/activity/querypackagelist.html"></w:pager>

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
        deleteFn("delete_btn","container","/hm/activity/detepackage.html");//删除按钮ID,内容列表容器ID,删除的请求路径

    })
    function callback(){
        $("#submitform").submit();
    }
    function deleteActivityType(id,type){
        var tip="";
        if(type==1){
            tip = "确定删除？";
        }else{
            tip = "确定恢复？\n如果该套餐所在活动类别或套餐类别无效，将一并恢复！！！";
        }
        if(confirm(tip)){
            $.ajax({
                url:"/hm/activity/detepackage.html",
                data:{
                    id:id,
                    type:type
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        if(type==1){
                            alert("删除成功！");
                        }else{
                            alert("恢复成功！");
                        }

                        $("#submitform").submit();
                    }else{
                        if(type==1){
                            alert("删除失败！");
                        }else{
                            alert("恢复失败！");
                        }
                    }
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
                url:"/hm/activity/sortpackage.html",
                data:{
                    packageid:id
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

</script>
</body>
</html>

