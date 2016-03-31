/**
 * jiangyukun on 2015/12/2
 */
define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var BasePageView = require('BasePageView');

    var util = require('util');
    var Assert = require('Assert');
    var dialog = require('dialog');
    var webApp = require('webApp');
    var stateManager = require('stateManager');
    var CategoryItemView = require('CategoryItemView');
    var CategoryItem = require('CategoryItem');
    var AddCategoryItemView = require('AddCategoryItemView');

    return BasePageView.extend({
        template: _.template($('#categoryManageTemplate').html()),
        events: {
            'tap .weui_mask_transition': 'closeEditCategoryItem',
            'tap .delete-btn': 'deleteCategoryItem',
            'tap .confirm-btn': 'updateCategoryItem',
            'tap .category-back': 'back',
            'tap .add-category-item': 'addCategoryItem',
            'tap .close-edit-category': 'closeEditCategoryItem'
        },
        initialize: function () {
            var self = this;
            this.$el.html(this.template());
            this.$categoryList = this.$el.find('#categoryItemList');

            //编辑
            this.$editCategoryItemPanel = this.$el.find('#editCategoryItemPanel');
            this.$weuiMaskTransition = this.$el.find('.weui_mask_transition');
            this.$weuiActionsheet = this.$el.find('.weui_actionsheet');
            this.$categoryItemNameFillIn = this.$el.find('#categoryItemNameFillIn');
            this.$categoryWeightFillIn = this.$el.find('#categoryWeightFillIn');
            this.$commodityCountFillIn = this.$el.find('#commodityCountFillIn');

            this.listenTo(this.collection, 'sync', this.render);
        },
        render: function () {
            dialog.loading(false);
            var self = this;
            self.$categoryList.children().remove();
            this.collection.each(function (model) {
                var categoryItemView = new CategoryItemView({model: model});
                self.$categoryList.append(categoryItemView.render().el);
                self.listenTo(categoryItemView, 'editCategoryItem', self.editCategoryItem);
            });
            return this;
        },
        confirm: function () {
            this.$el.css({display: 'none'});
            this.trigger('confirm');
        },
        show: function () {
            this.$el.css({display: 'block'});
        },
        editCategoryItem: function (categoryItem) {
            this.categoryItemId = categoryItem.get('id');
            this.$editCategoryItemPanel.removeClass('hidden');
            this.$weuiMaskTransition.addClass('weui_fade_toggle').css({display: 'block'});
            this.$weuiActionsheet.addClass('weui_actionsheet_toggle');
            this.$categoryItemNameFillIn.text(categoryItem.get('name'));
            this.$categoryWeightFillIn.val(categoryItem.get('weight'));
            this.$commodityCountFillIn.text(categoryItem.get('commodityCount'));
        },
        closeEditCategoryItem: function () {
            this.$editCategoryItemPanel.addClass('hidden');
            this.$weuiMaskTransition.removeClass('weui_fade_toggle').css({display: 'none'});
            this.$weuiActionsheet.removeClass('weui_actionsheet_toggle');
        },
        deleteCategoryItem: function () {
            var self = this;
            dialog.confirm('确定删除此分类吗?', function () {
                stateManager.setFreshState(true);
                var deleteLoading = dialog.newLoading('删除分类中...');
                var categoryItem = self.collection.get(self.categoryItemId);
                self.collection.once('sync', function () {
                    deleteLoading.destroy();
                });
                categoryItem.destroy({
                    success: function (model, jsonResponse) {
                        try {
                            Assert.correct(jsonResponse);
                            self.refreshCategoryList();
                        } catch (e) {
                            deleteLoading.destroy();
                            dialog.alert(jsonResponse.message);
                        }
                    }
                });
                self.closeEditCategoryItem();
            });
        },
        updateCategoryItem: function () {
            var self = this;
            dialog.confirm('确定更新吗?', function () {
                stateManager.setFreshState(true);
                var categoryItem = self.collection.get(self.categoryItemId);
                categoryItem.set('weight', self.$categoryWeightFillIn.val());
                categoryItem.save({}, {
                    success: function () {
                        self.refreshCategoryList();
                    }
                });
                self.closeEditCategoryItem();
            });
        },
        addCategoryItem: function () {
            var addCategoryItemView = new AddCategoryItemView({model: new CategoryItem()});
            this.listenTo(addCategoryItemView, 'categoryItemAdded', this.refreshCategoryList);
            this.$el.append(addCategoryItemView.render().el);
            webApp.refreshFontSize(addCategoryItemView.$el);
        },
        refreshCategoryList: function () {
            stateManager.setFreshState(true);
            this.collection.fetch();
        },
        back: function () {
            history.back();
        }
    });
});
