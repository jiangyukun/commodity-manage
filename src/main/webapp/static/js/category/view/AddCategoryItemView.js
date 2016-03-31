/**
 * jiangyukun on 2015/12/3.
 */
define(function (require) {
    var _ = require('underscore');
    var $ = require('zepto');
    var Confirm = require('Confirm');
    var dialog = require('dialog');

    var AddCategoryItemView = Confirm.extend({
        className: 'weui_dialog_confirm',
        initialize: function () {
            this.$el.html(this.template({
                title: '',
                content: '',
                cancel: '取消',
                confirm: '确定'
            }));
            this.$dialogContent = this.$el.find('.confirm-dialog-content');
            var $input = $('<input>').addClass('add-category-item-input font16px').attr('placeholder', '请输入新增分类名称');
            var $newCategoryName = $('<div>').append($input);
            this.$dialogContent.append($newCategoryName);
            this.$newCategoryName = $input;
            this.listenTo(this.model, 'sync', this.categoryItemAdded);
        },
        render: function () {
            return this;
        },
        confirm: function () {
            var self = this;
            var arg = arguments;
            var categoryItemName = this.$newCategoryName.val();
            if (!categoryItemName) {
                this.hide();
                dialog.alert('分类名称不能为空！', function () {
                    self.show();
                });
                return;
            }
            this.$el.remove();
            this.model.set('name', categoryItemName);
            this.model.save();
        },
        categoryItemAdded: function () {
            this.trigger('categoryItemAdded');
            this.destroy();
        },
        destroy: function () {
            this.stopListening();
        }
    });
    var _super = AddCategoryItemView.__super__;
    return AddCategoryItemView;
});
