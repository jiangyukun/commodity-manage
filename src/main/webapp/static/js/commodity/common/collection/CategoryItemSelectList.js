/**
 * jiangyukun on 2015-12-04 20:11.
 */
define(function (require) {
    var util = require('util');
    var CategoryItemSelect = require('CategoryItemSelect');
    var Backbone = require('backbone');

    return Backbone.Collection.extend({
        url: util.url('/category/categorySelect'),
        model: CategoryItemSelect,
        parse: function (jsonResponse) {
            return jsonResponse.data;
        }
    });
});