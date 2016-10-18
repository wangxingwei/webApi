<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>促销活动添加</title>
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
    <li><a href="javascript:void(0)">活动管理</a></li>
    <li><a href="/common/menuforward.html?url=/function/mngr/sale_activity">促销活动</a></li>
    <li class="active">促销活动添加</li>
</ol>
<div class="page-container">
    <form action="" method="post" >
        <div class="search-layout clearfix margin_top10">
            <label>活动ID:</label>
            <input type="text"   name="" value="" class="form-control" disabled>
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>活动名称:</label>
            <input type="text" placeholder="请输入活动名称"  name="" class="form-control" required  title="请输入名称">
            <label>活动状态:</label>
            <select name="" class="form-control float_left" >
                <option value="1">未开始</option>
                <option value="2">进行中</option>
                <option value="3">已结束</option>
            </select>
        </div>

        <div class="search-layout clearfix margin_top10">
            <label>活动时间:</label>
            <input type="text" placeholder="请输入开始日期"  class="timeinput form-control"  required onclick="SelectDate(this,'yyyy-MM-dd')">
            <label style="text-align:center;">&nbsp;~&nbsp;</label>
            <input type="text" placeholder="请输入结束日期"  class="timeinput form-control"   required onclick="SelectDate(this,'yyyy-MM-dd')">
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>活动形式:</label>
            <select name="" class="form-control float_left" id="activityType">
                <option value="0" selected>满减</option>
                <option value="1">满赠(固定额)</option>
                <option value="2">满赠(百分比)</option>
            </select>
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>活动配置:</label>
            <div class="activityConfig select_config" id="activityConfig1">
                <span style="">会员等级:</span>
                <select  class="form-control float_left">
                    <option value="" selected>全部</option>
                </select>
                <span>满&nbsp;</span>
                <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
                <span>元&nbsp;</span>
                <span>减&nbsp;</span>
                <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
                <span>元&nbsp;</span>
                <img src="/static/images/plus1.gif" style="width:22px;height:22px;margin-top:4px;" class="add_btn" id="add_btn1" onclick="addBtnClick(1)"/>

            </div>
            <div class="activityConfig select_config" id="activityConfig2" style="display:none;">
                <span style="">会员等级:</span>
                <select  class="form-control float_left"  >
                    <option value="" selected>全部</option>
                </select>
                <span>满&nbsp;</span>
                <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
                <span>元&nbsp;</span>
                <span>赠&nbsp;</span>
                <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
                <span>元&nbsp;</span>
                <img src="/static/images/plus1.gif" style="width:22px;height:22px;margin-top:4px;" class="add_btn" id="add_btn2" onclick="addBtnClick(2)"/>
            </div>
            <div class="activityConfig select_config" id="activityConfig3" style="display:none;">
                <span style="">会员等级:</span>
                <select  class="form-control float_left"  >
                    <option value="" selected>全部</option>
                </select>
                <span>满&nbsp;</span>
                <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
                <span>元&nbsp;</span>
                <span>赠&nbsp;</span>
                <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
                <span>%&nbsp;</span>
                <img src="/static/images/plus1.gif" style="width:22px;height:22px;margin-top:4px;" class="add_btn" id="add_btn3" onclick="addBtnClick(3)"/>
            </div>

        </div>
        <div id="activity_config">
        </div>

        <div class="search-layout clearfix margin_top10">
            <label>活动头图:</label>
            <input type="file" value=""/>
        </div>

        <div class="search-layout clearfix margin_top10">
            <label>详情描述:</label>
            <textarea  name="" style="width:700px;height:250px;border:1px solid #ccc;" >

            </textarea>

        </div>
        <div class="search-layout clearfix margin_top10">
            <label>活动备注:</label>
            <textarea  name="" style="width:700px;height:100px;border:1px solid #ccc;" >

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
    $("#activityType").change(function(){
        var type=$(this).val();
        $(".select_config").eq(type).show().siblings(".select_config").hide();
        $("#activity_config").html("");
    });
    $(".add_btn").hover(function(){
        $(this).attr("src","/static/images/plus2.gif");
    },function(){
        $(this).attr("src","/static/images/plus1.gif");
    });
    function addBtnClick(id){
       var areaDiv = document.getElementById("template"+id).innerHTML;
       $("#activity_config").append(areaDiv);
    }
    function deleteNew(obj){
        $(obj).parent().parent().remove();
    }

</script>
<script type="text/template" id="template1">
    <div class="search-layout clearfix margin_top10">
        <label>&nbsp;</label>
        <div class="activityConfig">
            <span style="">会员等级:</span>
            <select  class="form-control float_left" >
                <option value="" selected>全部</option>
            </select>
            <span>满&nbsp;</span>
            <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
            <span>元&nbsp;</span>
            <span>减&nbsp;</span>
            <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
            <span>元&nbsp;</span>
            <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNew(this)"/>

        </div>
    </div>
</script>
<script type="text/template" id="template2">
    <div class="search-layout clearfix margin_top10">
        <label>&nbsp;</label>
        <div class="activityConfig" >
            <span style="">会员等级:</span>
            <select  class="form-control float_left"  >
                <option value="" selected>全部</option>
            </select>
            <span>满&nbsp;</span>
            <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
            <span>元&nbsp;</span>
            <span>赠&nbsp;</span>
            <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
            <span>元&nbsp;</span>
            <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNew(this)"/>
        </div>
    </div>
</script>
<script type="text/template" id="template3">
    <div class="search-layout clearfix margin_top10">
        <label>&nbsp;</label>
        <div class="activityConfig">
            <span style="">会员等级:</span>
            <select  class="form-control float_left" >
                <option value="" selected>全部</option>
            </select>
            <span>满&nbsp;</span>
            <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
            <span>元&nbsp;</span>
            <span>赠&nbsp;</span>
            <input type="text" name="" value="" pattern="\d+" title="请输入整数" required style="width:100px;"/>
            <span>%&nbsp;</span>
            <img src="/static/images/minus.gif" style="width:22px;height:22px;margin-top:4px;" onclick="deleteNew(this)"/>
        </div>
    </div>
</script>

</body>
</html>

