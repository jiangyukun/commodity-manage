/**
 * jiangyukun on 15/11/17.
 */
define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var Backbone = require('backbone');

    var config = require('config');
    var util = require('util');
    var dialog = require('dialog');
    var webApp = require('webApp');
    var Assert = require('Assert');
    var weixin = require('weixin');
    var stateManager = require('stateManager');

    // 商品管理
    var CommodityManageView = require('CommodityManageView');
    // 商品详情
    var CommodityInfoView = require('CommodityInfoView');

    // 添加商品
    var Commodity = require('Commodity');
    var AddCommodityView = require('AddCommodityView');

    // 分类管理
    var CategoryList = require('CategoryList');
    var CategoryManageView = require('CategoryManageView');

    // 编辑商品
    var EditCommodityView = require('EditCommodityView');

    var stack = [];
    var pageContainer = $('.page-container');

    webApp.init();
    util.initWx(weixin, ['scanQRCode', 'hideOptionMenu'], function () {
        weixin.hideOptionMenu();
    });

    var PageRoute = Backbone.Router.extend({
        routes: {
            '': 'commodityManage',
            'commodityInfo/:id': 'commodityInfo',
            'barcodeAdd': 'barcodeAdd',
            'addCommodity': 'addCommodity',
            'addCommodity/:barcode': 'addCommodityByBarcode',
            'categoryManage': 'categoryManage',
            'editCommodity/:id': 'editCommodity'
        },
        toPage: function (pageId) {
            this.navigate(pageId, true);
        },
        commodityManage: function () {
            //this.setTitle('商品管理');
            if (this.preCreate(CommodityManageView)) {
                return;
            }
            dialog.loading();
            var commodityManageView = new CommodityManageView();
            pageContainer.append(commodityManageView.el);
            this.postCreate(commodityManageView);
        },
        commodityInfo: function (id) {
            //this.setTitle('商品详情');
            if (this.preCreate(CommodityInfoView)) {
                return;
            }
            var commodity = new Commodity({id: id});
            var commodityInfoView = new CommodityInfoView({model: commodity});
            commodity.fetch();
            dialog.loading();
            commodity.once('sync', function () {
                webApp.refreshFontSize(commodityInfoView.$el);
                dialog.loading(false);
            });
            pageContainer.append(commodityInfoView.el);
            this.postCreate(commodityInfoView);
        },
        addCommodityByBarcode: function (barcode) {
            //this.setTitle('添加商品');
            if (this.preCreate(AddCommodityView)) {
                return;
            }
            var commodity = new Commodity();
            var commodityView = new AddCommodityView({model: commodity}, barcode);
            pageContainer.append(commodityView.render().el);
            this.postCreate(commodityView);
        },
        addCommodity: function () {
            //this.setTitle('添加商品');
            if (this.preCreate(AddCommodityView)) {
                return;
            }
            var commodity = new Commodity();
            var commodityView = new AddCommodityView({model: commodity});
            pageContainer.append(commodityView.render().el);
            this.postCreate(commodityView);
        },
        categoryManage: function () {
            //this.setTitle('分类管理');
            if (this.preCreate(CategoryManageView)) {
                return;
            }
            var categoryList = new CategoryList();
            var categoryManageView = new CategoryManageView({collection: categoryList});
            pageContainer.append(categoryManageView.el);
            categoryList.fetch();
            dialog.loading();
            categoryList.once('sync', function () {
                webApp.refreshFontSize(categoryManageView.$el);
                dialog.loading(false);
            });
            this.postCreate(categoryManageView);
        },
        editCommodity: function (id) {
            //this.setTitle('更新商品');
            if (this.preCreate(EditCommodityView)) {
                return;
            }
            var commodity = new Commodity({id: id});
            var editCommodityView = new EditCommodityView({model: commodity});
            commodity.fetch();
            dialog.loading();
            commodity.once('sync', function () {
                webApp.refreshFontSize(editCommodityView.$el);
                dialog.loading(false);
            });
            pageContainer.append(editCommodityView.el);
            this.postCreate(editCommodityView);
        },
        setTitle: function (title) {
            util.pageTitle(title);
        },
        preCreate: function (PageView) {
            var i, j, page, stackLength = stack.length;
            for (i = stackLength - 1; i >= 0; i--) {
                if (stack[i] instanceof PageView) {
                    break;
                }
            }
            if (i >= 0) {
                for (j = i + 1; j < stackLength; j++) {
                    page = stack.pop().destroy();
                }
                if (stateManager.getRefreshState() == true) {
                    stack[stack.length - 1].refresh();
                }
                return true;
            }
            return false;
        },
        postCreate: function (pageView) {
            stack.push(pageView);
            this.listenTo(pageView, 'toPage', this.toPage);
            webApp.refreshFontSize($('.page-container'));
        }
    });
    new PageRoute();
    Backbone.history.start();
});
