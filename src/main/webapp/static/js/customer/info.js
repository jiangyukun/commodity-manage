/**
 * jiangyukun on 2015-11-09 19:31
 */

define(function (require) {
	var $ = require('zepto');
    var config = require('config');
    var util = require('util');
    var Assert = require('Assert');
    var dialog= require('dialog');
    var Backbone = require('backbone');
    
    
    var closeOrder=$("#close");
    var sendOrder=$("#sendOrder");
    var overOrder=$("#overOrder");
    function init() {
        function initData() {
        }

        function initEvent() {
        	
        	sendOrder.click(function(){
        		dialog.confirm('确认发货吗？',function(){
        		var id=$("#oid").val();
        		$.ajax({
     				type: "post",
     				dataType : 'json',
     				data: {
     					id:id ,
     					state:1
     				},
     				url: "../customer/update",
     				success: function(resp){
     					if(resp.code!=1){
     						refresh(0);
     						return;
     					}
     					dialog.alert("订单"+id+"开始派送！", function () {
     						location.reload()
                        });
     				}
        		});
     			});
        		
        		
        	});
        	overOrder.click(function(){
        		dialog.confirm('确定订单完成(已送达)吗？',function(){
        		var id=$("#oid").val();
        		$.ajax({
     				type: "post",
     				dataType : 'json',
     				data: {
     					id:id ,
     					state:2
     				},
     				url: "../customer/update",
     				success: function(resp){
     					if(resp.code!=1){
     						refresh(0);
     						return;
     					}
     					dialog.alert("订单"+id+"已完成！", function () {
     						location.reload()
                        });
     				}
        		});
     			});
        		
        		
        	});
        	closeOrder.click(function(){
        		dialog.confirm('确定关闭订单吗？',function(){
        		var id=$("#oid").val();
        		$.ajax({
     				type: "post",
     				dataType : 'json',
     				data: {
     					id:id ,
     					state:3
     				},
     				url: "../customer/update",
     				success: function(resp){
     					if(resp.code!=1){
     						refresh(0);
     						return;
     					}
     					dialog.alert("订单"+id+"关闭！", function () {
     						location.reload()
                        });
     					
     				}
     			});
        		
        		});
        	});
        }

        initData();
        initEvent();
    }

    init();
 
});
