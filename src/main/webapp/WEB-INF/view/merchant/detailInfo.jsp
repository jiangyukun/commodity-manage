<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
    <title>商户详情</title>
    <%@include file="../header.jsp" %>
    <link rel="stylesheet" href="${ctx}/static/css/merchant/detailInfo.css"/>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-xs-4">
            商户ID
        </div>
        <div class="col-xs-4 name">
            ${merchantInfo.mid}
        </div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            商户名称
        </div>
        <div class="col-xs-4">
            ${merchantInfo.name}
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4">
            客服电话
        </div>
        <div class="col-xs-6	">
            ${merchantInfo.phone}
        </div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            绑定时间
        </div>
        <div class="col-xs-7">
            <c:out value="${fn:substring(merchantInfo.createdDate, 0, 10)}" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4">
            绑定状态
        </div>
        <div class="col-xs-4">
            已绑定
        </div>
        <div id="cancelBind" class="col-xs-4">
            取消绑定
        </div>
    </div>
</div>

<div class="technology-support">每加智慧.技术支持</div>

<%@include file="../footer.jsp" %>
<script>
    seajs.use('static/js/merchant/detailInfo');
</script>
</body>
</html>
