<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品销售统计</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .bar select,.bar input{border:1px solid #ccc;height:25px;}
        #btn-search{height:25px;padding:0px 15px;color:#fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
            margin-left:10px;
        }
        #btn-search:hover{background-color: #4cae4c;}
        .listbox
        {
            width: 100%;
            height: 170px;
            border: 1px solid #c0c0c0;
        }
        .btnn
        {
            width: 44px;
            height: 22px;
            border: 1px solid #c0c0c0;
            background-color: #f0f0f0;
        }
        #btnup,#btndown{
            width: 22px;
            padding:0;
        }
        .dropweek
        {
            width: 220px;
            height: 26px;
            margin-top:-3px;
            border: 1px solid #c0c0c0;
        }
        .laydate_table,.laydate_m{
            display:none;
        }
    </style>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">统计分析</a></li>
    <li class="active">商品销售统计</li>
</ol>
<div class="page-container">

    <div class="bar" style="margin-top:20px;">
        <div style="float:left;">
            <select name="statis" id="statis">
                <option value="" selected>请选择统计类型</option>
                <option value="1">按日统计</option>
                <option value="2">按周统计</option>
                <option value="3">按月统计</option>
            </select>
        </div>
        <div style="float:left;">
            <div class="dateBox" id="dateBox1" style="margin-left:10px;display:none">
                <input placeholder="请输入开始日期"  class="startDate timeinput" style="width:150px;"  onclick="SelectDate(this,'yyyy-MM-dd')">
                至
                <input placeholder="请输入结束日期"  class="endDate timeinput" style="width:150px;"  onclick="SelectDate(this,'yyyy-MM-dd')">
            </div>
        </div>
        <div style="float:left;">
            <div class="dateBox" id="dateBox2" style="display:none;;margin-left:10px;">
                <input id="txt2" type="text"  value="" class="cusdate"/>
                <select name="dropweek" id="dropweek" class="dropweek">
                </select>
            </div>
        </div>
        <div style="float:left;">
            <div class="dateBox" id="dateBox3" style="display:none;margin-left:10px;">
                <input placeholder="请输入年份"  class="timeinput" id="monthDate" style="width:150px;"  onclick="SelectDate(this,'yyyy')">

            </div>
        </div>



         <button id="btn-search" class=""  onclick="showData()">查询</button>

    </div>

    <div id="chart"  style="height:350px;width:100%;margin:10px auto;"></div>
    <div class="table-responsive">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>序号</th>
                <th>销量</th>
                <th>日期</th>
            </tr>
            </thead>
            <tbody id="container">

            </tbody>
        </table>

        <div class="pageLayout">
            每页显示
            <select name="pageSize" id="pageSize" onchange="javascript:showData(1);" style="border:1px solid #ccc;">
                <option value="5">5</option>
                <option value="10" selected>10</option>
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="50">50</option>
            </select>
        </div>
        <div id="pagination" style="margin-left:60%;margin-top:20px;"></div>


    </div>
    <!--时间月份选择框开始-->

    <div id="dateLayout" style="display: none; height: 222px; width: 150px; position: absolute">
        <div style="width: 100%; height: 28px;background-color: #f0f0f0;">
            <table style="width: 100%">
                <tr>
                    <td >
                        <input id="btnup" type="button" class="btnn" value="<<" />
                    </td>
                    <td>
                        <input id="btndown" type="button" value=">>" class="btnn" />
                    </td>

                    <td >
                        <input id="btnhide" type="button" class="btnn" value="确定" />
                    </td>
                    <td >
                        <input id="btncancel" type="button" class="btnn" value="清除" />
                    </td>

                </tr>
            </table>
        </div>
        <div style="width: 100%; height: 150px;">
            <select size="10" name="listyymm" id="listyymm" class="listbox">
            </select>
        </div>
    </div>

    <!--时间月份选择框结束-->
