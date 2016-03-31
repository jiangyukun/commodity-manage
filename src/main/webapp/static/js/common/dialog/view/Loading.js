/**
 * jiangyukun on 2015-12-02 15:54
 */
define(function (require) {
    var $ = require('zepto');
    var util = require('util');
    var _ = require('underscore');
    var Backbone = require('backbone');

    return Backbone.View.extend({
        className: 'weui_loading_toast',
        template: _.template($('#__loadingAnimation').html()),
        initialize: function () {
            var message = this.model ? this.model.get('message') : '数据加载中...';
            this.$el.css({display: 'none'}).html(this.template({message: message}));
            $('body').append(this.$el);
            this.noMoreShow = false;
        },
        render: function () {
            return this;
        },
        hide: function () {
            this.$el.css({display: 'none'});
            this.trigger('hide');
            this.noMoreShow = true;
        },
        show: function () {
            var self = this;
            self.noMoreShow = false;
            setTimeout(function () {
                if (self.noMoreShow) {
                    return;
                }
                self.$el.css({display: 'block'});
                self.trigger('show');
            }, 400);
        },
        destroy: function () {
            this.trigger('destroy');
            this.$el.remove();
            this.stopListening();
        }
    });
});