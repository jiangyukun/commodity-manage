/**
 * jiangyukun on 2015/12/1.
 */
define(function (require) {
    var $ = require('zepto');
    var AlertModel = require('AlertModel');
    var Alert = require('Alert');
    var ConfirmModel = require('ConfirmModel');
    var Confirm = require('Confirm');
    var LoadingModel = require('LoadingModel');
    var Loading = require('Loading');
    var webApp = require('webApp');

    var loading;
    return {
        alert: function (message, callback) {
            var model = new AlertModel({message: message || ''});
            var alert = new Alert({model: model});
            webApp.refreshFontSize(alert.$el);
            if (typeof callback === 'function') {
                alert.on('confirm', callback);
            }
            alert.show();
            return alert;
        },
        confirm: function (option, confirmCallback, cancelCallback) {
            var title, content, cancel, confirm;
            if (typeof option == 'string') {
                content = option;
                title = cancel = confirm = null;
            } else {
                confirmCallback = option.confirmCallback || _.noop;
                cancelCallback = option.cancelCallback || _.noop;
            }
            var model = new ConfirmModel({
                title: title || '提示',
                content: content || '',
                cancel: cancel || '取消',
                confirm: confirm || '确定'
            });
            var confirmView = new Confirm({model: model});
            if (typeof confirmCallback === 'function') {
                confirmView.on('confirm', confirmCallback);
            }
            if (typeof cancelCallback === 'function') {
                confirmView.on('cancel', cancelCallback);
            }
            //confirmView.show();
            $('body').append(confirmView.render().el);
            webApp.refreshFontSize(confirmView.$el);
            return confirmView;
        },
        loading: function (showOrHide) {
            if (!loading) {
                loading = new Loading();
                webApp.refreshFontSize(loading.$el);
            }
            if (showOrHide != false) {
                loading.show();
            } else {
                loading.hide();
            }
            return loading;
        },
        newLoading: function (message) {
            var loadingModel = new LoadingModel({message: message || ''});
            var loading = new Loading({model: loadingModel});
            webApp.refreshFontSize(loading.$el);
            loading.show();
            return loading;
        }
    };
});