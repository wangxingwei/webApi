<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<style type="text/css">
		#allBranchList{
			width:100%;
		}
		#allBranchList td{
			cursor: pointer;
		}
		#allBranchList td:HOVER{
			background: #E8F2FE;
		}
		#openBusinessList{
			width:100%;
		}
		#openBusinessList td:HOVER {
			background: #E8F2FE;
		}
		.buttonCs{
			background:#fff;
			border:1px solid #797979;
			border-radius:5px;
			width:100px;
			height:30px;
			cursor: pointer;
			margin-left:80px;
		}
	</style>
	<script type="text/javascript">
		//用来分辨开通城市是否被更改过
		var isNChange = false;
		function addBusiness(){
			//所有分公司
			var allBranch = document.getElementById("allBranch");
			//当前业务为手机充值时，需要判断该城市是否已经在其它渠道开通手机充值
			var branchsOfOtherCode = document.getElementsByName("branchsOfOtherCode");
			//通过当前code查询的分公司，即开通当前业务的分公司
			var branchByCode = document.getElementById("branchByCode");
			//同上，通过当前code查询的分公司，即开通当前业务的分公司，再次生成一遍用于默认全选，提交后台用
			var branchByCodeHidden = document.getElementById("branchByCodeHidden");
			var hiddenLength = branchByCodeHidden.length;
			//用于判断当前开通城市是否已经开通其它手机充值渠道
			var isExistOfOther = false;
			for(var i=0;i<allBranch.length;i++){
				if(allBranch.options[i].selected){
					//如果在左侧选中的包含全国，则清空右侧所有的城市，只添加全国选项
					if(allBranch.options[i].value=="nationwide"){
						//将用作显示和用作提交后台的两个select全部清空，再添加全国一项
						branchByCode.innerHTML = "";
						branchByCodeHidden.innerHTML = "";
						//给开通业务的城市框加值，用于显示和操作
						branchByCode.add(new Option("全国","nationwide"));
						//同上，给开通业务的城市框加值，用于提交后台，不作显示，但是存在，并且默认全部选中
						branchByCodeHidden.add(new Option("全国","nationwide"));
						//将用于提交后台的select中唯一的选项'全国'，选中
						branchByCodeHidden.options[0].selected = true;
						//将处于不可点击状态，用于提交后台的保存按钮解释禁制，使之可点击
						document.getElementById("saveButton").disabled = false;
						return;
					}
					//长度为2的数组，由分公司ID和分公司名称组成
					var branchArr = allBranch.options[i].value.split(",");
					//用于判断当前添加公司是否存在于开通城市中，如果存在，则不再添加，反之则正常添加
					var isExist = false;
					for(var j=0;j<branchByCode.length;j++){
						var branchByCodeArr = branchByCode.options[j].value.split(",");
						if(branchArr[0] == branchByCodeArr[0]){
							isExist = true;
						}
						if(branchByCodeArr[0]=="nationwide"){
							branchByCode.remove(j);
							branchByCodeHidden.remove(j);
							hiddenLength--;
						}
					}
					//如果当前添加的分公司不存在于已开通城市中，则执行
					if(!isExist){
						//如果branchsOfOtherCode有值，说明在另外一个手机充值渠道已开通部分城市
						if(branchsOfOtherCode.length>0){
							//用于判断当前开通城市是否没有开通其它手机充值渠道
							var flag = true;
							for(var k=0;k<branchsOfOtherCode.length;k++){
								if(branchsOfOtherCode[k].value==branchArr[0]){
									flag = false;
									isExistOfOther = true;
								}
							}
							//如果该城市确实没开通其它的手机充值渠道
							if(flag){
								//给开通业务的城市框加值，用于显示和操作
								branchByCode.add(new Option(branchArr[1],branchArr[0]+","+branchArr[1]));
								//同上，给开通业务的城市框加值，用于提交后台，不作显示，但是存在，并且默认全部选中
								branchByCodeHidden.add(new Option(branchArr[1],branchArr[0]));
								branchByCodeHidden.options[hiddenLength].selected = true;
								hiddenLength++;
								//标志着：开通城市更改过
								document.getElementById("isAdd").value = "true";
								isNChange = true;
							}
						}else{
							//给开通业务的城市框加值，用于显示和操作
							branchByCode.add(new Option(branchArr[1],branchArr[0]+","+branchArr[1]));
							//同上，给开通业务的城市框加值，用于提交后台，不作显示，但是存在，并且默认全部选中
							branchByCodeHidden.add(new Option(branchArr[1],branchArr[0]));
							branchByCodeHidden.options[hiddenLength].selected = true;
							hiddenLength++;
							//标志着：开通城市更改过
							document.getElementById("isAdd").value = "true";
							isNChange = true;
						}
					}
				}
				if(isNChange)
					document.getElementById("saveButton").disabled = false;
			}
			if(isExistOfOther){
				alert("部分城市已在其它渠道开通手机充值，无需再次开通！");
			}
		}
		function removeBusiness(){
			//通过当前code查询的分公司，即开通当前业务的分公司
			var branchByCode = document.getElementById("branchByCode");
			//同上，通过当前code查询的分公司，即开通当前业务的分公司，再次生成一遍用于默认全选，提交后台用
			var branchByCodeHidden = document.getElementById("branchByCodeHidden");
			//用循环的方式，将选中的分公司从开通城市中移除，并将提交后台用的hidden分公司信息同时移除
			for(var i=branchByCode.length-1;i>=0;i--){
				if(branchByCode.options[i].selected){
					branchByCode.remove(i);
					branchByCodeHidden.remove(i);
					//标志着：开通城市更改过
					document.getElementById("isRemove").value = "true";
					isNChange = true;
				}
			}
			if(isNChange)
				document.getElementById("saveButton").disabled = false;
		}
		//返回按钮事件触发方法
		function back(){
			if(isNChange){
				if(window.confirm("开通城市已更改，是否进行保存？")){
					form1.submit();
				}else{
					window.history.go(-1);
				}
			}else{
				window.history.go(-1);
			}
		}
	</script>
