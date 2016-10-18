<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>套餐添加</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />
    <style>
        .customer-table th{background:#eee;}
        .search-layout label{width:100px;text-align:right;}
    </style>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="/common/menuforward.html?url=/function/mngr/user_mange">用户管理</a></li>
    <li class="active">用户编辑</li>
</ol>
<div class="page-container">
    <form action="" method="post"  id="form1">
        <div class="search-layout clearfix">
            <label>用户ID:</label>
            <input type="text"   name="userid" value="1001" class="form-control" disabled>
            <input type="hidden" name="userid" value="1001">
            <label>用户电话:</label>
            <input type="text"   value="18201114642" class="form-control" disabled>
            <input type="hidden"  name="phonenumber" value="18201114642" class="form-control" >
            <label>用户昵称:</label>
            <input type="text"    value="上歪歪" class="form-control" disabled>
            <input type="hidden"   name="username" value="上歪歪" class="form-control" >
        </div>
        <div class="search-layout clearfix">
            <label>登录城市:</label>
            <input type="text"    value="北京,上海,天津" class="form-control" disabled style="width:35%;">
            <input type="hidden"    name="logincity" value="北京&上海&天津" class="form-control">

        </div>
        <div class="search-layout clearfix">
            <label>终端机型:</label>
            <input type="text"    value="iphone6s" class="form-control" disabled/>
            <input type="hidden"    name="terminal" value="iphone6s" class="form-control">
            <label>版本号:</label>
            <input type="text"    value="v.001" class="form-control" disabled>
            <input type="hidden"  name="version" value="v.001" class="form-control">
        </div>
        <div class="search-layout clearfix">
            <label>最后登录版本:</label>
            <input type="text"    value="v.001" class="form-control" disabled>
            <input type="hidden"  name="version" value="v.001" class="form-control">
            <label>最后登录时间:</label>
            <input type="text"    value="2015-11-16 18:23:12" class="form-control" disabled>
            <input type="hidden"  name="logintime" value="2015-11-16 18:23:12" class="form-control">
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>用户等级:</label>
            <select name="userlevel" class="form-control float_left" required>
                <option value="钻石">钻石</option>
                <option value="金">金</option>
                <option value="银">银</option>
                <option value="铜">铜</option>

            </select>
            <label>用户状态:</label>
            <select name="userstate" class="form-control float_left" required>
                <option value="1">激活</option>
                <option value="2">半休眠</option>
                <option value="3">休眠</option>
                <option value="4">黑名单</option>
            </select>
        </div>
        <div class="search-layout clearfix margin_top10">
                <label>送货信息:</label>
        </div>
        <div id="package-container">
            <div class="search-layout clearfix margin_top10">
                 <label>&nbsp;</label>
                 <span class="span">收货人:</span>
                 <input type="text" placeholder="请输入收货人"  name="receivingname"   value="李小雅" class="form-control" required >
                 <span class="span">收货电话:</span>
                 <input type="text" placeholder="请输入收货电话"  name="receivingphone"   value="李小雅" class="form-control" required >
                 <span class="span">收货地址:</span>
                 <input type="text" placeholder="请输入收货地址"  name="receivingaddress"   value="北京市海淀区" class="form-control" required >
            </div>
            <div class="search-layout clearfix margin_top10">
                <label>&nbsp;</label>
                <span class="span">收货人:</span>
                <input type="text" placeholder="请输入收货人"  name="receivingname"   value="李大雅" class="form-control" required >
                <span class="span">收货电话:</span>
                <input type="text" placeholder="请输入收货电话"  name="receivingphone"   value="李大雅" class="form-control" required >
                <span class="span">收货地址:</span>
                <input type="text" placeholder="请输入收货地址"  name="receivingaddress"   value="北京市海淀区" class="form-control" required >
            </div>

        </div>

        <div class="margin_top20 margin_bottom20">
            <button type="submit" class="btn btn-primary" id="submitBtn" style="width:150px;margin-left:80px;">保存</button>
        </div>
    </form>

</div>


<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>
<script type="text/javascript">
    $(".add_btn").hover(function(){
        $(this).attr("src","/static/images/plus2.gif");
    },function(){
        $(this).attr("src","/static/images/plus1.gif");
    });
    $("#add_btn").click(function(){
        var areaDiv = document.getElementById("template").innerHTML;
        $("#package-container").append(areaDiv);
    });
    $("#add_btn2").click(function(){
        var areaDiv = document.getElementById("template2").innerHTML;
        $("#img-container").append(areaDiv);
    });
    $("#add_btn3").click(function(){
        var areaDiv = document.getElementById("priceTemplate").innerHTML;
        $("#price-layout").append(areaDiv);
    });
   /* $("#submitBtn").click(function(){

        $("#form1").submit();
    });*/

    function deleteNew(obj){
        $(obj).parent().remove();
    }
    function deleteNewPrice(obj){
        $(obj).parent().parent().remove();
    }
    function checkboxClick(obj){

       $(obj).attr("checked","checked").parent().parent().siblings("tr").find(".checkbox").attr("checked",false);
        $(obj).siblings(".hidCheck").val(1).parent().parent().siblings("tr").find(".hidCheck").val(0);
    }
    function checkGoodId(obj){
        $(obj).parent().find(".error").html("");
        $(obj).parent().find(".goodsName").html("");
        $(obj).removeClass("nonexistence");
        var id=$(obj).val();
        $.ajax({
            url:"/hm/mngr/getgoodsname.html",
            type:"get",
            data:{id:id},
            dataType:"text",
            success:function(result){

                if(result==""){
                    $(obj).addClass("nonexistence");
                    $(obj).parent().find(".error").html("该商品不存在!");
                }else{
                    $(obj).parent().find(".goodsName").html(result);
                }
            },
            error:function(){
                alert("请求失败!");
            }
        })
    }

</script>
<script type="text/template" id="template">
    <div class="search-layout clearfix margin_top10">
        <label>&nbsp;</label>
        <input type="text" placeholder="请输入商品ID"  name="goodsids" class="form-control" onblur="checkGoodId(this)" required>
        <input type="hidden" name="detailsids" value="-1">
        <span class="goodsName"></span>
        <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNew(this)"/>
        <span class="red error"></span>
    </div>
</script>
<script type="text/template" id="template2">
    <div class="search-layout clearfix margin_top10">
        <label>&nbsp;</label>
        <input type="file"   name="pictextpicfile"  required>
        <input type="hidden" nam="hmpictextids" value="-1">
        <input type="hidden" nam="hmpictextpics" value="">
        <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNew(this)"/>
    </div>
</script>
<script type="text/template" id="priceTemplate">
    <tr>
        <td>
            <input type="checkbox" class="checkbox"  name="buyCount" onclick="checkboxClick(this)"/>
            <input type="hidden" value="0" name="isChecked" class="hidCheck" style="width:50px;"/>
            <input type="hidden" value="-1" name="hmpackagepriceids" />
            <input type="text"   name="packagepricecount" pattern="\d+" title="请输入整数" required class="form-control" value="1" >
        </td>
        <td><input type="text" placeholder="请输入原价"  required name="packagepriceprice" pattern="\d+(\.\d{1,2})?" title="请输入数字，保留两位小数"  class="form-control" style="width:150px;"></td>
        <td><input type="text" placeholder="请输入现价"  required name="packagepricenewprice" pattern="\d+(\.\d{1,2})?" title="请输入数字，保留两位小数" class="form-control" style="width:150px;"></td>
        <td><input type="text" placeholder="请输入有效期"  required name="validitydate" pattern="\d+(\.\d{1,2})?" title="请输入数字，保留两位小数" class="form-control" style="width:150px;"></td>
        <td> <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNewPrice(this)"/></td>
    </tr>
</script>
</body>
</html>

