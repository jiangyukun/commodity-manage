/**
 * jiangyukun on 15/12/5.
 */
define(function (require) {
    var $ = require('zepto');
    var _ = require('underscore');
    var Backbone = require('backbone');

    return Backbone.View.extend({
        tagName: 'li',
        className: 'commodityItem',
        template: _.template($('#commodityTemplate').html()),
        events: {
            'tap': 'commodityInfo'
        },
        initialize: function () {
            this.$el.html(this.template());
            this.$image = this.$el.find('.image');
            this.$commodityName = this.$el.find('.commodityName');
            this.$commoditySpecification = this.$el.find('.commoditySpecification');
            this.$commodityPrice = this.$el.find('.commodityPrice');
        },
        render: function () {
            var imgUrl = this.model.get('imgUrl');
            var $img = $('<img>').attr('src', imgUrl);
            this.$image.children().remove();
            if (imgUrl.indexOf('icon-default') != -1) {
                var $defaultImgContainer = $('<div>').addClass('default-img');
                $defaultImgContainer.append($img[0]);
                this.$image.append($defaultImgContainer[0]);
            } else {
                this.$image.append($img[0]);

            }
            this.$commodityName.text(this.model.get('name'));
            this.$commoditySpecification.text(this.model.get('specification'));
            this.$commodityPrice.text('￥' + this.model.get('price'));
            return this;
        },
        destroy: function () {
            this.$el.remove();
        },
        commodityInfo: function () {
            this.trigger('commodityInfo', this.model.get('id'));
        }
    });
});