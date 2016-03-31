<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../header1225.jsp" %>
    <title>商品管理</title>
    <link rel="stylesheet" href="${ctx}/static/css/commodity/commodityManage.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/commodity/addCommodity.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/category/categoryList.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/commodity/commodityDetail.css"/>
</head>
<body>
<div class="page-container"></div>

<%--选择分类--%>
<template id="selectCategoryTemplate">
    <div class="weui_mask_transition"></div>
    <div class="weui_actionsheet popup-p30-to-up">
        <div class="popup-title base-color font14px">
            <span class="select-category-title">选择分类</span>

            <div class="item-icon-container close-select-category">
                <img src="${ctx}/static/images/icon/cancel.png">
            </div>
        </div>
        <ul id="categorySelectItems" class="item-lists font14px"></ul>
        <div class="add-of-select-category text-center font14px">
            <div class="iconContainer"><img src="${ctx}/static/images/icon/add.png"></div>
            <div class="base-tip-color">新增分类</div>
        </div>
    </div>
</template>
<%--新增分类--%>
<template id="addCategoryCell">
    <div class="iconContainer"><img src="${ctx}/static/images/icon/add.png"></div>
    <div class="add-category-item-tip font14px"><span>新增分类</span></div>
</template>

<%--商品管理模板--%>
<template id="commodityManageTemplate">
    <div id="commoditySearchArea" class="navbar-fixed-top">
        <div class="searchContainer base-color">
            <form id="searchCommodityForm">
                <input id="searchCommodity" class="font14px" type="search" name="search" placeholder="查询商品"/>
            </form>
        </div>
    </div>
    <div class="navbar-fixed-bottom">
        <div id="barcodeAdd" class="text-center">
            <div class="iconContainer"><img src="${ctx}/static/images/icon/barcode.png"></div>
            <div>扫码新增</div>
        </div>
        <div id="manualAddNav" class="text-center">
            <div class="iconContainer"><img src="${ctx}/static/images/icon/addManual.png"></div>
            <div>手动新增</div>
        </div>
        <div id="categoryManage" class="text-center">
            <div class="iconContainer"><img src="${ctx}/static/images/icon/category.png"></div>
            <div>分类管理</div>
        </div>
    </div>
    <div class="searchBox base-color hidden">
        <div class="searchResult">
            <ul id="searchResultList"></ul>
            <div class="text-center technology-support font12px">每加智慧.技术支持</div>
        </div>
        <div class="text-center search-back">
            <div class="iconContainer"><img src="${ctx}/static/images/icon/back.png"></div>
            <div>返回前页</div>
        </div>
    </div>
</template>
<template id="categoryAndCommodityTemplate">
    <div id="iScrollCategoryWrapper" class="base-color">
        <ul id="categoryNav"></ul>
    </div>
</template>
<template id="commodityTemplate">
    <div class="image"></div>
    <div class="commodity-basic-info">
        <div class="commodityName"></div>
        <div class="commoditySpecification"></div>
        <div class="commodityPrice"></div>
    </div>
    <div class="right-arrow">
        <div class="iconContainer"><img src="${ctx}/static/images/icon/right.png"></div>
    </div>
</template>

<%--新增商品模板--%>
<template id="addCommodityTemplate">
    <div class="add-commodity-content base-color">
        <div class="container-fluid">
            <div class="row top-row">
                <div class="selectPicArea">
                    <div class="add-image">
                        <div id="addImageArea">
                            <img src="${ctx}/static/images/icon/iconfont-zengjiatupian.png">
                        </div>
                    </div>
                    <div class="file-input">
                        <input id="picture" type="file">
                    </div>
                    <div class="pictureContainer"></div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">商品条码</div>
                    </div>
                </div>
                <div class="col-xs-7">
                    <div class="row">
                        <input type="text" placeholder="请输入或扫一扫商品条码" class="form-control input-tip barCode font14px">
                    </div>
                </div>
                <div class="col-xs-1 barcode-scan">
                    <div class="iconContainer"><img src="${ctx}/static/images/icon/barcode.png"></div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">商品名称</div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="row">
                        <input type="text" placeholder="请输入商品名称" class="form-control commodityNameOfAdd font14px">
                    </div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">商品分类</div>
                    </div>
                </div>
                <div class="col-xs-9">
                    <div id="selectCategory" class="row">
                        <div class="col-xs-9">
                            <span class="commodityCategory base-tip-color font14px">请选择商品分类</span>
                        </div>
                        <div class="col-xs-1 down-icon">
                            <div class="iconContainer"><img src="${ctx}/static/images/icon/down.png"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">商品规格</div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="row">
                        <input type="text" placeholder="请输入商品规格" class="form-control specification font14px">
                    </div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">零售价格</div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="row">
                        <input type="number" placeholder="请输入零售价格" class="form-control price font14px">
                    </div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">推荐</div>
                    </div>
                </div>
                <div class="col-xs-9">
                    <div class="row" style="margin-left: 0;">
                        <input id="isRecommended" class="commodity-info font14px" type="checkbox">
                        <span class="commodity-info base-tip-color recommend-tip font14px">推荐后，将显示在推荐中心</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar-fixed-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-6">
                    <div class="row">
                        <div class="pull-right">
                            <button id="cancelAddCommodity" class="i_btn i_btn_cancel font14px">取消</button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="row">
                        <div class="pull-left">
                            <button id="confirmAddCommodity" class="i_btn i_btn_confirm font14px">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<%--商品详情--%>
