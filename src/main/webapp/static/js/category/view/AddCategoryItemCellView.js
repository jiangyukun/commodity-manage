/**
 * jiangyukun on 2015-12-04 21:22.
 */
define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var Backbone = require('backbone');

    return Backbone.View.extend({
        tagName: 'li',
        className: 'addCategoryItemOfCategoryManage',
        template: _.template($('#addCategoryCell').html()),
        events: {
            'tap': 'addCategoryItem'
        },
        initialize: function () {
            this.$el.html(this.template());
        },
        render: function () {
            return this;
        },
        addCategoryItem: function () {
            this.trigger('addCategoryItem');
        }
    })
});
