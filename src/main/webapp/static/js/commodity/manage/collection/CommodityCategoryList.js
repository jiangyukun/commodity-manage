/**
 * jiangyukun on 2015/11/25.
 */
define(function (require) {
    var util = require('util');
    var Backbone = require('backbone');

    var CommodityCategory = require('CommodityCategory');
    return Backbone.Collection.extend({
        url: util.getCtx() + '/commodity/getCommodityCategoryInfo?includeCommodity=true',
        model: CommodityCategory,
        parse: function (jsonResponse) {
            return jsonResponse.data;
        }
    });
});