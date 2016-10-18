<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品销售排行</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="javascript:void(0)">统计分析</a></li>
    <li class="active">商品销售排行</li>
</ol>
<div class="page-container">


        <div class="row">

            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>开始时间:</label>
            </div>
            <div class="col-sm-2">
                <input type="text" class="timeinput form-control"  id="startDate" name="startDate"
                       placeholder="请输入开始日期" value="${startDate}"   onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" >
            </div>
            <div class="col-sm-2 col-md-2 col-lg-1">
                <label>结束时间:</label>
            </div>
            <div class="col-sm-2">
                <input type="text" class="timeinput form-control"  id="endDate" name="endDate"
                       placeholder="请输入结束日期" value="${endDate}"   onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" >
            </div>
            <div class="col-sm-1">
                <label>名称:</label>
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control"  id="goodsName" name="goodsname"
                       placeholder="请输入商品名称" value="" >
            </div>

            <div class="col-sm-1">
                <button type="button" class="btn btn-success" onclick="showData(1)" >查询</button>
            </div>
        </div>

     <div id="chart"  style="height:350px;width:100%;margin:10px auto;"></div>
    <div class="table-responsive">
            <table class="table table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>商品名称</th>
                        <th>销量</th>
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

</div>
<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>
<script src="/static/frame/echarts/dist/echarts.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript">
    var pageNo= 1,pageSize=10;
    var option = {
        title: {
            x: 'center',
            text: '商品销量排行统计'
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
    showData(pageNo);
    function showData(pageNo){

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
                    var startDate = $('#startDate').val();
                    var endDate = $('#endDate').val();
                    var goodsName=$("#goodsName").val();
                    pageSize=$("#pageSize").val();
                    if(startDate!="" && endDate!=""){
                        if(startDate>endDate){
                            alert("开始时间不能大于结束时间");
                            return;
                        }
                    }
                    var myChart = ec.init(document.getElementById('chart'));
                    myChart.showLoading({text: "数据加载中......"});
                    $.ajax({
                        url: "/hm/page/goodsSalesRanking.html",
                        type: "post",
                        data: {startDate: startDate, endDate: endDate,goodsName:goodsName,pageNo:pageNo,pageSize:pageSize},
                        success: function (data) {
                            var data = JSON.parse(data);
                            myChart.hideLoading();
                            if (data.status=="success" && data.result.object.length > 0) {
                                var totalCount=data.result.totalCount;
                                var pageNo=data.result.pageNo;
                                var pageSize=data.result.pageSize;
                                var pageCount=Math.ceil(totalCount/pageSize);
                                var seriesData=new Array();
                                var xData=new Array();
                                showScrollPages(pageCount,pageNo);//显示分页
                                var dateHtml="";
                                $.each(data.result.object,function(i,item){
                                    xData.push(item[0]);
                                    seriesData.push(parseInt(item[1]));
                                    var trHtml = '<tr>';
                                    trHtml += "<td>"+(pageSize*(pageNo-1)+(i+1))+"</td><td>"+item[0]+"</td>" +
                                            "<td>"+item[1]+"</td>";
                                    dateHtml+=trHtml;
                                });
                                option.xAxis[0].data=xData;
                                option.series[0].data=seriesData;
                                myChart.setOption(option);
                                $("#container").html(dateHtml);
                            } else {
                                $("#container").html("<tr><td colspan='3'><h2 style='text-align:center;'>无数据展示!</h2></td></tr>");
                                $("#pagination").html("");
                            }
                        },
                        error: function () {
                            alert("请求出错!");
                        }
                    });
                }
        );
    }
</script>
</body>
</html>

