/**
 * jiangyukun on 2015/11/25.
 */
define(function (require) {
    var util = require('util');
    var dialog = require('dialog');
    var Backbone = require('backbone');
    return Backbone.Model.extend({
        initialize: function (obj) {
            if (!obj) return;
            if (obj.name && obj.name.length > 7) {
                this.set('name', obj.name.substr(0, 7) + '...');
            }
            if (!obj.imgUrl) {
                this.set('imgUrl', ctx + '/static/images/commodity/icon-default.png');
            }
            this.on('sync', this.checkImage);
        },
        defaults: {
            id: null,
            barcode: '',
            name: '',
            categoryId: '',
            imgId: '',
            imgUrl: '',
            price: '',
            specification: '',
            recommend: 0,
            state: 1
        },
        urlRoot: util.getCtx() + '/commodity',
        parse: function (jsonResponse) {
            if (jsonResponse.data) {
                return jsonResponse.data;
            }
            return jsonResponse;
        },
        validate: function () {
            var name = this.get('name');
            var category = this.get('categoryId');
            var price = this.get('price');
            var specification = this.get('specification');
            if (!name) {
                dialog.alert('请输入商品名称');
                return true;
            }
            if (!category) {
                dialog.alert('请选择商品分类！');
                return true;
            }
            if (!specification) {
                dialog.alert('请输入商品规格！');
                return true;
            }
            if (!price) {
                dialog.alert('请输入价格！');
                return true;
            }
        },
        checkImage: function () {
            if (!this.get('imgUrl')) {
                this.set('imgUrl', ctx + '/static/images/commodity/icon-default.png');
            }
        }
    });
});