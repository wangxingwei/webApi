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
    </style>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="/common/menuforward.html?url=/function/mngr/meal_mange">套餐管理</a></li>
    <li class="active">套餐添加</li>
</ol>
<div class="page-container">
    <form action="/hm/activity/savepackage.html" method="post" enctype="multipart/form-data" id="form1">
        <div class="search-layout clearfix">
            <label>套餐ID:</label>
            <input type="text"   name="packageidview" value="${hmpackage.packageid}" class="form-control" disabled>
            <input type="hidden" name="packageid" value="${hmpackage.packageid}">
            <label>套餐名称:</label>
            <input type="text" placeholder="请输入套餐名称"  name="packagename" value="${hmpackage.packagename}" class="form-control" >
        </div>
        <div class="search-layout clearfix">
            <label>活动种类:</label>
            <select name="activitykindId" class="form-control float_left" required>
                <c:forEach items="${hmactivitykinds}" var="hmactivitykind">
                    <option value="${hmactivitykind.activitykindid}" <c:if test="${hmpackage.hmactivitykind.activitykindid==hmactivitykind.activitykindid}">selected</c:if> >${hmactivitykind.activitykindname}</option>
                </c:forEach>
            </select>

            <label>套餐分类:</label>
            <select name="packagetypeid" class="form-control float_left" required>
                <c:forEach items="${hmpackagetypes}" var="hmpackagetype">
                    <option value="${hmpackagetype.packagetypeid}" <c:if test="${hmpackage.hmpackagetype.packagetypeid==hmpackagetype.packagetypeid}">selected</c:if> >${hmpackagetype.packagetypename}</option>
                </c:forEach>
            </select>
            <label>套餐状态:</label>
            <select name="packagestate" class="form-control float_left" required>
                <option value="1" <c:if test="${hmpackage.packagestate==1}">selected</c:if>>未上架</option>
                <option value="2" <c:if test="${hmpackage.packagestate==2}">selected</c:if>>销售中</option>
                <option value="3" <c:if test="${hmpackage.packagestate==3}">selected</c:if>>已下架</option>

            </select>

        </div>
        <div class="search-layout clearfix margin_top10">
            <label>上线时间:</label>
            <input type="text" placeholder="请输入上线时间"  required name="packageonlinedate" value="<fmt:formatDate value="${hmpackage.packageonlinedate}" pattern="yyyy-MM-dd"></fmt:formatDate>" class="timeinput form-control"  onclick="SelectDate(this,'yyyy-MM-dd')">
            <label style="text-align:center;">&nbsp;~&nbsp;</label>
            <input type="text" placeholder="请输入下线时间"  required name="packageofflinedate" value="<fmt:formatDate value="${hmpackage.packageofflinedate}" pattern="yyyy-MM-dd"></fmt:formatDate>" class="timeinput form-control"   onclick="SelectDate(this,'yyyy-MM-dd')">

        </div>
        <div class="search-layout clearfix margin_top10">
            <label>活动大图(1080*470):</label>
            <input type="hidden" name="packagepic" value="${hmpackage.packagepic}">
            <img src="${hmpackage.packagepic}" width="100px;" height="50px">
            <input  type="file"  name="packagepicfile" >
        </div>
        <div class="search-layout clearfix margin_top10">
                <label>套餐商品ID:</label>
            <img src="/static/images/plus1.gif" style="width:22px;height:22px;margin-top:4px;" id="add_btn" class="add_btn"/>
               <%-- <c:forEach items="${hmpackage.hmpackagedetailsList}" var="hmpackagedetails">
                    <input type="text" placeholder="请输入商品ID"  name="goodsids"  onblur="checkGoodId(this)" value="${hmpackagedetails.detailsgoodsid}" class="form-control" required >
                    <span class="goodsName">${hmpackagedetails.detailsgoodsname}</span>
                </c:forEach>
                <img src="/static/images/plus1.gif" style="width:22px;height:22px;margin-top:4px;" id="add_btn" class="add_btn"/>
                <span class="red error"></span>--%>
        </div>
        <div id="package-container">
            <c:forEach items="${hmpackage.hmpackagedetailsList}" var="hmpackagedetails">
                <div class="search-layout clearfix margin_top10">
                    <label>&nbsp;</label>
                    <input type="text" placeholder="请输入商品ID"  name="goodsids"  onblur="checkGoodId(this)" value="${hmpackagedetails.detailsgoodsid}" class="form-control" required >
                    <input type="hidden" name="detailsids" value="${hmpackagedetails.detailsid}">
                    <span class="goodsName">${hmpackagedetails.detailsgoodsname}</span>
                    <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNew(this)"/>
                    <span class="red error"></span>
                </div>
            </c:forEach>
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>套餐价格:</label>
            <img class="add_btn" src="/static/images/plus1.gif" style="width:22px;height:22px;margin-top:4px;" id="add_btn3"/>
            <table class="table buy-container" style="width:700px;">
                <thead>

                    <tr>
                        <th>可购买数量</th>
                        <th>原价(元)</th>
                        <th>现价(元)</th>
                        <th>有效期(月)</th>
                        <th>移除</th>
                    </tr>
                </thead>
                <tbody id="price-layout">
                    <c:forEach items="${hmpackage.hmpackagepriceList}" var="hmpackageprice">
                        <tr>
                            <td>
                                <input type="checkbox" class="checkbox" <c:if test="${hmpackageprice.packagePriceDefault==1}">checked</c:if>  name="buyCount" onclick="checkboxClick(this)"/>
                                <input type="hidden" value="${hmpackageprice.packagePriceDefault}" name="isChecked" class="hidCheck" style="width:50px;"/>
                                <input type="hidden" value="${hmpackageprice.packagepriceid}" name="hmpackagepriceids" />
                                <input type="text"   name="packagepricecount" pattern="\d+" title="请输入整数" required class="form-control" value="${hmpackageprice.packagepricecount}" >
                            </td>
                            <td><input type="text" placeholder="请输入原价"  required name="packagepriceprice" value="${hmpackageprice.packagepriceprice}" pattern="\d+(\.\d{1,2})?" title="请输入数字，保留两位小数"  class="form-control" style="width:150px;"></td>
                            <td><input type="text" placeholder="请输入现价"  required name="packagepricenewprice" value="${hmpackageprice.packagepricenewprice}" pattern="\d+(\.\d{1,2})?" title="请输入数字，保留两位小数" class="form-control" style="width:150px;"></td>
                            <td><input type="text" placeholder="请输入有效期"  required name="validitydate" value="${hmpackageprice.packagePriceValidityDate}" pattern="\d+" title="请输入整数" class="form-control" style="width:150px;"></td>
                            <td> <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNewPrice(this)"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>详情描述(1080*190):</label>
            <img src="/static/images/plus1.gif" class="add_btn" style="width:22px;height:22px;margin-top:4px;" id="add_btn2"/>
        </div>
            <c:forEach items="${hmpackage.hmpackagepictextList}" var="hmpackagepictext">
                <div class="search-layout clearfix margin_top10">
                    <label></label>
                    <input type="hidden" name="hmpictextpics" value="${hmpackagepictext.pictextpic}">
                    <input type="hidden" name="hmpictextids" value="${hmpackagepictext.pictextid}">
                        <input type="file" value="" name="pictextpicfile"/>
                        <img src="${hmpackagepictext.pictextpic}" width="60px;" height="30px">
                    <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNew(this)"/>
                </div>
            </c:forEach>
        <div id="img-container">
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>套餐备注:</label>
            <textarea  name="packageNote" style="width:700px;height:100px;border:1px solid #ccc;" >
                ${hmpackage.packageNote}
            </textarea>

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
        <input type="hidden" name="hmpictextids" value="-1">
        <input type="hidden" name="hmpictextpics" value="">
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

