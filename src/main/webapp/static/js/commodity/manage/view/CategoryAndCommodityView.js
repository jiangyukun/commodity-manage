/**
 * jiangyukun on 15/12/5.
 */
define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var Backbone = require('backbone');
    var CommodityItemView = require('CommodityItemView');
    var util = require('util');
    var config = require('config');

    var categoryItemPrefix = '_category_item_';
    var commodityItemContainerPrefix = '_commodity_item_container_';

    return Backbone.View.extend({
        className: 'categoryAndCommodity',
        template: _.template($('#categoryAndCommodityTemplate').html()),
        events: {
            'tap .category-item': 'changeCategory'
        },
        initialize: function () {
            this.$el.html(this.template());
            this.$iScrollCategoryWrapper = this.$el.find('#iScrollCategoryWrapper');
            this.$categoryNav = this.$el.find('#categoryNav');
            this.categoryIScroll = util.smoothScroll(this.$iScrollCategoryWrapper);
            this.commodityContainerIScrolls = [];

            this.listenTo(this.collection, 'sync', this.render);
        },
        render: function () {
            var self = this;
            this.$categoryNav.children().remove();
            this.$el.find('.iScrollCommodityWrapper').remove();
            this.collection.each(function (commodityCategory, index) {
                var commodityList = commodityCategory.get('commodityList');
                //分类
                var categoryId = commodityCategory.get('id');
                var categoryName = commodityCategory.get('name');
                if (commodityList.size() != 0) {
                    var $div = $('<li>').text(categoryName);
                    $div.attr('id', categoryItemPrefix + categoryId).addClass('category-item');
                    if (index == 0) {
                        $div.addClass('active');
                    }
                    self.$categoryNav.append($div[0]);
                }
                //商品
                var $commodityItemWrapper = $('<div>').attr('id', commodityItemContainerPrefix + categoryId).addClass('iScrollCommodityWrapper');
                self.$el.append($commodityItemWrapper[0]);
                var $commodityItemContainer = $('<ul>').addClass('');
                if (index != 0) {
                    $commodityItemWrapper.addClass('hidden');
                }
                $commodityItemWrapper.append($commodityItemContainer[0]);
                commodityList.each(function (commodity) {
                    var commodityItemView = new CommodityItemView({model: commodity});
                    self.listenTo(commodityItemView, 'commodityInfo', self.commodityInfo);
                    $commodityItemContainer.append(commodityItemView.render().el);
                });
                if (commodityList.size() != 0) {
                    self.commodityContainerIScrolls.push(util.smoothScroll($commodityItemWrapper));
                }
            });
            this.refresh();
            return this;
        },
        refresh: function () {
            var self = this;
            this.categoryIScroll.refresh();
            for (var i = 0; i < this.commodityContainerIScrolls.length; i++) {
                var commodityContainerIScroll = this.commodityContainerIScrolls[i];
                commodityContainerIScroll.refresh();
            }
        },
        commodityInfo: function (commodityId) {
            this.trigger('commodityInfo', commodityId);
        },
        changeCategory: function (event) {
            var categoryItem = $(event.target);
            categoryItem.addClass('active').siblings().removeClass('active');
            var $commodityContainerId = categoryItem.attr('id').replace(categoryItemPrefix, commodityItemContainerPrefix);
            this.$el.find('#' + $commodityContainerId).removeClass('hidden').siblings('.iScrollCommodityWrapper').addClass('hidden');
            this.refresh();
        }
    });
});