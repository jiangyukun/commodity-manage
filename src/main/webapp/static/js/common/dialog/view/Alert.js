/**
 * jiangyukun on 2015/12/1.
 */
define(function (require) {
    var $ = require('zepto');
    var util = require('util');
    var AlertModel = require('AlertModel');
    var _ = require('underscore');
    var Backbone = require('backbone');

    return Backbone.View.extend({
        className: 'weui_dialog_alert',
        template: _.template($('#__alertDialog').html()),
        events: {
            'tap .js_btn_confirm': 'confirm'
        },
        initialize: function () {
            var id = _.uniqueId('alert');
            this.$el.attr('id', id).html(this.template(this.model.toJSON()));
            $('body').append(this.$el);
        },
        render: function () {
            return this;
        },
        confirm: function () {
            this.$el.css({display: 'none'});
            this.trigger('confirm');
        },
        show: function () {
            this.$el.css({display: 'block'});
        }
    });
});