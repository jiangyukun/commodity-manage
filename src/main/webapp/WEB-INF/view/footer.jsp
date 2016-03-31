<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("ctx", request.getContextPath()); %>

<%--Loading--%>
<template id="__loadingAnimation">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
        <div class="weui_loading">
            <div class="weui_loading_leaf weui_loading_leaf_0"></div>
            <div class="weui_loading_leaf weui_loading_leaf_1"></div>
            <div class="weui_loading_leaf weui_loading_leaf_2"></div>
            <div class="weui_loading_leaf weui_loading_leaf_3"></div>
            <div class="weui_loading_leaf weui_loading_leaf_4"></div>
            <div class="weui_loading_leaf weui_loading_leaf_5"></div>
            <div class="weui_loading_leaf weui_loading_leaf_6"></div>
            <div class="weui_loading_leaf weui_loading_leaf_7"></div>
            <div class="weui_loading_leaf weui_loading_leaf_8"></div>
            <div class="weui_loading_leaf weui_loading_leaf_9"></div>
            <div class="weui_loading_leaf weui_loading_leaf_10"></div>
            <div class="weui_loading_leaf weui_loading_leaf_11"></div>
        </div>
        <p class="weui_toast_content font14px">{{message}}</p>
    </div>
</template>

<template id="__alertDialog">
    <div class="weui_mask"></div>
    <div class="weui_dialog">
        <div class="weui_dialog_hd dialog-title hidden"><strong class="weui_dialog_title">{{title}}</strong></div>
        <div class="weui_dialog_bd alert-dialog-content font16px">{{message}}</div>
        <div class="weui_dialog_ft font17px">
            <a href="javascript:;" class="weui_btn_dialog primary js_btn_confirm">{{confirm}}</a>
        </div>
    </div>
</template>

<template id="__confirmDialog">
    <div class="weui_mask"></div>
    <div class="weui_dialog">
        <div class="weui_dialog_hd dialog-title hidden"><strong class="weui_dialog_title">{{title}}</strong></div>
        <div class="weui_dialog_bd confirm-dialog-content font16px">{{content}}</div>
        <div class="weui_dialog_ft font17px">
            <a href="javascript:;" class="weui_btn_dialog default js_btn_cancel">{{cancel}}</a>
            <a href="javascript:;" class="weui_btn_dialog primary js_btn_confirm">{{confirm}}</a>
        </div>
    </div>
</template>

