/**
 * jiangyukun on 2015-12-04 16:17.
 */
define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var weixin = require('weixin');
    var BasePageView = require('BasePageView');

    var config = require('config');
    var util = require('util');
    var dialog = require('dialog');
    var CommodityItemView = require('CommodityItemView');
    var CommodityList = require('CommodityList');
    var CommodityCategoryList = require('CommodityCategoryList');
    var CategoryAndCommodityView = require('CategoryAndCommodityView');

    return BasePageView.extend({
        template: _.template($('#commodityManageTemplate').html()),
        events: {
            'submit #searchCommodityForm': 'searchCommodity',
            'tap #barcodeAdd': 'barcodeAdd',
            'tap #manualAddNav': 'manualAddNav',
            'tap #categoryManage': 'categoryManage',
            'tap .search-back': 'searchBack'
        },
        initialize: function () {
            this.$el.html(this.template());
            this.$searchCommodity = this.$el.find('#searchCommodity');
            this.$searchBox = this.$el.find('.searchBox');
            this.$searchResultList = this.$el.find('#searchResultList');
            this.commodityCategoryList = new CommodityCategoryList();
            var categoryAndCommodityView = new CategoryAndCommodityView({collection: this.commodityCategoryList});
            this.categoryAndCommodityView = categoryAndCommodityView;
            this.commodityCategoryList.fetch({url: util.url('/commodity/getCommodityCategoryInfo?includeCommodity=true')});
            this.$el.append(categoryAndCommodityView.el);

            this.listenTo(categoryAndCommodityView, 'commodityInfo', this.commodityInfo);
            this.listenTo(this.commodityCategoryList, 'sync', function () {
                dialog.loading(false);
            });
        },
        render: function () {
            return this;
        },
        refresh: function () {
            this.commodityCategoryList.reset();
            this.commodityCategoryList.fetch({url: util.url('/commodity/getCommodityCategoryInfo?includeCommodity=true')});
            this.categoryAndCommodityView.refresh();
        },
        commodityInfo: function (commodityId) {
            this.trigger('toPage', 'commodityInfo/' + commodityId);
        },
        barcodeAdd: function () {
            var self = this;
            if (config.phase == 'dev') {
                self.trigger('toPage', 'addCommodity/0000');
                return;
            }
            weixin.scanQRCode({
                needResult: 1,
                scanType: ["barCode"],
                success: function (res) {
                    var result = res.resultStr;
                    self.trigger('toPage', 'addCommodity/' + result.substring(7));
                }
            });
        },
        manualAddNav: function () {
            this.trigger('toPage', 'addCommodity');
        },
        categoryManage: function () {
            this.trigger('toPage', 'categoryManage');
        },
        searchCommodity: function () {
            var commodityList = new CommodityList();
            this.listenTo(commodityList, 'sync', this.freshResult);
            commodityList.fetch({
                url: util.url('/commodity/search'),
                data: {
                    searchName: this.$searchCommodity.val()
                }
            });
            this.$searchBox.removeClass('hidden');
            return false;
        },
        freshResult: function (commodityList) {
            var self = this;
            this.$searchResultList.children().remove();
            commodityList.each(function (commodity) {
                var commodityItemView = new CommodityItemView({model: commodity});
                self.listenTo(commodityItemView, 'commodityInfo', self.commodityInfo);
                self.$searchResultList.append(commodityItemView.render().el);
            });
        },
        searchBack: function () {
            this.$searchBox.addClass('hidden');
            this.$searchResultList.children().remove();
        }
    });
});
