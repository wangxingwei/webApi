<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>活动管理</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="/static/css/fileinput.css" media="all" />
    <style>
        .modal-dialog {
            width: 70%;
            margin: 30px auto;
        }
    </style>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">活动管理</a></li>
    <li class="active">新增活动</li>
</ol>
<div class="page-container">
    <form class="form-horizontal" method="post" action="/hm/mngr/saveactivity.html" id="goodtypeid"  enctype="multipart/form-data">
        <input type="hidden" name="activityid" value="${activity.activityid}"/>
        <input type="hidden" name="activitygoodslist" id="activitygoodslist" value="${activity.activitygoodslist}" style="width:100%;">
        <input type="hidden" name="activityshareimg" id="activityshareimg" value="${activity.activityshareimg}" style="width:100%;">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="activitytitle"><span class="start">*</span>活动标题:</label>
            <div class="col-sm-10">
                <input type="text" class="col-sm-10 form-control" id="activitytitle" name="activitytitle" value="${activity.activitytitle}" required placeholder="请输入活动标题"/>
            </div>

        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="activitysharecontext"><span class="start">*</span>活动分享内容:</label>
            <div class="col-sm-10">
                <input type="text" class="col-sm-10 form-control" id="activitysharecontext" name="activitysharecontext" value="${activity.activitysharecontext}" required placeholder="请输入活动分享展示内容"/>
            </div>

        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="activityshareurl"><span class="start">*</span>活动分享链接:</label>
            <div class="col-sm-10">
                <input type="text" class="col-sm-10 form-control" id="activityshareurl" name="activityshareurl" value="${activity.activityshareurl}" required placeholder="请输入活动活动分享链接"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="activityshareimgfile"><span class="start">*</span>活动分享logo:</label>
            <div class="col-sm-10">
                <img src="${activity.activityshareimg}" width="50px" height="50px">
                <input type="file" id="activityshareimgfile" name="activityshareimgfile">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="activityheadimagefile"><span class="start">*</span>活动海报图(800*600):</label>
            <div class="col-sm-10">
                <img src="${activity.activityheadimage}" width="50px" height="50px">
                <input type="file" id="activityheadimagefile" name="activityheadimagefile">
                <input type="hidden" name="activityheadimage" value="${activity.activityheadimage}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="activityheadimageurl">海报图链接:</label>
            <div class="col-sm-10">
                <input type="text" class="col-sm-10 form-control" id="activityheadimageurl" name="activityheadimageurl" value="${activity.activityheadimageurl}" placeholder="请输入活动图连接url"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="activitytitlefile"><span class="start">*</span>活动标题背景图:</label>
            <div class="col-sm-10">
                <img src="${activity.activitytitleurl}" width="50px" height="50px">
                <input type="file" id="activitytitlefile" name="activitytitlefile">
                <input type="hidden" name="activitytitleurl" value="${activity.activitytitleurl}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="activitycontext"><span class="start">*</span>活动详情:</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="activitycontext" name="activitycontext" required placeholder="请输入活动标题">${activity.activitycontext}</textarea>
            </div>

        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="activitystate"><span class="start">*</span>活动状态:</label>
            <div class="col-sm-10">
                <select class="col-sm-10 form-control" name="activitystate" id="activitystate">
                    <option value="1" <c:if test="${activity.activitystate == 1}">selected</c:if>>有效</option>
                    <option value="0" <c:if test="${activity.activitystate == 0}">selected</c:if>>无效</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >商品:</label>
            <div class="col-sm-10" >
                <div id="goods-container" style="margin-bottom:10px;">
                    <c:forEach items="${activity.hmgoodses}" var="goods">
                        <span id="${goods.goodsid}" class="timeline-panel">${goods.goodsname}<b onclick="removeTab(this)">×</b></span>
                    </c:forEach>
                </div>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">添加商品</button>
            </div>
        </div>
        <div id="form-container">
            <c:forEach items="${activity.images}" var="image">
                <div class="form-group">
                    <label class="col-sm-2 control-label" >活动图片:</label>
                    <div class="col-sm-5">
                            <img src="${image}" width="50px" height="50px">
                            <input type="hidden" name="activityimageurl" value="${image}">
                            <input type="file" name="activityimage">
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-info" onclick="deleteNew(this)">删除</button>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="activityimagetype">图片大小类型：</label>
            <div class="col-sm-10">
                <select name="activityimagetype" id="activityimagetype" class="col-sm-10 form-control">
                    <option value="L" <c:if test="${activity.activityimagetype=='L'}">selected</c:if>  >横版大图</option>
                    <option value="M" <c:if test="${activity.activityimagetype=='M'}">selected</c:if>  >切块小图</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2 col-sm-offset-2">
                <button type="button" class="btn btn-success" onclick="addNew()" >添加图片</button>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-2 col-xs-8 col-xs-offset-4">

                <button type="submit" class="btn btn-primary" style="width:100px;height:40px;font-size:16px;">保&nbsp;&nbsp;存</button>

            </div>
        </div>
    </form>