</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/date_week.js"></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>
<script src="/static/frame/echarts/dist/echarts.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript">
        var pageNo= 1,pageSize=10,dataType=4;

        var option = {
            title: {
                x: 'center',
                text: '商品销量统计'
            },
            tooltip: {
                show: true
            },
            legend: {
                y: 30,
                data:['销量']
            },
            toolbox: {
                show : true,
                feature : {
                    dataZoom : {show: true},
                    dataView : {show: true},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            dataZoom : {
                show : true,
                realtime : true,
                start : 0,
                end : 100
            },
            xAxis : [
                {
                    type : 'category',
                    data : []
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    "name":"销量",
                    "type":"bar",
                    "itemStyle": {
                        "normal": {
                            "label":{
                                show:true
                            }
                        }
                    },

                    "data":[]
                }
            ]
        };
        $("#statis").change(function(e){
            var dateType=$("#statis").find("option:selected").val();
            if(dateType==1){//按日统计
                $("#dateBox1").css("display","block");
                $("#dateBox2").css("display","none");
                $("#dateBox3").css("display","none");
                clearData();
            }else if(dateType==2){//按周统计
                $("#dateBox1").css("display","none");
                $("#dateBox3").css("display","none");
                $("#dateBox2").css("display","inline-block");
                clearData();

            }else if(dateType==3){//按月统计
                $("#txt1").val(new Date().getFullYear());
                $("#dateBox3").css("display","inline-block");
                $("#dateBox1").css("display","none");
                $("#dateBox2").css("display","none");
                $("#dateLayout").css("display","none");
                clearData();
            }else{
                $("#dateBox3").css("display","none");
                $("#dateBox1").css("display","none");
                $("#dateBox2").css("display","none");
                $("#dateLayout").css("display","none");
                clearData();
            }
        });
        function clearData(){
            $("#dateBox1").find(".startDate").val("");
            $("#dateBox1").find(".endDate").val("");
            $("#txt2").val("");
            $("#dropweek").val("");
            $("#monthDate").val("");
        }
        showData(pageNo,dataType);

        function showData(pageNo,dateType){

            require.config({
                paths: {
                    echarts: '/static/frame/echarts/dist'
                }
            });
            require(
                    [
                        'echarts',
                        'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                        'echarts/chart/bar'
                    ],
                    function (ec) {

                        pageSize=$("#pageSize").val();
                        var dateType=$("#statis").find("option:selected").val();
                        var xweek="";

                        var startDate="",endDate="",monthDate="";

                        if(dateType==1){//按日
                            startDate= $("#dateBox1").find(".startDate").val();
                            endDate=$("#dateBox1").find(".endDate").val();
                            if(!checkDate(startDate,endDate)){
                                return;
                            }

                            //alert("按日startDate:"+startDate+",endDate:"+endDate);
                        } else if(dateType==2){//按周
                            var week=$("#dropweek").find("option:selected").text();
                            var week_year=$("#txt2").val();
                            if(week_year==""){
                                alert("请选择周!");
                                return;
                            }
                            startDate=week_year.substring(0,4)+"-"+week.substring(4,6)+"-"+week.substring(7,9);
                            endDate=week_year.substring(0,4)+"-"+week.substring(11,13)+"-"+week.substring(14,16);
                            xweek=week_year.substring(0,4)+"年"+week.substring(4,6)+"月"+week.substring(7,9)+"日"+"-"+week_year.substring(0,4)+"年"+week.substring(11,13)+"月"+week.substring(14,16)+"日";
                            //alert("按周startDate:"+startDate+",endDate:"+endDate+",xweek:"+xweek);
                        }else if(dateType==3){//按月
                            monthDate= $("#monthDate").val();
                            if(monthDate==""){
                                alert("请输入年份!");
                                return;
                            }
                        }

                        var myChart = ec.init(document.getElementById('chart'));
                        myChart.showLoading({text: "数据加载中......"});
                        $.ajax({
                            url: "/hm/page/goodsSalesStatistics.html",
                            type: "get",
                            data: {startDate: startDate, endDate: endDate,monthDate:monthDate,type:dateType,pageNo:pageNo,pageSize:pageSize},
                            success: function (data) {
                                var data = JSON.parse(data);
                                console.log(data);
                                myChart.hideLoading();
                                if (data.status=="success" && data.result.object.length > 0) {
                                    var totalCount=data.result.totalCount;
                                    var pageNo=data.result.pageNo;
                                    var pageSize=data.result.pageSize;
                                    var pageCount=Math.ceil(totalCount/pageSize);
                                    var seriesData=new Array();
                                    var xData=new Array();
                                    showPages(pageCount,pageNo,dataType);//显示分页
                                    var dateHtml="";
                                    $.each(data.result.object,function(i,item){
                                        if(item[0]!=null && item[0]!=""){
                                            seriesData.push(parseInt(item[1]));
                                            if(dateType==2){//按周
                                                xData.push(xweek);
                                                item[0]=xweek;
                                            }else if(dateType==3){//按月
                                                xData.push(item[0]+"月");
                                                item[0]=item[0]+"月";
                                            }else{//按日
                                                xData.push(item[0]);
                                            }
                                            var trHtml = '<tr>';
                                            trHtml += "<td>"+(pageSize*(pageNo-1)+(i+1))+"</td><td>"+item[1]+"</td>" +
                                                    "<td>"+item[0]+"</td>";
                                            dateHtml+=trHtml;
                                        }
                                    });
                                    option.xAxis[0].data=xData;
                                    option.series[0].data=seriesData;
                                    myChart.setOption(option);
                                    $("#container").html(dateHtml);
                                    $(".pageLayout").css("display","block");

                                } else {
                                    $("#container").html("<tr><td colspan='3'><h2 style='text-align:center;'>暂无数据!</h2></td></tr>");
                                    $("#chart").html("<h2 style='text-align:center;'>暂无数据!</h2>");
                                    $("#pagination").html("");
                                    $(".pageLayout").css("display","none");
                                }
                            },
                            error: function () {
                                alert("请求出错!");
                            }
                        });
                    }
            );
        }
        function checkDate(startDate,endDate){
            var flag=true;
            if(startDate==""){
                alert("开始时间不能为空!");
                flag=false;;
            }
            if(endDate==""){
                alert("结束时间不能为空!");
                flag=false;
            }
            if(startDate!="" && endDate!=""){
                if(startDate>endDate){
                    alert("开始时间不能大于结束时间");
                   flag=false;
                }
            }
            return flag;
        }
        function showPages(pageCount,pageNo,dateType){
            $("#pagination").paginate({
                count 		: pageCount,
                start 		: pageNo,
                display     : 5,
                border					: true,
                border_color:'#FFF',
                text_color  			: '#099ACF',
                background_color    	: '#FFF',
                text_hover_color  		: '#FFF',
                background_hover_color	: '#099ACF',
                border_hover_color		: '#ccc',
                images					: false,
                rotate     				 : true,
                mouse					: 'press',
                onChange     			: function(page){
                    $('._current','#paginationdemo').removeClass('_current').hide();
                    $('#p'+page).addClass('_current').show();
                    showData(page,dateType);
                }
            });
        }
    </script>
</body>
</html>
