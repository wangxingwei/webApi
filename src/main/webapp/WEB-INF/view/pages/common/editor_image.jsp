<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<link rel="stylesheet" href="/static/frame/editor/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="/static/frame/editor/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="/static/frame/editor/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="/static/frame/editor/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="/static/frame/editor/kindeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=request.getContextPath()%>/static/frame/editor/kindeditor/plugins/code/prettify.css',
				uploadJson : '<%=request.getContextPath()%>/static/frame/editor/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '<%=request.getContextPath()%>/static/frame/editor/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</head>
<body>
	<%=htmlData%>
	<form name="example" method="post" action="/test/editor.html">
		<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;border:1px solid #ccc;"><%=htmlspecialchars(htmlData)%></textarea>
		<br />
		<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
	</form>
	<input type="button" id="J_selectImage" value="批量上传" />
	<div id="J_imageView"></div>
	<script>
		KindEditor.ready(function(K) {
			var editor = K.editor({
				uploadJson : '<%=request.getContextPath()%>/static/frame/editor/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '<%=request.getContextPath()%>/static/frame/editor/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true
			});
			K('#J_selectImage').click(function() {
				editor.loadPlugin('multiimage', function() {
					editor.plugin.multiImageDialog({
						clickFn : function(urlList) {
							var div = K('#J_imageView');
							div.html('');
							K.each(urlList, function(i, data) {
								div.append('<img src="' + data.url + '">');
								console.log(data.url);
							});
							editor.hideDialog();
						}
					});
				});
			});
		});
	</script>
</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>