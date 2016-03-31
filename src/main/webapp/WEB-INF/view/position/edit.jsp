<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setAttribute("ctx", request.getContextPath()); %>

<!DOCTYPE html>
<html>
<head>
    <title>区域详情</title>
    <%@include file="../header.jsp" %>
    <link rel="stylesheet" href="${ctx}/static/css/position/edit.css"/>
</head>
<body>
<input value="${id}" id="positionid"  style="display:none;"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-4">
            省份
        </div>
           <div class="col-xs-4 name" >
           <div class="select_style"> 
	<select name="select" id="province" style="color:#bfbfbf" onfocus="this.style.color='black'"> 
		<option value="0" >请选择省份</option>
		<c:forEach var="item" items="${provinceList}">
			<option value="${item.id}" <c:if test="${item.id eq serveDistrict.pid}">selected</c:if> >${ item.name}</option>
		</c:forEach> 
	</select> 
	<img class="image" alt="" src="${ctx}/static/images/common/down-64.png">
		</div> 
		</div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            城市
        </div>
        <div class="col-xs-4">
            <div class="select_style"> 
	<select name="select" id="city" style="color:#bfbfbf" onfocus="this.style.color='black'"> 
		<option value="0">请选择城市</option>
		<c:if test="${not empty cityList  }">
		<c:forEach var="item" items="${cityList}">
			<option value="${item.id}" <c:if test="${item.id eq serveDistrict.cid}">selected</c:if> >${ item.name}</option>
		</c:forEach> 
		</c:if>
		</select> 
		<img class="image" alt="" src="${ctx}/static/images/common/down-64.png">
		</div> 
        </div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            区县
        </div>
        <div class="col-xs-4">
            <div class="select_style"> 
	<select name="select" id="town" style="color:#bfbfbf" onfocus="this.style.color='black'"> 
		<option value="0">请选择区县</option>
		<c:if test="${ not empty  townList}">
		<c:forEach var="item" items="${townList}">
			<option value="${item.id}" <c:if test="${item.id eq serveDistrict.tid}">selected</c:if> >${ item.name}</option>
		</c:forEach> 
		</c:if>
		</select> 
		<img class="image" alt="" src="${ctx}/static/images/common/down-64.png">
		</div> 
        </div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            小区/街道
        </div>
        <div class="col-xs-8	">
            <input id="addr" class="addr" value="${serveDistrict.addr}<c:if test="${empty serveDistrict.addr }">请输入小区、楼宇或者街道名称</c:if>" style="color:#bfbfbf" onfocus="this.style.color='black',this.value=''">
        </div>
    </div>
    <c:choose>
    <c:when test="${isupdate eq 0}">
	<div class="row foot">
		<div class="col-xs-6">
		<div class="row row_foot">
		<div class="pull-right">
				<button  class="i_btn i_btn_cancel" id="close">取消</button>
		</div>
		</div>
		</div>
		<div class="col-xs-6">
		<div class="row row_foot">
		<div class="pull-left">
				<button class="i_btn i_btn_confirm" id="confirm">确定</button>
		</div>
		</div>
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<div class="row foot">
		<div class="col-xs-6">
		<div class="row row_foot">
		<div class="pull-right">
				<button  class="i_btn i_btn_cancel delete" id="delete">删除</button>
		</div>
		</div>
		</div>
		<div class="col-xs-6">
		<div class="row row_foot">
		<div class="pull-left">
				<button class="i_btn i_btn_confirm" id="update">编辑</button>
		</div>
		</div>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
</div>

<div class="text-center technology-support">每加智慧.技术支持</div>

<%@include file="../footer.jsp" %>
<script>
    seajs.use('static/js/position/position.js');
</script>
</body>
</html>
