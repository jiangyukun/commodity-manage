/**
 * jiangyukun on 2015/11/25.
 */
define(function (require) {
    var Backbone = require('backbone');

    var CommodityList = require('CommodityList');
    return Backbone.Model.extend({
        initialize: function (obj) {
            if (this.get('includeCommodity')) {
                this.set('commodityList', new CommodityList(obj.commodityDto));
            }
        },
        defaults: {
            id: '',
            includeCommodity: false,
            name: '',
            commodityList: []
        }
    });
});