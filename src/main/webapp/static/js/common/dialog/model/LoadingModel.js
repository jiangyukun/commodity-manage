/**
 * jiangyukun on 2015/12/1.
 */
define(function (require) {
    var Backbone = require('backbone');

    return Backbone.Model.extend({
        defaults: {
            message: ''
        }
    });
});