</div>
<!-- 添加商品弹窗开始 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加商品
                </h4>

            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="winForm" role="form" method="post" action="">
                    <div class="row">
                        <div class="col-sm-1 col-md-2 col-lg-1">
                            <label>名称:</label>
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3">
                            <input type="text" class="form-control" id="goodsname" name="goodsname"
                                   placeholder="请输入商品名称" value="" >
                        </div>
                        <div class="col-sm-1 col-md-1 col-lg-1">
                            <label>类别:</label>
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3">
                            <select class="form-control" name="gooodstype" id="gooodstype">
                                <option value="">请选择商品类别</option>
                                <c:forEach items="${hmgoodstypes}" var="hmgoodstype">
                                    <option value="${hmgoodstype.goodstypeid}">${hmgoodstype.goodstypetypename}</option>
                                </c:forEach>
                            </select>
                        </div>
                            <div class="col-sm-3">

                                <button type="button" class="btn btn-success" onclick="showData(1)">查询</button>
                                <button type="button" class="btn btn-info" id="add_btn">添加</button>
                            </div>
                        </div>
                    </form>
                    <div class="table-responsive">
                        <table class="table table-hover" >
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll"/>全选</th>
                                <th>商品编码</th>
                                <th>商品名称</th>
                                <th>商品类别</th>
                                <th>商品单价(元)</th>
                            </tr>
                            </thead>
                            <tbody id="container">

                            </tbody>
                        </table>
                        <div id="pagination" style="margin-top:20px;margin-left:50%;"></div>
                    </div>

                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 添加商品弹窗结束 -->
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/checkAll.js" ></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/js/fileinput.js"></script>
<script type="text/javascript" src="/static/js/fileinput_locale_zh.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        //全选
        checkedAll("checkAll","container");//全选按钮的ID,内容列表容器ID

        $('#myModal').on('show.bs.modal', function () {
            $("#goodsname").val("");
            $("#gooodstype").val("");
            $("#container").html("");
            $("#checkAll").attr("checked",false);
            flag=false;
        });
    })

    function addNew(){
        var areaDiv = document.getElementById("treeTemplate").innerHTML;
        $("#form-container").append(areaDiv);
    }
    function deleteNew(obj){
        $(obj).parent().parent().remove();
    }
    //商品添加
    $("#add_btn").click(function() {
        var subId = new Array();
        var goodsName=new Array();
        var goodsId2=new Array();
        var goodsId=$("#activitygoodslist").val();
        var checkboxs = $("#container").find("[type='checkbox']");
        for (var i = 0; i < checkboxs.length; i++) {
            if (checkboxs[i].checked) {
                subId.push(checkboxs[i].value);
            }
        }
        var a=goodsId.split(",");
        var b=subId;
        var c=[];
        for(var i in a){
            c[a[i]]=a[i];
        }
        for(var i in b){
            if(c[b[i]]){
                delete c[b[i]];
            }else{
                c[b[i]]=b[i];
                goodsId2.push(b[i]);
            }
        }
        for(var n=0;n<goodsId2.length;n++){
            var goodsArray=[];
            var name=$("#"+goodsId2[n]).parent().parent().find("#goods_name").html();
            goodsArray.push(goodsId2[n],name);
            goodsName.push(goodsArray);
        }
        var html="";
        if(goodsId!=null && goodsId!=""){
            if(goodsId2!=null && goodsId2.length>0){
                var goods_ids=goodsId2.join(",");
                $("#activitygoodslist").val(goodsId+","+goods_ids);
            }
        }else{
            if(subId!=null && subId.length>0) {
                var goods_ids = subId.join(",");
                $("#activitygoodslist").val(goods_ids);
            }
        }

        $.each(goodsName,function(i,item){
            html+="<span id='"+item[0]+"' class='timeline-panel'>"+item[1]+"<b onclick='removeTab(this)'>×</b></span>";
        });

        $("#goods-container").append(html);
        $('#myModal').modal('hide');
    })

    var pageNo= 1,pageSize=10;
    //查询
    function showData(pageNo){
        var goodsname=$("#goodsname").val();
        var goodstype=$("#gooodstype").val();
        $.ajax({
            url:"/hm/page/goodslistquery.html",
            type:"post",
            data: {goodsname: goodsname, gooodstype: goodstype, pageNo: pageNo, pageSize: pageSize},
            success:function(data){
                var option=JSON.parse(data);
                if(option.status=='success' && option.result.object.length>0){
                    var totalCount=option.result.totalCount;
                    var pageNo=option.result.pageNo;
                    var pageSize=option.result.pageSize;
                    var pageCount=Math.ceil(totalCount/pageSize);
                    showPages(pageCount,pageNo);//显示分页
                    var html="";
                    $.each(option.result.object,function(i,item){

                        if(item.goodsid){
                            html+="<tr><td><input type='checkbox' value='"+item.goodsid+"' id='"+item.goodsid+"'/></td>";
                            html+="<td>"+item.goodsbarcode+"</td>"+"<td id='goods_name'>"+item.goodsname+"</td>";
                            if(item.hmgoodstype!=null){
                                html+="<td>"+item.hmgoodstype.goodstypetypename+"</td>";
                            }else{
                                html+="<td>&nbsp;</td>";
                            }
                            html+="<td>"+item.goodsprice+"</td>";

                            html+="</tr>";
                        }
                    })
                    $("#container").html(html);
                }else{
                    $("#container").html("<tr><td colspan='5'><h2 style='text-align:center;'>暂无数据!</h2></td></tr>");

                    $("#pagination").html("");
                }
            },
            error:function(){
                alert("请求失败!");
            }
        });
    }
    //商品移出
    function removeTab(obj){
        var activitygoodslist=$("#activitygoodslist").val();
        var g=activitygoodslist.split(",");
        var goodId=$(obj).parent().attr("id");
        for(var i=0;i< g.length;i++){
            if(g[i]==goodId){
                delete g[i];
            }
        }
        $(obj).parent().remove();
        var newsGoodId=new Array();
        for(var i=0;i< g.length;i++) {
            if(g[i]!=null && g[i]!=""){
                newsGoodId.push(g[i]);
            }
        }
        $("#activitygoodslist").val(newsGoodId);
    }


</script>
<script type="text/template" id="treeTemplate">
    <div class="form-group">
        <label class="col-sm-2 control-label" >活动图片(540*620):</label>
        <div class="col-sm-5">
            <input type="hidden" name="activityimageurl" value="">
            <input type="file"  name="activityimage">
        </div>
        <div class="col-sm-2">
            <button type="button" class="btn btn-info" onclick="deleteNew(this)">删除</button>
        </div>
    </div>
</script>

</body>
</html>
