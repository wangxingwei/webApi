<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
	<head>
		<style type="text/css">
			.mainDiv{
				padding:20px;
				color:#333;
			}
			#searchArea{
				width:60%;
				margin:0 auto;
				padding:5px;
			}
			#searchArea input,#businessNames{
				border:1px solid #A9A9A9;
				border-radius:3px;
			}
			#searchArea input:hover,#businessNames:hover,#searchArea input:focus,#businessNames:focus{
				border-color: #66afe9;
				outline: 0;
				-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
				rgba(102, 175, 233, .6);
				box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
				rgba(102, 175, 233, .6);
							
			}
			#searchArea input,#searchArea span{
				line-height:20px;
			}
			.searchButton{
				background:#fff;
				border:1px solid #797979;
				border-radius:5px;
				width:100px;
				height:30px;
				cursor: pointer;
				margin-left:20px;
			}
			.searchButton:ACTIVE{
				padding-top:2px;
				padding-left:10px;
			}
			#businessTable{
				border-collapse:collapse;
				margin:20px auto;
				width:80%;
			}
			#businessTable th,#businessTable td{
				border:1px solid #797979;
				padding:5px 0;
				text-align: center;
			}
			.districtTr:hover{
				background:#E8F2FE;
				cursor:pointer;
			}
		</style>
		<script type="text/javascript">
			function enterDistrict(code){
				location.href = "enterDistrict.do?code="+code;
			}
		</script>
	</head>
	<body>
		<div class="mainDiv" >
			<!-- <form action="businessManageList" method="post" id="searchArea">
				<span>业务名称：</span>
				<input id="businessName" name="businessName" type="text" value="" style="width:22%;"/>
				&nbsp;&nbsp;&nbsp;
				<span>更改时间：</span>
				<input type="date" style="width:15%;" />	-	<input type="date" style="width:15%;" /><br><br>
				<span>合作公司：</span>
				<input type="text" style="width:22%;" readonly placeholder="暂时不可用"/>
				<input style="width:35%;visibility:hidden;" />
				<input class="searchButton" type="submit" value="搜索" title="按条件搜索"/>
			</form> -->
			<div id="tabDiv">
				<table id="businessTable">
					<tr style="background:#F0F0F0;">
						<th width="5%">id</th>
						<th width="15%">业务名称</th>
						<th width="20%">合作公司</th>
						<th width="30%">开通区域</th>
						<th width="20%">更改时间</th>
						<th width="10%">操作人</th>
					</tr>
					<c:forEach items="${districtManageInfoList }" var="item" varStatus="status">
						<tr class="districtTr" title="双击进入区域管理" ondblclick="enterDistrict('${item.code}');" >
							<td>${status.index + 1}</td>
							<c:choose>
								<c:when test="${fn:contains(item.code,'GY') }">
									<td>手机充值(高阳)</td>
								</c:when>
								<c:when test="${fn:contains(item.code,'M1') }">
									<td>手机充值(黑马)</td>
								</c:when>
								<c:when test="${fn:contains(item.code,'L2') }">
									<td>手机充值(连连)</td>
								</c:when>
								<c:otherwise>
									<td>${item.businessName }</td>
								</c:otherwise>
							</c:choose>
							<td></td>
							<c:choose>
								<c:when test="${fn:length(item.openDistrict)>13 }">
									<td title="${item.openDistrict }">${fn:substring(item.openDistrict,0,13) }...</td>
								</c:when>
								<c:otherwise>
									<td>${item.openDistrict }</td>
								</c:otherwise>
							</c:choose>
							<td>${item.changeTime }</td>
							<td></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
</html>