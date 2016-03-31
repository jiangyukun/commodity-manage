<%-- jiangyuk on 2015/11/9 19:15 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setAttribute("ctx", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="format-detection" content="telephone=no" />
<title>区域管理</title>
<%@include file="../header.jsp" %>
<link rel="stylesheet" href="${ctx}/static/css/position/position.css" />
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<ul id="positionList" class="list-group">
			<c:forEach var="item" items="${positionPageList}">
				<li class="list-group-item" ><a href="edit?id=${item.id}"><font color=black>${item.province} ${item.city} ${item.town} ${item.addr }</font><span
					class="glyphicon glyphicon-chevron-right pull-right arrow"></span></a>
				</li>
			</c:forEach>
			</ul>
		</div>
		<div class="row foot">
		<div class="foot-a" >
			<a href="edit"><img id="add" src="${ctx}/static/images/common/icon-add.png"><br><span id="addposition">新增区域</span></a>
		</div>
		</div>
	</div>

<%@include file="../footer.jsp" %>
	<script>
		seajs.use('static/js/position/position');
	</script>
</body>
</html>
