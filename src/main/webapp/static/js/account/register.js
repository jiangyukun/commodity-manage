/**
 * jiangyukun on 2015-11-09 10:57
 */
define(function (require) {
    var $ = require('zepto');
    var weixin = require('weixin');
    var Backbone = require('backbone');

    var config = require('config');
    var util = require('util');
    var dialog = require('dialog');
    var Assert = require('Assert');
    var webApp = require('webApp');
    var Merchant = require('Merchant');

    webApp.init();
    util.initWx(weixin, ['closeWindow', 'scanQRCode']);

    var RegisterView = Backbone.View.extend({
        el: '.weui_cells_form',
        events: {
            'input #mobile': 'render',
            'input #code': 'checkCode',
            'input #password': 'render',
            'tap #getCode': 'getCode',
            'tap #bind': 'bind'
        },
        initialize: function () {
            this.$mobile = this.$el.find('#mobile');
            this.$password = this.$el.find('#password');
            this.$code = this.$el.find('#code');
            this.$getCode = this.$el.find('#getCode');
            this.$bind = this.$el.find('#bind');
            this.codeOk = false;
            this.render();
        },
        render: function () {
            var self = this;
            var mobile = this.$mobile.val();
            var password = this.$password.val();

            this.model.set('mobile', mobile);
            this.model.set('password', password);
            if (!this.codeOk || !mobile || !password) {
                self.$bind.addClass('disabled');
                self.$bind.prop('disabled', true);
            } else {
                self.$bind.removeClass('disabled');
                self.$bind.prop('disabled', false);
            }
        },
        getCode: function () {
            var mobile = this.$mobile.val();
            if (!/\d{11,}/.test(mobile)) {
                dialog.alert(mobile ? '手机号错误！' : '请输入手机号！');
                return;
            }
            var self = this;
            var setCodeLoading = dialog.newLoading('系统处理中...', true);
            $.ajax({
                url: ctx + '/account/sendCode',
                data: {
                    mobile: mobile
                },
                type: 'POST',
                success: function (jsonResponse) {
                    setCodeLoading.hide();
                    try {
                        Assert.correct(jsonResponse);
                        self.countdown();
                    } catch (e) {
                        dialog.alert(jsonResponse.message);
                    }
                },
                dataType: 'json'
            });
        },
        checkCode: function () {
            var self = this;
            var code = this.$code.val();
            if (code.length < 4) {
                return;
            }
            $.ajax({
                url: ctx + '/account/checkCode',
                type: 'GET',
                data: {
                    clientCode: code
                },
                success: function (jsonResponse) {
                    try {
                        Assert.correct(jsonResponse);
                        self.codeOk = true;
                        self.render();
                    } catch (e) {
                        self.codeOk = false;
                        console.log('error code');
                    }
                },
                error: function () {
                    self.codeOk = false;
                    console.log('error code');
                },
                dataType: 'json'
            });
        },
        countdown: function () {
            var second = 60;
            var self = this;
            this.$getCode.prop('disabled', true);
            var countdownId = setInterval(function () {
                if (second == 0) {
                    self.$getCode.text('获取验证码');
                    clearInterval(countdownId);
                    self.$getCode.prop('disabled', false);
                    return;
                }
                second--;
                self.$getCode.text(second + '秒重新获取');
            }, 1000)
        },
        bind: function () {
            var code = this.$code.val();
            if (!this.model.isValid()) {
                return;
            }
            var bindLoading;
            bindLoading = dialog.newLoading('正在绑定...');
            this.model.save({code: code}, {
                success: function (model, jsonResponse) {
                    bindLoading.destroy();
                    try {
                        Assert.correct(jsonResponse);
                        dialog.alert('绑定成功！', weixin.closeWindow);
                    } catch (e) {
                        dialog.alert(jsonResponse.message);
                    }
                },
                error: function () {
                    dialog.alert('服务器错误!')
                }
            });
        }
    });

    new RegisterView({model: new Merchant()});

});
