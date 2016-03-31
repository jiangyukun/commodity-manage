/**
 * jiangyukun on 2015-12-02 17:39
 */
define(function (require) {
    var Backbone = require('backbone');
    var util = require('util');
    var CategoryItem = require('CategoryItem');

    return Backbone.Collection.extend({
        url: util.url('/category'),
        model: CategoryItem,
        parse: function (jsonResponse) {
            return jsonResponse.data;
        }
    });
});