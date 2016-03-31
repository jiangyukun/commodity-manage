/**
 * jiangyukun on 2015-12-04 19:54.
 */
define(function (require) {
    var util = require('util');
    var Backbone = require('backbone');

    return Backbone.Model.extend({
        urlRoot: util.url('/category/categorySelect'),
        defaults: {
            id: null,
            name: ''
        }
    });
});
