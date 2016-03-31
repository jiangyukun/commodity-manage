/**
 * Created by jiangyuk on 2015/12/2.
 */
define(function (require) {
    var util = require('util');
    var Backbone = require('backbone');

    return Backbone.Model.extend({
        urlRoot: util.url('/category'),
        defaults: {
            title: '',
            name: '',
            weight: 0,
            commodityCount: 0
        }
    });
});
