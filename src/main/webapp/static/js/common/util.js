define(function (require, exports) {
    var config = require('config');
    var Assert = require('Assert');
    var $ = require('zepto');
    var IScroll = require('IScroll');

    var wxInited = false;

    var getCtx = exports.getCtx = function () {
        return ctx || config.ctx || '';
    };

    exports.url = function (url) {
        return this.getCtx() + url;
    };

    exports.tip = function (message) {
        alert(message);
    };
    exports.sendErrorLog = function (obj) {
        $.ajax({
            url: getCtx() + '/debug/log',
            type: 'post',
            data: {
                content: JSON.stringify(obj)
            },
            success: function () {
                alert('error msg send to server');
            }
        });
    };

    exports.wxConfig = function (weixin, jsApiList, callback) {
        $.ajax({
            url: getCtx() + '/weixin/jssdk',
            type: 'post',
            data: {
                url: location.href
            },
            success: function (jsonResponse) {
                Assert.correct(jsonResponse);
                var jsSdkConfigDto = jsonResponse.data;
                weixin.config({
                    debug: false,
                    appId: jsSdkConfigDto.appId,
                    timestamp: jsSdkConfigDto.timestamp,
                    nonceStr: jsSdkConfigDto.nonceStr,
                    signature: jsSdkConfigDto.signature,
                    jsApiList: jsApiList
                });
                weixin.ready(function () {
                    callback();
                });
            },
            dataType: 'json'
        });
    };
    exports.initWx = function (weixin, jsApiList, callback) {
        var self = this;
        if (config.phase === 'dev') {
            return;
        }
        if (wxInited) {
            console.log('weixin inited!');
            return;
        }
        wxInited = true;
        weixin.error(function (res) {
            self.sendErrorLog(res);
        });
        try {
            this.wxConfig(weixin, jsApiList, callback);
        } catch (e) {
            this.sendErrorLog(e);
        }
    };
    exports.smoothScroll = function ($wrapper) {
        return new IScroll($wrapper[0]);
    };
    var $body = $('body');
    exports.pageTitle = function (title) {
        document.title = title;
        if (config.phase != 'dev') {
            var $iframe = $('<iframe src="/favicon.ico" style="display: none;"></iframe>').on('load', function () {
                try {
                    setTimeout(function () {
                        $iframe.off('load').remove()
                    }, 0)
                } catch (e) {
                    //ignore
                }
            }).appendTo($body);
        }
    };

    exports.heightToTop = function (ele) {
        var $ele = $(ele);
        var height2Top, parent;
        height2Top = $ele.offset().top - $ele.scrollTop() - $(window).scrollTop();
        parent = $ele.offsetParent();
        while (parent[0] != $body[0]) {
            height2Top = height2Top - parent.scrollTop();
            parent = parent.offsetParent();
        }
        return height2Top;
    };
    exports.positionTop = function (ele) {
        return $(ele).position().top;
    };
    exports.heightToContainer = function (ele) {
        return this.positionTop(ele) + this.positionTop($(ele).offsetParent());
    };
    exports.cloneDom = function clone($element, n) {
        var clone = $('_clone_' + n);
        if (clone.length > 0) {
            return clone;
        }
        return $element.clone().attr("id", '_clone_' + n).css("*", $element.css("*")).css("position", "absolute").css("width", "100%");
    };
    exports.navBar = function ($list) {
        var $elements = $list, navBarHeight = $elements.height(), self = this;
        var topNavBar = $('<div>').addClass('top-nav-bar');

        if ($list.parent().find('.top-nav-bar').length == 0) {
            $list.parent().append(topNavBar[0]);
        }
        topNavBar.css("height", navBarHeight + "px").css("width", "100%");

        return function () {
            var i, j, $show, $next, $ele, h, $clone1, $clone2, distance, elementHeight, $children, nextToDivider;
            for (i = 0; i < $elements.length; i++) {
                $ele = $elements.eq(i);
                h = self.heightToTop($ele);
                if (h < 0) {
                    $show = $ele;
                    elementHeight = $ele.height();
                    j = i + 1;
                    distance = h;
                } else {
                    break;
                }
            }
            if (j < $elements.length) {
                $next = $($elements[j]);
            }
            $children = topNavBar.children();
            if ($show) {
                $clone1 = self.cloneDom($show, 1);
                topNavBar.append($clone1);
                if ($next) {
                    $children.remove();
                    nextToDivider = self.heightToTop($next);
                    if (nextToDivider < navBarHeight) {
                        $clone1.css("margin-top", nextToDivider - navBarHeight);
                        $clone2 = self.cloneDom($next, 2);
                        topNavBar.append($clone2);
                        $clone2.css("margin-top", nextToDivider);
                    } else {
                        $clone1.css("margin-top", "0");
                    }
                }
            } else {
                $children.remove();
            }
        };
    };
})
;
