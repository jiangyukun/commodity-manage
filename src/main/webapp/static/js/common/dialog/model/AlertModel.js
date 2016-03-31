/**
 * jiangyukun on 2015/12/1.
 */
define(function (require) {
    var Backbone = require('backbone');

    return Backbone.Model.extend({
        defaults: {
            title: '提示',
            message: '',
            confirm: '确定'
        }
    });
});
