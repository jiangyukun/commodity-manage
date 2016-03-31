/**
 * jiangyukun on 2015/11/25.
 */
define(function (require) {
    var Commodity = require('Commodity');
    var Backbone = require('backbone');

    return Backbone.Collection.extend({
        model: Commodity,
        parse: function (jsonResponse) {
            return jsonResponse.data;
        }
    });
});