<template id="commodityInfoTemplate">
    <div class="commodity-info-content font14px base-color">
        <div class="container-fluid">
            <div class="row top-row">
                <div class="selectPicArea">
                    <div class="pictureContainer"></div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">商品条码</div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="row">
                        <span id="barcodeInfo" class="commodity-info font14px"></span>
                    </div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">商品名称</div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="row">
                        <span id="commodityNameOfInfo" class="commodity-info font14px"></span>
                    </div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">商品分类</div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="row">
                        <span id="commodityCategoryOfInfo" class="commodity-info font14px"></span>
                    </div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">商品规格</div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="row">
                        <span id="commoditySpecificationOfInfo" class="commodity-info font14px"></span>
                    </div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">零售价格</div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="row">
                        <span id="commodityPriceOfInfo" class="commodity-info font14px"></span>
                    </div>
                </div>
            </div>
            <div class="row my-row">
                <div class="col-xs-3">
                    <div class="row">
                        <div class="form-control-static form-label font14px">推荐</div>
                    </div>
                </div>
                <div class="col-xs-9">
                    <div class="row" style="margin-left: 0;">
                        <input id="isRecommendedOfInfo" class="commodity-info font14px" type="checkbox" disabled>
                        <span class="commodity-info base-tip-color recommend-tip font14px">推荐后，将显示在推荐中心</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="navbar-fixed-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-3">
                    <div id="back" class="text-center">
                        <div class="iconContainer"><img src="${ctx}/static/images/icon/back.png"></div>
                        <div>返回</div>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div id="deleteCommodity" class="text-center">
                        <div class="iconContainer"><img src="${ctx}/static/images/icon/delete.png"></div>
                        <div>删除</div>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div id="undercarriageCommodity" class="text-center">
                        <div class="iconContainer"><img src="${ctx}/static/images/icon/undercarriage.png"></div>
                        <div>下架</div>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div id="editCommodity" class="text-center">
                        <div class="iconContainer"><img src="${ctx}/static/images/icon/edit.png"></div>
                        <div>编辑</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<%--分类管理模板--%>
<template id="categoryManageTemplate">
    <div class="categoryListOfCategoryManage font14px">
        <ul id="categoryItemList"></ul>
    </div>
    <div class="navbar-fixed-bottom">
        <div class="text-center category-back">
            <div class="iconContainer"><img src="${ctx}/static/images/icon/back.png"></div>
            <div>返回前页</div>
        </div>
        <div class="text-center add-category-item">
            <div class="iconContainer"><img src="${ctx}/static/images/icon/iconfont-xinzeng.png"></div>
            <div>新增分类</div>
        </div>
    </div>
    <%--BEGIN 编辑分类--%>
    <div id="editCategoryItemPanel" class="hidden font14px">
        <div class="weui_mask_transition"></div>
        <div class="weui_actionsheet">
            <div class="edit-category-title base-color font16px">
                编辑分类
                <div class="item-icon-container close-edit-category">
                    <img src="${ctx}/static/images/icon/cancel.png">
                </div>
            </div>
            <div class="weui_cells weui_cells_form font14px">
                <div class="weui_cell mobile_input">
                    <div class="weui_cell_hd"><label class="weui_label">分类名称</label></div>
                    <div id="categoryItemNameFillIn" class="weui_cell_bd "></div>
                </div>
                <div class="weui_cell">
                    <div class="weui_cell_hd"><label class="weui_label">目前排序</label></div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <input id="categoryWeightFillIn" class="weight-input" placeholder="请输入该分类排序权重">
                    </div>
                </div>
                <div class="weui_cell password_input">
                    <div class="weui_cell_hd"><label class="weui_label">商品数量</label></div>
                    <div class="weui_cell_bd weui_cell_primary">
                        该分类下共有<span id="commodityCountFillIn"></span>款商品
                    </div>
                    <div class="weui_cell_ft">
                        <i class="weui_icon_warn"></i>
                    </div>
                </div>
            </div>
            <div class="edit-category-item-tip">
                <div>备注：</div>
                <div>分类名称和备注可编辑</div>
                <div>删除分类将不会删除商品，删除分类后，商品将进入“待分类”类目</div>
            </div>
            <div class="edit-category-btns">
                <div class="delete-category-item">
                    <button class="delete-btn">删除分类</button>
                </div>
                <div class="edit-category-item">
                    <button class="confirm-btn">确定</button>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <%--END 编辑分类--%>
</template>

<%@ include file="../footer.jsp" %>
<script>
    seajs.use('static/js/commodity/commodityManage');
</script>
</body>
</html>