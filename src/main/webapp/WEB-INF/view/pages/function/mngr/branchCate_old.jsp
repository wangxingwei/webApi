<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/30
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>商品配置</title>
  <link href="/static/frame/bootstrap/js/bootstrap.min.js" rel="stylesheet" />
  <link rel="stylesheet" href="/static/frame/bootstrap/css/font-awesome.min.css" />
  <link rel="stylesheet" href="/static/frame/bootstrap/css/ace.min.css" />
</head>
<body>

<div class="main-container" id="main-container">
  <div class="main-content">
    <div class="page-content">
      <div class="row">
        <div class="col-xs-12">
          <div class="row">
            <div class="col-sm-6">
              <div class="widget-box">
                <div class="widget-header header-color-blue2">
                <h4 class="lighter smaller">品类配置。。</h4>
              </div>
                <div class="widget-body">
                  <div class="widget-main padding-8">
                    <div id="tree1" class="tree"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</div><!-- /.main-container -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript">
  window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>
<script type="text/javascript">
  if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/frame/bootstrap/js/fuelux/data/fuelux.tree-sampledata.js"></script>
<script src="/static/frame/bootstrap/js/fuelux/fuelux.tree.min.js"></script>
<script src="/static/frame/bootstrap/js/ace-elements.min.js"></script>
<script src="/static/frame/bootstrap/js/ace.min.js"></script>
<script type="text/javascript">
  jQuery(function($){

    $(document).on("click",".tree-item",function(){
      console.log($(this));
    });

    $('#tree1').ace_tree({
      dataSource: new DataSourceTree({data: format_tree(${catelist})}),
       multiSelect:true,
       loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
       'open-icon' : 'icon-minus',
       'close-icon' : 'icon-plus',
       'selectable' : true,
       'selected-icon' : 'icon-ok',
       'unselected-icon' : 'icon-remove'
    });


    /* $('#tree1').on('loaded', function (evt, data) {});
       $('#tree1').on('opened', function (evt, data) {});
       $('#tree1').on('closed', function (evt, data) {});*/

     $('#tree1').on('selected', function (evt, data) {
        /*alert("显示");*/

      /* $.post('http://192.168.89.82:8080/hm/user/save_weixinuser.html', params, function(data){
         if(data.code == 1){
           window.location.replace("http://pay.huimin.cn/hm-escrow/pay/wxpay/jsapiui.action?mid=999998")
         }else{
           $(".ok_btn").removeAttr("disabled");
           modalShow(data.message);
           clearInterval(window.tt);
           $(".get_codeBtn").html("重新获取").removeAttr("disabled").css({"background": "#f2f2f2","color":"#ef564e"});
           $(".codeInt").val("");
         }
       }, 'jsonp');*/



     });

  });

  var format_tree = function (data) {
    if (typeof data == "string")data = JSON.parse(data);
    var the_tree = {};
    var second_level = {};
    var children_nodes = {};
    for (var i = 0; i < data.length; i++) {
      var cateId = data[i]['cateid'];
      var pid = data[i]['pid'];
      if (children_nodes[cateId] === undefined)children_nodes[cateId] = {};
      if (pid == 0) {
        the_tree[cateId] = {
          name: data[i]['catename'],
          type: 'folder',
          'additionalParameters': {'children': children_nodes[cateId]}
        };
        second_level[cateId] = true;
      } else if (second_level[pid]) {
        children_nodes[pid][cateId] = {
          name: data[i]['catename'],
          type: 'folder',
          'additionalParameters': {'children': children_nodes[cateId]}
        };
      } else {
        children_nodes[pid][cateId] = {name: data[i]['catename'], type: 'item'};
      }
    }
    return the_tree;
  };
</script>

</body>
</html>

