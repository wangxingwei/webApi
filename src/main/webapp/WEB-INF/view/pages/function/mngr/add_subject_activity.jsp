<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>专题活动添加</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="/static/frame/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
    <link href="/static/js/jsPage/css/style.css" rel="stylesheet" type="text/css" />
    <script charset="utf-8" src="/static/frame/editor/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="/static/frame/editor/kindeditor/lang/zh_CN.js"></script>
    <style>
        .customer-table th{background:#eee;}
    </style>

</head>
<body>
<ol class="breadcrumb">
    <li><a href="javascript:void(0)">首页</a></li>
    <li><a href="/common/menuforward.html?url=/function/mngr/subject_activity">专题活动</a></li>
    <li class="active">专题活动添加</li>
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
            <label>合作方:</label>
            <input type="text" placeholder="请输入合作方"  name="" class="form-control" required  title="请输入合作方">
            <label>url:</label>
            <input type="text" value="" name=""/>
        </div>
        <div class="search-layout clearfix margin_top10">
            <label>活动时间:</label>
            <input type="text" placeholder="请输入开始日期"  class="timeinput form-control"  onclick="SelectDate(this,'yyyy-MM-dd')">
            <label style="text-align:center;">&nbsp;~&nbsp;</label>
            <input type="text" placeholder="请输入结束日期"  class="timeinput form-control"   onclick="SelectDate(this,'yyyy-MM-dd')">
        </div>

        <div class="search-layout clearfix margin_top10">
            <label>活动头图:</label>
            <input type="file" value=""/>
        </div>

        <div class="search-layout clearfix margin_top10">
            <label>详情描述:</label>
            <textarea id="article_content" name="articlecontext" style="width:700px;height:300px;" >

            </textarea>
            <%--<textarea  name="" style="width:700px;height:250px;border:1px solid #ccc;" >

            </textarea>--%>

        </div>
        <div class="search-layout clearfix margin_top10">
            <label>活动备注:</label>

            <textarea  name="" style="width:700px;height:100px;border:1px solid #ccc;" >

            </textarea>

        </div>
        <div class="margin_top20 margin_bottom20">
            <button type="button" class="btn btn-primary" id="submitBtn" style="width:150px;margin-left:80px;">保存</button>
        </div>
    </form>

</div>


<script type="text/javascript" src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/jsPage/jquery.paginate.js"></script>
<script type="text/javascript" src="/static/js/customer.js"></script>
<script type="text/javascript" src="/static/frame/date/adddate.js"></script>
<script type="text/javascript">
    var editor,articleContent;
    KindEditor.ready(function(K) {
        //window.editor = K.create('#article_content');
        editor = K.create('#article_content', {
            resizeType : 1,
            allowPreviewEmoticons : false,
            uploadJson : '../jsp/upload_json.jsp',
            fileManagerJson : '../jsp/file_manager_json.jsp',
            allowFileManager : true,
            items:[
                'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
                'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                'anchor', 'link', 'unlink', '|', 'about'
            ]
           /* items : [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'link']*/
        });
        // 取得HTML内容
        articleContent = editor.html();
        editor.sync();

        K('#submitBtn').click(function(e) {
            articleContent=editor.html();
            $("#article_content").val(articleContent);
            alert(articleContent);
            /*if($("#articleForm").valid()){
                // $("#articleForm").submit();
                var title=$("#articletitle").val();
                title = encodeURI(title);
                title = encodeURI(title);
                $.ajax({
                    url:"/article/saveagrarticle.html",
                    type:"post",
                    data:$("#articleForm").serialize(),
                    success:function(data){
                        alert("保存成功!");
                        window.location="/article/getagrarticle.html?articletitle="+title;
                    },
                    error:function(){
                        alert("请求出错!");
                    }
                })
           }*/

        });
    });

</script>

</body>
</html>

