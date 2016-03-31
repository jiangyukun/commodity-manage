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
    
    var province=$("#province");
    var city=$("#city");
    var confirm=$("#confirm");
    var close=$("#close");
    var update=$("#update");
    var deleteposition=$("#delete");
    function init() {
        function initData() {
        }

        function initEvent() {
        	province.blur(function(){
            	var provinceid =$("#province").val(); 
            	$.ajax({
    				type: "post",
    				dataType : 'json',
    				data: {
    					provinceid: provinceid
    				},
    				url: "../position/city",
    				success: function(resp){
    					if(resp.code!=1){
    						refresh(0);
    						return;
    					}
    					$("#city").empty();
    					$("#town").empty();
    					$("#city").append("<option value='0'>请选择城市</option>");
    					$("#town").append("<option value='0'>请选择区县</option>");
    					for(var i=0;i<resp.data.length;i++){
    						$("#city").append("<option value='"+resp.data[i].id+"'>"+resp.data[i].name+"</option>");
    					}
    				}
    			});
            });
            city.blur(function(){
            	var cityid =$("#city").val(); 
            	$.ajax({
    				type: "post",
    				dataType : 'json',
    				data: {
    					cityid: cityid
    				},
    				url: "../position/town",
    				success: function(resp){
    					if(resp.code!=1){
    						refresh(0);
    						return;
    					}
    					$("#town").empty();
    					$("#town").append("<option value='0'>请选择区县</option>");
    					for(var i=0;i<resp.data.length;i++){
    						$("#town").append("<option value='"+resp.data[i].id+"'>"+resp.data[i].name+"</option>");
    					}
    				}
    			});
            });
            confirm.click(function() {
            	var pid=$("#province").val();
            	var cid=$("#city").val();
            	var tid=$("#town").val();
            	var addr=$("#addr").val();
            	if(addr=="请输入小区、楼宇或者街道名称"){
            		addr="";
            	}
            	if(pid==0||cid==0||tid==0||addr==""){
            		dialog.alert("信息输入有误！");
            		return;
            	}
            	$.ajax({
                	type: "post",
    				dataType : 'json',
                    url: '../position/insert',
                    data: {
                    	pid:pid,
                    	cid:cid,
                    	tid:tid,
                    	addr:addr
                    },
                    success: function (resp) {
                    	if(resp.code!=1){
                    		dialog.alert("系统错误，请重新提交！");
    						return;
    					}
                    	dialog.alert("增加成功！", function () {
                    		window.location.href="manage";
                        });
                    	window.location.href="manage";
                    }
                });
            });  
            close.click(function () {
            	window.location.href="manage";
            });
            deleteposition.click(function() {
            	dialog.confirm('确定删除？',function(){
            		
            	var id=$("#positionid").val();
            	$.ajax({
    				type: "post",
    				dataType : 'json',
    				data: {
    					id: id
    				},
    				url: "../position/delete",
    				success: function(resp){
    					if(resp.code!=1) {
    						dialog.alert("系统错误，请重新提交！");
    					}
    					window.location.href="manage";
    				}
    			});
            	});
            });
            update.click(function() {
            	var id=$("#positionid").val();
            	var pid=$("#province").val();
            	var cid=$("#city").val();
            	var tid=$("#town").val();
            	var addr=$("#addr").val();
            	if(pid==0||cid==0||tid==0||addr==""){
            		dialog.alert("信息输入有误！");
            		return;
            	}
            	$.ajax({
                	type: "post",
    				dataType : 'json',
                    url: '../position/update',
                    data: {
                    	id:id,
                    	pid:pid,
                    	cid:cid,
                    	tid:tid,
                    	addr:addr
                    },
                    success: function (resp) {
                    	if(resp.code!=1){
                    		dialog.alert("系统错误，请重新提交！");
    						return;
    					}
                    	dialog.alert("修改成功！", function () {
                    		window.location.href="manage";
                        });
                    	
                    }
                });
            });  
        }
        
        initData();
        initEvent();
    }

    init();
});
