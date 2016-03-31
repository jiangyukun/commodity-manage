/**
 * jiangyukun on 2015-12-02 11:08
 */
define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var Backbone = require('backbone');
    var util = require('util');
    var ConfirmModel = require('ConfirmModel');

    return Backbone.View.extend({
        className: 'weui_dialog_confirm',
        template: _.template($('#__confirmDialog').html()),
        events: {
            'tap .js_btn_cancel': 'cancel',
            'tap .js_btn_confirm': 'confirm',
            'tap .weui_mask': 'cancel'
        },
        initialize: function () {
            this.$el.html(this.template(this.model.toJSON()));
        },
        render: function () {
            return this;
        },
        cancel: function () {
            this.$el.css({display: 'none'});
            this.trigger('cancel');
            this.destroy();
        },
        confirm: function () {
            this.$el.css({display: 'none'});
            this.trigger('confirm');
            this.destroy();
        },
        hide: function () {
            this.$el.css({display: 'none'});
        },
        show: function () {
            this.$el.css({display: 'block'});
            this.trigger('show');
        },
        destroy: function () {
            this.$el.remove();
            this.stopListening();
        }
    });
});