/**
 * jiangyukun on 2015-12-04 19:44.
 */
define(function (require) {
    var $ = require('zepto');
    var Backbone = require('backbone');
    return Backbone.View.extend({
        tagName: 'li',
        className: 'list-item',
        events: {
            'tap': 'selectCategory'
        },
        initialize: function () {
            var $radio = $('<input>').attr('type', 'radio').attr('name', 'selectCategoryItem');
            var $span = $('<span>').css({'margin-left': '20px'}).text(this.model.get('name'));
            this.$el.append($radio[0]).append($span[0]);
        },
        render: function () {
            return this;
        },
        selectCategory: function () {
            this.trigger('categoryItemSelected', this.model.get('id'), this.model.get('name'));
        }
    });
});