</head>
<body style="padding:0 60px;">
<div style="width:210px;height:390px;text-align:center;float:left;" >
	<span style="font-size:12px;line-height:20px;">选择城市</span>
	<div style="height:90%;border:1px solid #000;text-align:left;">
		<select id="allBranch" multiple style="width:100%;border:0;height:100%;overflow:auto;font-size:15px;" >
			<option value="nationwide">全国</option>
			<c:forEach items="${allBranch }" var="item">
				<option value="${item.branch_id },${item.branch_Name}">
						${item.branch_Name }
				</option>
			</c:forEach>
		</select>
	</div>
</div>
<div style="float:left;height:390px;width:100px;color:red;">
	<span style="position:relative;top:150px;left:10px;cursor:pointer;" onclick="addBusiness();">开通业务&gt;&gt;</span><br><br>
	<span style="position:relative;top:150px;left:10px;cursor:pointer;" onclick="removeBusiness()">&lt;&lt;关闭业务</span>
</div>
<form name="form1" action="saveBusiness.do" method="post" style="height:100%;">
	<div style="width:210px;height:390px;text-align:center;float:left;" >
		<span style="font-size:12px;line-height:20px;">开通城市</span>
		<div style="height:90%;border:1px solid #000;text-align:left;">
			<select id="branchByCode" name="branchByCode" multiple
					style="width:100%;border:0;height:100%;overflow:auto;font-size:15px;">
				<c:choose>
					<c:when test="${fn:length(branchsByCode)>0 }">
						<c:forEach items="${branchsByCode }" var="item">
							<option value="${item.branch_id },${item.branch_Name}">
									${item.branch_Name }
							</option>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:if test="${flag == 'nationwide'}">
							<option value="nationwide">
								全国
							</option>
						</c:if>
					</c:otherwise>
				</c:choose>
			</select>
			<select id="branchByCodeHidden" name="branchByCodeHidden" multiple
					style="display: none;">
				<c:choose>
					<c:when test="${fn:length(branchsByCode)>0 }">
						<c:forEach items="${branchsByCode }" var="item">
							<option value="${item.branch_id }" selected>
									${item.branch_Name }
							</option>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:if test="${flag == 'nationwide'}">
							<option value="nationwide" selected>
								全国
							</option>
						</c:if>
					</c:otherwise>
				</c:choose>
			</select>
		</div>
	</div>
	<input type="button" class="buttonCs" value="返回" onclick="back()" title="返回上一页" /><br>
	<input id="saveButton" type="submit" class="buttonCs" value="保存" style="margin-top:315px;" disabled />
	<input type="hidden" name="code" value="${code }" />
	<input type="hidden" id="isAdd" name="isAdd" value="false" />
	<input type="hidden" id="isRemove" name="isRemove" value="false" />
</form>
</body>
</html>