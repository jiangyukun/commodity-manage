<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'/>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="format-detection" content="telephone=no"/>
    <title></title>
    <link rel="stylesheet" href="${ctx}/res/common/css/normalize.css"/>
    <link rel="stylesheet" href="${ctx}/res/bootstrap3/dist/css/bootstrap.css"/>
</head>
<body>

<div class="container-fluid">
    <div class="row">

    </div>
</div>

<script src="${ctx}/res/seajs/sea-debug.js"></script>
<script>
    seajs.config({
        base: '${ctx}/',
        alias: {
            jquery: 'res/seajs/lib/jquery',
            mustache: 'res/seajs/lib/mustache',

            bootstrap: 'res/seajs/lib/bootstrap',
            config: 'static/js/common/config',
            util: 'static/js/common/util'
        }
    });
    seajs.use('static/js/account/register');
</script>
</body>
</html>
