/**
 * jiangyukun on 2015/11/30
 */
define(function (require) {
    var $ = require('zepto');
    var fastclick = require('fastclick');

    var $body = $('body'), dpr = devicePixelRatio;
    return {
        // 处理zepto tap事件的点击穿透bug
        init: function () {
            this.adapter();
            $(function () {
                fastclick.attach(document.body);
            });
        },
        adapter: function () {
            var i;
            var metas = document.getElementsByTagName('meta');
            for (i = 0; i < metas.length; i++) {
                var meta = metas[i];
                if (meta.name == 'viewport') {
                    var scale = 1 / dpr;
                    meta.content = 'width=device-width, initial-scale=' + scale + ', maximum-scale=' + scale + ', user-scalable=' + scale;
                }
            }

            $('html').attr('data-dpr', dpr);
            $body.attr('data-dpr', dpr);
            var html = document.getElementsByTagName('html')[0];
            var body = document.getElementsByTagName('body')[0];
            html.style.fontSize = 12 * dpr + 'px';
            body.style.fontSize = 12 * dpr + 'px';

            this.refreshFontSize($body);
        },
        refreshFontSize: function ($container) {
            var i;
            for (i = 12; i < 30; i++) {
                $container.find('.font' + i + 'px').css({
                    'font-size': i * dpr + 'px'
                });
            }
        }
    };
});
