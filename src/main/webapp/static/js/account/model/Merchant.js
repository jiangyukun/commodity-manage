/**
 * jiangyukun on 2015/12/1.
 */
define(function (require) {
    var util = require('util');
    var dialog = require('dialog');
    var Backbone = require('backbone');

    return Backbone.Model.extend({
        url: ctx + '/account/saveMerchantInfo',
        defaults: {
            mobile: '',
            password: ''
        },
        validate: function () {
            var mobile = this.get('mobile');
            if (!mobile) {
                dialog.alert('请输入手机号！');
                return true;
            }
            if (!/\d{11}/.test(mobile)) {
                dialog.alert('请输入正确的手机号！');
                return true;
            }
            var password = this.get('password');
            if (!password) {
                dialog.alert('请输入密码！');
                return true;
            }
            if (password.length < 6) {
                dialog.alert('密码长度不能小于6！');
                return true;
            }
        }
    });
});