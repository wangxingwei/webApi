
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
<div   style="width:90%;margin:50px auto;margin-bottom:100px;" >
        <form class="form-horizontal" role="form" method="post" action="/hm/mngr/savegoods.html"  enctype="multipart/form-data">
            <div class="form-group">
			<label for="firstname" class="col-sm-1 control-label">${urlexplain}:</label>
			<div class="col-sm-6">
				<input type="hidden" id="url" /> <input type="text"
					class="form-control" name="reqUrl" id="reqUrl" placeholder="è¯·è¾å¥å°å"
					value="${url}">
			</div>
		</div>
		<div class="form-group">
			<label for="firstname" class="col-sm-1 control-label">${reqexplain}:</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="reqType"
					placeholder="è¯·è¾å¥è¯·æ±æ¹å¼" value='${reqs}'>
			</div>
		</div>
		
			<div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">${paramexplain}:</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="3" placeholder="è¯·è¾å¥åæ°">${params}</textarea>
				</div>
	
			</div>
		
		
			<div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">${paramstateexplain}:</label>
				<div class="table-responsive col-sm-6">
					<!-- <div data-spy="scroll" data-target="#navbar-example" data-offset="0" 
	 						style="height:120px;overflow:auto; position: relative;"> -->
						<table class="table table-bordered">${paramstate}
						</table>
					<!-- </div> -->
				</div>
			</div>
		
		<div class="form-group">
			<label for="firstname" class="col-sm-1 control-label">出参说明:</label>
			<div class="table-responsive col-sm-6">
				<table class="table table-bordered">${code }
				</table>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button id="submit" class="btn btn-default">测试</button>
			</div>
		</div>
        </form>
</div>
</body>
</html>
