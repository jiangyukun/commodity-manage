/**
 * jiangyukun on 2015/11/19.
 */
define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var Backbone = require('backbone');

    var util = require('util');
    var webApp = require('webApp');
    var CategoryItemSelectView = require('CategoryItemSelectView');
    var CategoryItem = require('CategoryItem');
    var AddCategoryItemView = require('AddCategoryItemView');
    var AddCategoryItemCellView = require('AddCategoryItemCellView');

    return Backbone.View.extend({
        className: 'hidden',
        template: _.template($('#selectCategoryTemplate').html()),
        events: {
            'tap .weui_mask_transition': 'hide',
            'tap .close-select-category': 'hide',
            'tap .add-of-select-category': 'addCategoryItem'
        },
        initialize: function () {
            this.$el.html(this.template());
            this.$categorySelectItems = this.$el.find('#categorySelectItems');
            this.$weuiMaskTransition = this.$el.find('.weui_mask_transition');
            this.$weuiActionsheet = this.$el.find('.weui_actionsheet');

            this.listenTo(this.collection, 'sync', this.render);
        },
        render: function () {
            var self = this;
            this.collection.each(function (categoryItemSelect) {
                var categoryItemSelectView = new CategoryItemSelectView({model: categoryItemSelect});
                self.listenTo(categoryItemSelectView, 'categoryItemSelected', self.categoryItemSelected);
                self.$categorySelectItems.append(categoryItemSelectView.render().el);
            });
            return this;
        },
        addCategoryItem: function () {
            this.$el.hide();
            var addCategoryItemView = new AddCategoryItemView({model: new CategoryItem()});
            this.listenTo(addCategoryItemView, 'categoryItemAdded', this.categoryItemAdded);
            this.listenTo(addCategoryItemView, 'cancel', this.cancelAddCategoryItem);
            this.$el.parent().append(addCategoryItemView.render().el);
            webApp.refreshFontSize(addCategoryItemView.$el);
        },
        categoryItemAdded: function () {
            this.collection.fetch();
            this.trigger('categoryItemAdded');
            this.$el.show();
        },
        cancelAddCategoryItem: function () {
            this.trigger('cancelAddCategoryItem');
            this.$el.show();
        },
        categoryItemSelected: function (categoryId, categoryName) {
            this.trigger('categoryItemSelected', categoryId, categoryName);
            this.hide();
        },
        hide: function () {
            this.$el.addClass('hidden');
            this.$weuiMaskTransition.removeClass('weui_fade_toggle').css({display: 'none'});
            this.$weuiActionsheet.removeClass('weui_actionsheet_toggle');
        },
        show: function () {
            this.$el.removeClass('hidden');
            this.$weuiMaskTransition.addClass('weui_fade_toggle').css({display: 'block'});
            this.$weuiActionsheet.addClass('weui_actionsheet_toggle');
        }
    });
});
