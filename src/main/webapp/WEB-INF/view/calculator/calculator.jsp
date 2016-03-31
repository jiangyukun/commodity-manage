<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setAttribute("ctx", request.getContextPath()); %>

<!DOCTYPE html>
<html>
<head>
    <title>支付详情</title>
    <%@include file="../header.jsp" %>
    <link rel="stylesheet" href="${ctx}/static/css/calculator/calculator.css"/>
</head>
<body>
<input value="${id}" id="positionid"  style="display:none;"/>
<div class="container-fluid">
    <div class="row mName">
    <p>北京星华互联便利店</p><br>
    <p class="notice">请在下方输入订单金额</p>
    </div>
    <div class="row">
    <div class="money">
    <p class="amount"><span class="icon">￥     </span><span class="payMoney"></span><img class="clear" style="display:none" alt="" src="${ctx}/static/images/calculator/icon-clear.png"></p>
    </div>
    </div>
    <div class="row">
    <div class="col-xs-4 num-right num-bottom num">1</div>
    <div class="col-xs-4 num-right num-bottom num">2</div>
    <div class="col-xs-4 num-bottom num">3</div>
    </div>
    <div class="row">
    <div class="col-xs-4 num-right num-bottom num">4</div>
    <div class="col-xs-4 num-right num-bottom num">5</div>
    <div class="col-xs-4 num-bottom num">6</div>
    </div>
    <div class="row">
    <div class="col-xs-4 num-right num-bottom num">7</div>
    <div class="col-xs-4 num-right num-bottom num">8</div>
    <div class="col-xs-4 num-bottom num">9</div>
    </div>
    <div class="row">
    <div class="col-xs-4 num-right num">.</div>
    <div class="col-xs-4 num-right num">0</div>
    <div class="col-xs-4 num delete">←</div>
    </div>
    <div class="row ">
    <div class="pay">
  	<span class="payspan">微信支付</span> 
  	</div>
    </div>
</div>


<%@include file="../footer.jsp" %>
<script>
    seajs.use('static/js/calculator/calculator.js');
</script>
</body>
</html>
