/**
 * jiangyukun on 2015/12/2
 */
define(function (require) {
    var util = require('util');
    var $ = require('zepto');
    var Backbone = require('backbone');

    return Backbone.View.extend({
        tagName: 'li',
        className: 'categoryItemOfCategoryManage',
        events: {
            'tap ': 'edit'
        },
        initialize: function () {
        },
        render: function () {
            this.$el.text(this.model.get('name'));
            var $icon = $('<img>').attr('src', util.url('/static/images/icon/right.png'));
            var $rightIconContainer = $('<div>').addClass('item-icon-container');
            $rightIconContainer.append($icon);
            this.$el.append($rightIconContainer);
            return this;
        },
        edit: function () {
            this.trigger('editCategoryItem', this.model);
        }
    });
});
