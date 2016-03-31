<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	request.setAttribute("ctx", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp" %>
<title>订单详情</title>
<link rel="stylesheet" href="${ctx}/static/css/customer/info.css" />


</head>
<body>

	<!-- 订单ID -->
	<input id="oid" name="oid" type="hidden" value="<c:out value="${order.id}"/>"/>
	
	<div class="container-fluid" >
		<div class="row top">
			<div class="col-xs-12">
				<ul>
					<li>
						<span>客户姓名： </span>
						<span>
							${nickname}
						</span>
					</li>
					<li>
						<span>联系方式：</span>
						<span>
							${order.contactPhone} 
						</span>
					</li>
					<li>
						<span>订单位置： </span>
						<span>
							<c:choose>
								<c:when test="${order.newAddr != null}">
									<c:out value="${order.newAddr}"/>
								</c:when>
								<c:otherwise>
									<c:out value="${order.addr}"/>
								</c:otherwise>
							</c:choose>
						</span>
					</li>
					<li>
						<span>下单时间： </span>
						<span>${order.createdDate}</span>
					</li>
				</ul>
			</div>
			<div class="state">
				<img alt=""  src="${ctx}/static/images/order/icon-${order.state}.png">
			</div>
			<div class="telphone">
				<a href="tel:${order.contactPhone}"><span class="glyphicon glyphicon-earphone telphonepic"> </span></a>
			</div>
			<div class="col-xs-12 line">
			</div>
		</div>
		<div class="row">
		<div class="col-xs-12">
		<table id="table" class="table dataTable no-footer" role="grid" >
		<thead>
		<tr role="row">
		<th class="sorting_disabled" rowspan="1" colspan="1" >
		</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${orderInfoList}">
			<tr role="row" class="odd">
				<td>
					<div class="item-left">
						<ul>
							<li>${item.commodity.name }</li>
							<li>${item.commodity.specification }</li>
						</ul></div>
					<div class="item-right">
						<ul>
							<li>¥ ${item.commodity.price }</li>
						<li>x${item.amount }</li>
						</ul>
					</div>
				</td>
		</tr>
		</c:forEach>
		</tbody></table>
			<div class="col-xs-12">
				<div class="total-price">
					<h4>
						总价：
						<span>
							¥&nbsp;
							<c:choose>
								<c:when test="${order.tprice != null}">
									<c:out value="${order.tprice}"/>
								</c:when>
								<c:otherwise>
									0.00
								</c:otherwise>
							</c:choose>
						</span>
					</h4>
				</div>
			</div>
		</div>
		</div>
		<div class="row technology-support">
			<span style="top:60%;">每加智慧.技术支持</span>
		</div>
		<c:if test="${order.state ne 2 and order.state ne 3}">
		<div class="row foot">
					<div class="col-xs-6">
					<div class="row">
					<div class="pull-right">
						<button  class="i_btn i_btn_cancel" id="close">关闭订单</button>
						</div>
						</div>
					</div>
			 	<c:if test="${order.state eq 0}">
					<div class="col-xs-6">
					<div class="row">
					<div class="pull-left">
						<button class="i_btn i_btn_confirm" id="sendOrder">发货</button>
						</div>
						</div>
					</div>
				</c:if>
				<c:if test="${order.state eq 1}">
				<div class="col-xs-6">
				<div class="row">
				<div class="pull-left">
						<button class="i_btn i_btn_confirm" id="overOrder">已送达</button>
					</div>
						</div>
				</div>
				</c:if>
		</div>
		</c:if>
	</div>
<%@include file="../footer.jsp" %>
	<script>
		seajs.use('static/js/customer/info');
	</script>
</body>
</html>
