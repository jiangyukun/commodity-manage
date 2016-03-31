/**
 * jiangyukun on 15/12/6.
 */
define(function (require) {
    var Backbone = require('backbone');

    return Backbone.View.extend({
        className: 'page slideIn font12px',
        refresh: function () {
            if (this.model) {
                this.model.fetch();
            }
            if (this.collection) {
                this.collection.fetch();
            }
        },
        destroy: function () {
            var self = this;
            this.$el.addClass('slideOut').on('animationend', function () {
                self.remove();
            }).on('webkitAnimationEnd', function () {
                self.remove();
            });
            this.stopListening();
        }
    });
});