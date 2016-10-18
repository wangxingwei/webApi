<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品分类</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">商品分类管理</a></li>
    <li class="active">商品分类</li>
</ol>
<div class="page-container">
    <form action="/hm/mngr/goodstypequery.html" method="post" id="goodtypeid">
        <div class="row">
                <div class="col-sm-1">
                    <label>代码:</label>
                </div>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="goodstypetypecode" name="goodstypetypecode"
                           placeholder="请输入类别代码" value="${goodstypetypecode}" >
                </div>
                <div class="col-sm-1">
                    <label>名称:</label>
                </div>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="goodstypetypename" name="goodstypetypename"
                           placeholder="请输入类别名称" value="${goodstypetypename}" >
                </div>
                <label class="col-sm-2 col-md-2 control-label">首页推荐:</label>
                <div class="col-sm-2">
                    <select name="goodstypeshowindex" class="form-control">
                        <option value="">全部</option>
                        <option value="1" ${goodstypeshowindex=="1"?"selected":""}>是</option>
                        <option value="0" ${goodstypeshowindex=="0"?"selected":""}>否</option>
                    </select>
                </div>
                <div class="col-sm-1">
                    <input type="submit" class="btn btn-success" value="查询"/>
                </div>
        </div>
    </form>
    <div class="table-responsive">
        <c:if test="${fn:length(hmgoodstypes)>0}">
            <table class="table table-hover" >
                <thead>
                <tr>
                    <th>序号</th>
                    <th>类别代码</th>
                    <th>类别名称</th>
                    <th>描述</th>
                    <th>图片</th>
                    <th>首页推荐</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="container">
                    <c:forEach items="${hmgoodstypes}" var="hmgoodstype" varStatus="_status">
                        <tr>
                            <td>${_status.index+1}</td>
                            <td>${hmgoodstype.goodstypetypecode}</td>
                            <td>${hmgoodstype.goodstypetypename}</td>
                            <td>${hmgoodstype.goodstypedescribe}</td>
                            <td><img src="${hmgoodstype.goodstypepicurl}" style="width:50px;height:50px;"/></td>
                            <td>
                                <c:if test="${hmgoodstype.goodstypeshowindex == 1}">
                                    是
                                </c:if>
                                <c:if test="${hmgoodstype.goodstypeshowindex != 1}">
                                    否
                                </c:if>
                            </td>
                            <td>
                                <button type="button" class="btn btn-info" onclick="javascript:window.location='/hm/page/goodtypemodeify.html?id=${hmgoodstype.goodstypeid}'">编辑</button>&nbsp;
                                <button type="button" class="btn btn-info" onclick="updateGoodtype(${hmgoodstype.goodstypeid},${hmgoodstype.goodstypeshowindex})">
                                <c:if test="${hmgoodstype.goodstypeshowindex == 1}">
                                    取消首页推荐
                                </c:if>
                                <c:if test="${hmgoodstype.goodstypeshowindex != 1}">
                                    推荐至首页
                                </c:if>
                                </button>&nbsp;
                                <button type="button" class="btn btn-danger" onclick="deleteGoodtype(${hmgoodstype.goodstypeid})">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

         <w:pager pageNo="${pageNo}" recordCount="${totalCount}" url="/hm/mngr/goodstypequery.html"></w:pager>

    </div>
</div>

<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript">
    function deleteGoodtype(id){
        if(confirm("确认删除")){
            $.ajax({
                url:"/hm/mngr/deletegoodtype.html",
                data:{
                    id:id
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        alert("删除成功！");
                        $("#goodtypeid").submit();
                    }else{
                        alert("删除失败！");
                    }
                },
                error:function(){
                    alert("获取数据异常！");
                }
            });

        }
    }
    function updateGoodtype(id,state){
        var state_s = "推荐到首页";
        if(state==1){
            state =0;
            state_s = "取消首页推荐";
        }else{
            state = 1;
        }
        if(confirm("确认"+state_s)){
            $.ajax({
                url:"/hm/mngr/updategoodstype.html",
                data:{
                    id:id,
                    state:state
                },
                type:'post',
                cache:false,
                dataType:'text',
                success:function(data) {
                    if("success"==data){
                        alert("操作成功！");
                        $("#goodtypeid").submit();
                    }else{
                        alert("操作失败！");
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

