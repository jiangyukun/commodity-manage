/**
 * jiangyukun on 15/11/18.
 */
define(function (require) {
    var $ = require('zepto');
    var util = require('util');
    var constants = require('constants');
    var dialog = require('dialog');
    var stateManager = require('stateManager');

    var webApp = require('webApp');
    var weixin = require('weixin');
    var AddCommodityView = require('AddCommodityView');

    util.initWx(weixin, ['scanQRCode']);
    webApp.init();

    var EditCommodityView = AddCommodityView.extend({
        initialize: function () {
            _super.initialize.apply(this, arguments);
            this.listenTo(this.model, 'sync', this.render);
        },
        render: function () {
            if (this.model.get('imgId')) {
                var $img = $('<img>').attr('src', this.model.get('imgUrl'));
                this.$pictureContainer.append($img[0]);
            }
            this.$commodityName.val(this.model.get('name'));
            this.$commodityCategory.text(this.model.get('categoryName')).css({color: 'black'});
            this.$specification.val(this.model.get('specification'));
            this.$price.val(this.model.get('price'));
            this.$recommendCheckbox.prop('checked', this.model.get('recommend') == constants.recommend_yes);
            return this;
        },
        back: function () {
            dialog.confirm('确定放弃更新商品吗?', function () {
                history.back();
            });
        },
        doSave: function () {
            this.model.save(null, {
                success: function () {
                    dialog.alert('商品更新成功!', function () {
                        stateManager.setFreshState(true);
                        history.back();
                    });
                }
            });
        }
    });
    var _super = EditCommodityView.__super__;
    return EditCommodityView;
});
