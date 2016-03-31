define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var dialog = require('dialog');
    var constants = require('constants');
    var stateManager = require('stateManager');
    var BasePageView = require('BasePageView');

    return BasePageView.extend({
        template: _.template($('#commodityInfoTemplate').html()),
        events: {
            'tap #back': 'back',
            'tap #deleteCommodity': 'deleteCommodity',
            'tap #undercarriageCommodity': 'undercarriageCommodity', // 下架
            'tap #editCommodity': 'editCommodity'
        },
        initialize: function () {
            this.$el.html(this.template());
            this.$pictureContainer = this.$el.find('.pictureContainer');
            this.$barcodeInfo = this.$el.find('#barcodeInfo');
            this.$commodityNameOfInfo = this.$el.find('#commodityNameOfInfo');
            this.$commodityCategoryOfInfo = this.$el.find('#commodityCategoryOfInfo');
            this.$commoditySpecificationOfInfo = this.$el.find('#commoditySpecificationOfInfo');
            this.$commodityPriceOfInfo = this.$el.find('#commodityPriceOfInfo');
            this.$isRecommended = this.$el.find('#isRecommendedOfInfo');
            this.listenTo(this.model, 'sync', this.render);
        },
        render: function () {
            var $img = $('<img>').attr('src', this.model.get('imgUrl'));
            this.$pictureContainer.children().remove();
            this.$pictureContainer.append($img[0]);
            var barcode = this.model.get('barcode');
            if (!barcode) {
                this.$barcodeInfo.addClass('base-tip-color');
                barcode = '暂无条码';
            }
            this.$barcodeInfo.text(barcode);
            this.$commodityNameOfInfo.text(this.model.get('name'));
            this.$commodityCategoryOfInfo.text(this.model.get('categoryName'));
            this.$commoditySpecificationOfInfo.text(this.model.get('specification'));
            this.$commodityPriceOfInfo.text(this.model.get('price'));
            this.$isRecommended.prop('checked', this.model.get('recommend') == constants.recommend_yes);
            return this;
        },
        back: function () {
            history.back();
        },
        deleteCommodity: function () {
            var self = this;
            dialog.confirm('确定删除此商品吗?', function () {
                self.model.destroy({
                    success: function () {
                        stateManager.setFreshState(true);
                        self.trigger('toPage', '');
                    }
                });
            });
        },
        undercarriageCommodity: function () {
            var self = this;
            dialog.confirm('确定下架此商品吗?', function () {
                var undercarriage = dialog.newLoading('处理中...');
                self.model.set('state', constants.state_no);
                self.model.save(null, {
                    success: function () {
                        undercarriage.destroy();
                        self.trigger('toPage', '');
                    }
                });
            });
        },
        editCommodity: function () {
            this.trigger('toPage', 'editCommodity/' + this.model.get('id'));
        }
    });
});