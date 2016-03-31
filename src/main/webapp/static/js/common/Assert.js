/**
 * jiangyukun on 15/11/22.
 */
define(function (require) {
    var constants = require('constants');

    function Assert() {

    }

    Assert.correct = function (jsonResponse) {
        if (jsonResponse.code != constants.success_code) {
            throw new Error('jsonResponse error code');
        }
    };
    return Assert;
});