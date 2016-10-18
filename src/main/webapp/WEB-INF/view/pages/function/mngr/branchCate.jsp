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
    <meta charset="utf-8"/>
    <title>商品配置</title>
    <link href="/static/frame/bootstrap/js/bootstrap.min.js" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/frame/bootstrap/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/static/frame/bootstrap/css/ace.min.css"/>
    <link rel="stylesheet" href="/static/frame/bootstrap/css/bootstrap.min.css"/>
    <style>
        .store-btn-row{
            margin-top: 8px;
        }
    </style>
</head>
<body>
<div style="float: left">
    <div class="widget-box">
        <div class="widget-header header-color-blue2">
            <h4 class="lighter smaller">品类配置。。</h4>
        </div>
        <div class="widget-body">
            <div class="widget-main padding-8">
                <div id="tree1" class="tree tree-selectable">
                </div>
            </div>
        </div>
    </div>
</div>
<div style="float: right;width: 80%;">
    <div class="row clearfix">
<div class="container">
    <div class="row clearfix">

        <div class="col-md-1 column">
        </div>
        <div class="col-md-10 column">
            <div class="row clearfix">
                <div class="col-md-12 column" id="product_tree">

                </div>
            </div>
        </div>
        <div class="col-md-1 column">
        </div>
    </div>
</div>
    </div>
</div>

<!-- /.main-container -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/frame/bootstrap/js/fuelux/data/fuelux.tree-sampledata.js"></script>
<script src="/static/frame/bootstrap/js/fuelux/fuelux.tree.min.js"></script>
<script src="/static/frame/bootstrap/js/ace-elements.min.js"></script>
<script src="/static/frame/bootstrap/js/ace.min.js"></script>
<script type="text/javascript">

    $(function(){
        $('#tree1').html(format_tree(${catelist}));
    });
    $(document).on("click", ".tree-folder-header", function () {
        var i = $(this).children("i");
        var tree_folder_content = $(this).siblings(".tree-folder-content");
        if (i.hasClass("icon-minus")) {
            i.removeClass("icon-minus").addClass("icon-plus");
            tree_folder_content.hide();
        } else if (i.hasClass("icon-plus")) {
            i.removeClass("icon-plus").addClass("icon-minus");
            tree_folder_content.show();
        }

    });

    $(document).on("click", ".tree-item", function () {

        var i = $(this).children("i");
        var tree_item = $(this).siblings(".tree-item");
        if (i.hasClass("icon-remove")) {
            //TODO
            $('i.icon-ok').addClass('icon-remove').addClass('icon-ok');
            $('div.tree-selected').removeClass('tree-selected');

            i.removeClass("icon-remove").addClass("icon-ok");
            $(this).addClass("tree-selected");
        } else if (i.hasClass("icon-ok")) {
            i.removeClass("icon-ok").addClass("icon-remove");
            $(this).removeClass("tree-selected");
        }

        var id = $(this).attr("value");

        var params = {
            cateId : id,
            branchId : 3
        };
        $.post('/hm/page/cateProducts.html', params, function(data){
           /* console.log(data);*/
            var html = '';
            if(data.code == 1){
                var i;
                for(i = 0; i < data.data.length;i++){
                    if(i%3==0){
                        html += '</div><div class="row clearfix store-btn-row">';
                    }
                    html += '<div class="col-md-4 column"><button class="btn btn-block '+(data.data[i].status=='1'?'btn-success':'btn-default')+'" type="button" value="'+data.data[i].hmProductId+'">'+data.data[i].hmProductName+'</button></div>'
                }
                if(i == 0){
                    html = "";
                }else{
                    html = html.substring(6, html.length)+'</div>';
                }
                $('#product_tree').html(html);
            }
        }, 'json');

    });

    //保存
    $(document).on('click','button.btn-default',function(event){
        var __this__ = this;
        $(__this__).removeClass('btn-default').addClass('btn-success');
        $.ajax({
            url:'/hm/branchcate/saveBranchCateInfo.do',
            data:{
                    productId:$(__this__).attr('value'),
                    status:1,
                    branchId:3,
                    branchname:'测试'
                },
            dataType:'json',
            success:function(data){
                if(data.code==1){
                    //TODO success do nothing
                    alert("操作成功");
                }else{
                    $(__this__).removeClass('btn-success').addClass('btn-default');
                }
            },
            error:function(err){
                $(__this__).removeClass('btn-success').addClass('btn-default');
            }
        });
    });

    //取消
    $(document).on('click','button.btn-success',function(event){
        var __this__ = this;
        $(__this__).removeClass('btn-success').addClass('btn-default');

        $.ajax({
           url:'/hm/branchcate/saveBranchCateInfo.do',
            data:{
                productId:$(__this__).attr('value'),
                status:0,
                branchId:3,
                branchname:'测试'
            },
            dataType:'json',
            success:function(data){
                if(data.code==1){
                    //TODO success do nothing
                    alert("操作成功");
                }else{
                    $(__this__).removeClass('btn-default').addClass('btn-success');
                }
            },
            error:function(err){
                $(__this__).removeClass('btn-default').addClass('btn-success');


                
            }
        });
    });


    var format_tree = function (data) {
        if (typeof data == "string")data = JSON.parse(data);
        var the_tree = {};
        var second_level = {};
        var children_nodes = {};
        var tree = "<div class=\"tree-folder\" style=\"display: block;\">";
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
        return build_tree(the_tree);
    };

    var build_tree = function(the_tree){

        var html = '';
        for (var id in the_tree){
            if (the_tree[id].type=='folder'){
                html += '<div class="tree-folder" style="display:block;"><div class="tree-folder-header"><i class="icon-plus"></i><div class="tree-folder-name">'+the_tree[id].name+'</div></div><div class="tree-folder-content" style="display: none;">'+
                        build_tree(the_tree[id].additionalParameters.children)+
                        '</div></div>';
            }else if(the_tree[id].type=='item'){
                html +=  '<div class="tree-item" style="display:block;" value="'+id+'"><i class="icon-remove"></i><div class="tree-item-name" >'+the_tree[id].name+'</div></div>'
            }
        }
        return html;
    };


</script>

</body>
</html>

