<%--
  User: jiangyukun
  Date: 2015/11/9 10:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../new_header.jsp" %>
    <title>商家绑定</title>
    <link rel="stylesheet" href="${ctx}/static/css/account/register.css"/>
</head>
<body>
<%--<div class="weui_cells_title">绑定信息</div>--%>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell mobile_input">
        <div class="weui_cell_hd"><label class="weui_label">手机号码</label></div>
        <div class="weui_cell_bd ">
            <input id="mobile" class="weui_input" type="number" placeholder="请输入您的手机号码"/>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">验证码</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input id="code" class="weui_input" type="number" placeholder="请输入验证码"/>
        </div>
        <div class="weui_cell_ft">
            <button id="getCode" class="weui_btn weui_btn_primary">获取验证码</button>
        </div>
    </div>
    <div class="weui_cell password_input">
        <div class="weui_cell_hd"><label class="weui_label">密码</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input id="password" class="weui_input" type="number" placeholder="请输入密码"/>
        </div>
        <div class="weui_cell_ft">
            <i class="weui_icon_warn"></i>
        </div>
    </div>
    <div class="weui_cell">
        <button id="bind" class="weui_btn weui_btn_primary ">绑定</button>
    </div>
</div>
<div class="text-center technology-support font12px">每加智慧.技术支持</div>

<%@ include file="../footer.jsp" %>
<script>
    seajs.use('static/js/account/register');
</script>
</body>
</html>
