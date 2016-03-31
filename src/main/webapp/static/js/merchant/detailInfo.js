/**
 * jiangyukun on 2015-11-09 19:31
 */

define(function (require) {
	var $ = require('zepto');
    var config = require('config');
    var util = require('util');
    var Assert = require('Assert');
    var weixin = require('weixin');
    var dialog= require('dialog');
    var Backbone = require('backbone');

    function initWx() {
        weixin.ready(function () {
        });
        weixin.error(function (res) {
            util.sendErrorLog(res);
        });
        util.wxConfig(weixin, ['closeWindow', 'scanQRCode']);
    }

    initWx();
    
    var cancelBind=$("#cancelBind");
    function init() {
        function initData() {
        }

        function initEvent() {
        	
        	cancelBind.click(function(){
        		dialog.confirm('确定取消绑定手机？',function(){
        			$.ajax({
         				type: "post",
         				dataType : 'json',
         				data: {
         				},
         				url: "../merchant/delete",
         				success: function(resp){
         					if(resp.code!=0){
         						alert("取消绑定失败！")
         						return;
         					}
         					dialog.alert("取消成功!");
         					weixin.closeWindow();
         				}
         			});
        		})
             
        		
        		
        		
        	});
        }

        initData();
        initEvent();
    }

    init();
 
});
