/**
 * jiangyukun on 15/11/18.
 */
define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var BasePageView = require('BasePageView');
    var webApp = require('webApp');
    var util = require('util');
    var dialog = require('dialog');
    var Assert = require('Assert');
    var stateManager = require('stateManager');

    var Commodity = require('Commodity');
    var CategoryItemSelectList = require('CategoryItemSelectList');
    var SelectCategoryView = require('SelectCategoryView');

    webApp.init();
    // --------- weixin
    var weixin = require('weixin');
    util.initWx(weixin, ['scanQRCode']);

    return BasePageView.extend({
        template: _.template($('#addCommodityTemplate').html()),
        events: {
            'change #picture': 'uploadPicture',
            'tap .barcode-scan': 'scanBarCode',
            'tap #confirmAddCommodity': 'save',
            'tap #cancelAddCommodity': 'back',
            'tap #selectCategory': 'selectCategory'
        },
        initialize: function (option, barcode) {
            this.$el.html(this.template());
            this.$pictureContainer = this.$el.find('.pictureContainer');
            this.$barCode = this.$el.find('.barCode');
            this.$commodityName = this.$el.find('.commodityNameOfAdd');
            this.$commodityCategory = this.$el.find('.commodityCategory');
            this.$price = this.$el.find('.price');
            this.$specification = this.$el.find('.specification');
            this.$recommendCheckbox = this.$el.find('#isRecommended');
            //选择商品分类
            var categoryItemSelectList = new CategoryItemSelectList();
            this.selectCategoryView = new SelectCategoryView({collection: categoryItemSelectList});
            categoryItemSelectList.fetch();
            this.$el.append(this.selectCategoryView.render().el);

            if (barcode) {
                this.initCommodity(barcode);
            }
            this.listenTo(this.selectCategoryView, 'categoryItemSelected', this.categoryItemSelected);
        },
        render: function () {
            return this;
        },
        initCommodity: function (barcode) {
            dialog.loading();
            this.$barCode.val(barcode);
            $.ajax({
                url: util.url('/commodity/queryBarcode'),
                type: 'GET',
                data: {
                    barcode: barcode
                },
                success: function () {
                    dialog.loading(false);
                }
            });
        },
        uploadPicture: function (event) {
            var fileUploadLoading = dialog.newLoading('图片上传中...');
            var picture = event.target.files[0];
            var logoForm = new FormData();
            var self = this;
            logoForm.append('file', picture);
            $.ajax({
                type: 'POST',
                url: util.getCtx() + '/file/upload',
                data: logoForm,
                contentType: false,
                processData: false,
                dataType: 'json',
                success: function (jsonResponse) {
                    fileUploadLoading.destroy();
                    try {
                        Assert.correct(jsonResponse);
                        var imageDto = jsonResponse.data;
                        self.$pictureContainer.html('<img class="preview" src="' + imageDto.data.thumbnail + '" />');
                        self.model.set('imgId', imageDto.imgId);
                    } catch (e) {
                        dialog.alert('图片上传失败!');
                    }
                }
            });
        },
        scanBarCode: function () {
            var self = this;
            weixin.scanQRCode({
                needResult: 1,
                scanType: ["barCode"],
                success: function (res) {
                    var result = res.resultStr;
                    self.$barCode.val(result.substring(7));
                }
            });
        },
        selectCategory: function () {
            this.selectCategoryView.show();
        },
        categoryItemSelected: function (categoryId, categoryName) {
            this.model.set('categoryId', categoryId);
            this.$commodityCategory.css({color: 'black'}).text(categoryName);
        },
        back: function () {
            dialog.confirm('确定放弃添加商品吗?', function () {
                history.back();
            });
        },
        save: function () {
            this.model.set('name', this.$commodityName.val());
            this.model.set('price', this.$price.val());
            this.model.set('specification', this.$specification.val());
            this.model.set('recommend', this.$recommendCheckbox.prop('checked') ? 1 : 0);
            this.doSave();
        },
        doSave: function () {
            var self = this;
            this.model.save(null, {
                success: function () {
                    dialog.alert('商品添加成功!', function () {
                        stateManager.setFreshState(true);
                        self.trigger('toPage', '');
                    });
                }
            });
        }
    });
});
