<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setAttribute("ctx", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp" %>
<title>客户订单</title>
<link rel="stylesheet" href="${ctx}/static/css/customer/order.css" />
<meta name="format-detection" content="telephone=no" />

</head>
<body>
	<input id="limit"  type="hidden" value="<c:out value="${limit}"/>"/>
	<input id="orderState"  type="hidden" value="<c:out value="${state}"/>"/>
	<div class="container-fluid">
		<div class="row">
			<div class="basic-info clearfix">
				<div class="col-xs-6 orderheader orderheaderborder">
					<div class="row message"><span >¥ ${getAmount}</span></div>
					<div class="row message-next"><span >今日收益</span></div>
				</div>
				<div class="col-xs-5 orderheader-right">
					<div class="row message"><span >${countOrder}</span><span class="message-after">单</span></div>
					<div class="row message-next-2"><span>今日订单数</span></div>
				</div>
			</div>
		</div>
		<div class="row rowlist">
		  <div class="col-xs-3 list"  ><a href="order?state=0"><span class="rowlistitem" <c:if test="${state eq 0 }">style="color:#FF7F00" </c:if>>待发货</span></a></div>
 		  <div class="col-xs-3 list"  ><a href="order?state=1"><span class="rowlistitem"  <c:if test="${state eq 1 }">style="color:#FF7F00" </c:if>>配送中</span></a></div>
 	      <div class="col-xs-3 list"  ><a href="order?state=2"><span class="rowlistitem"  <c:if test="${state eq 2 }">style="color:#FF7F00" </c:if>>已完成</span></a></div>
 		  <div class="col-xs-3 list"  ><a href="order?state=3"><span class="rowlistitem"  <c:if test="${state eq 3 }">style="color:#FF7F00" </c:if>>已关闭</span></a></div>
		</div>
		<div class="row rowheaderlist">
		  <div class="col-xs-3" <c:if test="${state eq 0 }">style="border: solid;border-color: #FF7F00;border-width: 2px;" </c:if> ></div>
 		  <div class="col-xs-3" <c:if test="${state eq 1 }">style="border: solid;border-color: #FF7F00;border-width: 2px;" </c:if>></div>
 	      <div class="col-xs-3" <c:if test="${state eq 2 }">style="border: solid;border-color: #FF7F00;border-width: 2px;" </c:if>></div>
 		  <div class="col-xs-3" <c:if test="${state eq 3 }">style="border: solid;border-color: #FF7F00;border-width: 2px;" </c:if>></div>
		</div>
		<div class="row rowheaderlist tableheader">
		</div>
		<div class="row">
			<table id="table" class="table">
				
				<c:choose>
					<c:when test="${!empty orderList}">
						<c:forEach var="item" items="${orderList}">
							<tr role="row" class="even orderitem" >
								<td>
								
									<div class="item">
									<c:choose>
										<c:when test="${item.state < 2 }"><img class="changestate" id="changestate" alt='' dataid="${item.id}" src="${ctx}/static/images/order/state-${item.state}.png"/></c:when>
										<c:otherwise><img class="nochangestate" src="${ctx}/static/images/order/icon-${item.state}.png"/> </c:otherwise>
									</c:choose>
										<ul class="itemcontent">
											<li style="color: black;">订单号： ${item.id}</li>
												<li style="color: black;">配送地址：<c:choose><c:when test="${item.newAddr != null}"><c:out value="${item.newAddr}"/></c:when>
																		<c:otherwise>
																				<c:out value="${item.addr}"/>
																		</c:otherwise>
												</c:choose></li>
											<li style="color: #bfbfbf;">${item.createdDate} </li>
										</ul>
									</div>
									<div class="left">
										<a href="info?id=${item.id}"><img class="image" alt="" src="${ctx}/static/images/order/icon-join.png"></a>
									</div>
								</td>
							</tr>
						</c:forEach>
						<tr id="adddiv">
						<td>
						
						<div class="down-refresh"  <c:if test="${addstate eq 1}">style="display:none;"</c:if>>
      					<span id="addmore">加载更多...</span>
      					</div>
      					</td>
      					</tr>
					</c:when>
					<c:otherwise>
						<tr role="row nolist" class="even">
							<td class="nolist"><div class="nolist noContent"><img  class="noorder" alt=''  src="${ctx}/static/images/iconfont-dingdan.png"/><div style="height: 20px"></div><div style="text-align: center"><p class="noordertext">暂无订单</p></div></div></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>

		</div>
		<c:if test="${!empty orderList}">
		<div class="row technology-support">
			<span style="top:60%;">每加智慧.技术支持</span>
		</div>
		</c:if>
	</div>
<%@include file="../footer.jsp" %>
	<script>
		seajs.use('static/js/customer/order');
	</script>
</body>
</html>
