/**
 * jiangyukun on 2015-12-16 16:44.
 */
define(function (require) {
    var util = require('util');
    var $ = require('zepto');

    var $navBarList = $('.navBar');

    var nav = util.navBar($navBarList);

    nav();
    $(document).on('scroll', function () {
        nav();
    });
});