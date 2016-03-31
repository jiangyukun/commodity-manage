/**
 * jiangyukun on 2015/12/2.
 */
define(function (require) {
    var Backbone = require('backbone');
    return Backbone.Model.extend({
        defaults: {
            title: '提示',
            content: '',
            cancel: '取消',
            confirm: '确定'
        }
    });
});
