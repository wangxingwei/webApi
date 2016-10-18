<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/view/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>API-首页</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link
	href="<%=request.getContextPath()%>/static/frame/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/menu.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/js/jquery-1.11.3.min.js"></script>
<script
	src="<%=request.getContextPath()%>/static/frame/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/js/menu.js"></script>
<style>
body {
	overflow-y: hidden;
}
</style>
</head>
<body>
	<!--左侧菜单结束-->
	<%-- <div>
		<table></table>
${sessionScope.idText}
		<script type="text/javascript">
			var vv = ${sessionScope.idText}
			$(function(){
				$('.url').text(vv.urlexplain+":"+vv.url);
				$('.req').text(vv.reqexplain+":"+vv.req);
				$('.param').text(vv.paramexplain+":"+vv.param);
				$('.code').text(vv.codeexplain+":"+vv.code);
			});
		</script>
		 <div class="col-sm-2 col-md-2 col-lg-1">
                <label>URL:</label>
        </div>
		<div class="col-sm-3 col-md-2">
			<input type="text" class="form-control" id="title" name="title"
				placeholder="请输入广告标题" width="300px">
		</div>
		<ul class="list-group">
			<li class="url"></li>
			<li class="req"></li>
			<li class="param"></li>
			<li class="code"></li>
		</ul>
	</div>
 --%>
	
	<form>
	
		<div class="form-group">
			<label for="name">名称</label>
			<input type="text" class="form-control" id="name" 
				   placeholder="请输入名称" value="aaaa">
		</div>
		
	</form>
	
	<script type="text/javascript">
		var winHeight = $(window).height();
		var offsetTop = $(".nav-top").height();
		$(".rightcon").css("height", winHeight - offsetTop);
		$(".nav-menu").css("height", winHeight - offsetTop);
		$(".leftmenu2").css("height", winHeight - offsetTop);
		$(window).resize(function() {
			var winHeight = $(window).height();
			var offsetTop = $(".nav-top").height();
			$(".rightcon").css("height", winHeight - offsetTop);
			$(".nav-menu").css("height", winHeight - offsetTop);
			$(".leftmenu2").css("height", winHeight - offsetTop);
		});
		$(".nav-menu a").click(function() {
			var htmlSrc = $(this).attr("href");

			$("#iframe_context").attr("src", htmlSrc);
		});
	</script>
</body>
</html>