<script src="${ctx}/res/seajs/sea.js"></script>
<script>
    +function () {
        var debug = false;
        if (debug) {
            seajs.config({
                base: '${ctx}/',
                alias: {
                    // 类库
                    jquery: 'res/seajs/lib/jquery',
                    zepto: 'res/seajs/lib/zepto',
                    fastclick: 'res/seajs/lib/fastclick',
                    underscore: 'res/seajs/lib/underscore',
                    backbone: 'res/seajs/lib/backbone',
                    IScroll: 'res/seajs/lib/iscroll-lite',
                    weixin: 'http://res.wx.qq.com/open/js/jweixin-1.0.0.js',

                    // 核心
                    webApp: 'static/js/common/webApp',
                    constants: 'static/js/common/constants',
                    config: 'static/js/common/config',
                    util: 'static/js/common/util',
                    dialog: 'static/js/common/dialog/dialog',
                    Assert: 'static/js/common/Assert',

                    // 组件
                    LoadingModel: 'static/js/common/dialog/model/LoadingModel',
                    AlertModel: 'static/js/common/dialog/model/AlertModel',
                    ConfirmModel: 'static/js/common/dialog/model/ConfirmModel',
                    Alert: 'static/js/common/dialog/view/Alert',
                    Confirm: 'static/js/common/dialog/view/Confirm',
                    Loading: 'static/js/common/dialog/view/Loading',
                    BasePageView: 'static/js/common/view/BasePageView',

                    AddCategoryItemCellView: 'static/js/category/view/AddCategoryItemCellView',
                    SelectCategoryView: 'static/js/commodity/common/view//SelectCategoryView',

                    // 绑定
                    Merchant: 'static/js/account/model/Merchant',

                    // 商品管理
                    Commodity: 'static/js/commodity/manage/model/Commodity',
                    CommodityCategory: 'static/js/commodity/manage/model/CommodityCategory',
                    CommodityList: 'static/js/commodity/manage/collection/CommodityList',
                    CommodityCategoryList: 'static/js/commodity/manage/collection/CommodityCategoryList',
                    CommodityManageView: 'static/js/commodity/manage/view/CommodityManageView',
                    CategoryAndCommodityView: 'static/js/commodity/manage/view/CategoryAndCommodityView',
                    CommodityItemView: 'static/js/commodity/manage/view/CommodityItemView',

                    // 商品详情
                    CommodityInfoView: 'static/js/commodity/CommodityInfoView',

                    // 分类管理
                    CategoryItem: 'static/js/category/model/CategoryItem',
                    CategoryList: 'static/js/category/collection/CategoryList',
                    CategoryManageView: 'static/js/category/view/CategoryManageView',
                    CategoryItemView: 'static/js/category/view/CategoryItemView',
                    AddCategoryItemView: 'static/js/category/view/AddCategoryItemView',

                    // 新增商品
                    CategoryItemSelect: 'static/js/commodity/common/model/CategoryItemSelect',
                    CategoryItemSelectList: 'static/js/commodity/common/collection/CategoryItemSelectList',
                    CategoryItemSelectView: 'static/js/commodity/common/view/CategoryItemSelectView',
                    AddCommodityView: 'static/js/commodity/AddCommodityView',

                    // 编辑商品
                    EditCommodityView: 'static/js/commodity/EditCommodityView'
                }
            });
        } else {
            seajs.config({
                base: '${ctx}/',
                alias: {
                    // 类库
                    jquery: 'res/seajs/lib/jquery',
                    zepto: 'res/seajs/lib/min/zepto.min',
                    fastclick: 'res/seajs/lib/min/fastclick.min',
                    underscore: 'res/seajs/lib/min/underscore.min',
                    backbone: 'res/seajs/lib/min/backbone.min',
                    IScroll: 'res/seajs/lib/min/iscroll-lite.min',
                    weixin: 'res/seajs/lib/min/weixin.min',
                    // weixin: 'http://res.wx.qq.com/open/js/jweixin-1.0.0.js',

                    // 核心
                    webApp: 'static/js/common/webApp',
                    constants: 'static/js/common/constants',
                    config: 'static/js/common/config',
                    util: 'static/js/common/util',
                    dialog: 'static/js/common/dialog/dialog',
                    Assert: 'static/js/common/Assert',
                    stateManager: 'static/js/common/stateManager',

                    // 组件
                    LoadingModel: 'static/js/common/dialog/model/LoadingModel',
                    AlertModel: 'static/js/common/dialog/model/AlertModel',
                    ConfirmModel: 'static/js/common/dialog/model/ConfirmModel',
                    Alert: 'static/js/common/dialog/view/Alert',
                    Confirm: 'static/js/common/dialog/view/Confirm',
                    Loading: 'static/js/common/dialog/view/Loading',
                    BasePageView: 'static/js/common/view/BasePageView',

                    AddCategoryItemCellView: 'static/js/category/view/AddCategoryItemCellView',
                    SelectCategoryView: 'static/js/commodity/common/view//SelectCategoryView',

                    // 绑定
                    Merchant: 'static/js/account/model/Merchant',

                    // 商品管理
                    Commodity: 'static/js/commodity/manage/model/Commodity',
                    CommodityCategory: 'static/js/commodity/manage/model/CommodityCategory',
                    CommodityList: 'static/js/commodity/manage/collection/CommodityList',
                    CommodityCategoryList: 'static/js/commodity/manage/collection/CommodityCategoryList',
                    CommodityManageView: 'static/js/commodity/manage/view/CommodityManageView',
                    CategoryAndCommodityView: 'static/js/commodity/manage/view/CategoryAndCommodityView',
                    CommodityItemView: 'static/js/commodity/manage/view/CommodityItemView',

                    // 商品详情
                    CommodityInfoView: 'static/js/commodity/CommodityInfoView',

                    // 分类管理
                    CategoryItem: 'static/js/category/model/CategoryItem',
                    CategoryList: 'static/js/category/collection/CategoryList',
                    CategoryManageView: 'static/js/category/view/CategoryManageView',
                    CategoryItemView: 'static/js/category/view/CategoryItemView',
                    AddCategoryItemView: 'static/js/category/view/AddCategoryItemView',

                    // 新增商品
                    CategoryItemSelect: 'static/js/commodity/common/model/CategoryItemSelect',
                    CategoryItemSelectList: 'static/js/commodity/common/collection/CategoryItemSelectList',
                    CategoryItemSelectView: 'static/js/commodity/common/view/CategoryItemSelectView',
                    AddCommodityView: 'static/js/commodity/AddCommodityView',

                    // 编辑商品
                    EditCommodityView: 'static/js/commodity/EditCommodityView'
                }
            });
        }
    }();
</script>