/**
 * jiangyukun on 2015-11-09 19:31
 */

define(function(require) {
	var $ = require('zepto');
    var config = require('config');
    var util = require('util');
    var Assert = require('Assert');
    var dialog= require('dialog');
    var Backbone = require('backbone');

	var orderlist = $(".table");
	var addmore = $("#adddiv");
	function init() {
		function initData() {
		}

		function initEvent() {
			

			orderlist.find('#changestate').click(function() {
				var order = $(this);
				var id = $(this).attr('dataid');
				var oldstate=$("#orderState").val();
				if(oldstate >= 2) return;
				var state=parseInt($("#orderState").val())+parseInt(1);
				dialog.confirm('确认修改此订单状态吗？',function(){
					$.ajax({
					type : "post",
					dataType : 'json',
					data : {
						id : id,
						state : state
					},
					url : "../customer/update",
					success : function(resp) {
						if (resp.code != 1) {
							refresh(0);
							return;
						}
						dialog.alert("订单" + id + "修改成功", function () {
     						location.reload()
                        });
					}
				});
				});
			});
			addmore.click(function() {
				var limit = $("#limit").val();
				limit=parseInt(limit)+parseInt(20);
				var orderState = $("#orderState").val();
				$.ajax({
							type : "post",
							dataType : 'json',
							data : {
								limit : limit,
								state : orderState
							},
							url : "../customer/addmore",
							success : function(resp) {
								if (resp.code != 1) {
									refresh(0);
									return;
								}
								if(resp.data==null) {
									$("#adddiv").hide();
									return;
								}
								if (resp.data.length < 20)
									$("#adddiv").hide();
								var list = "";
								for (var i = 0; i < resp.data.length; i++) {
									list = list+"<tr role='row' class='even orderitem' ><td><div class='item'>";
									if(resp.data[i].state<2){
										list = list+"<img class='changestate' id='changestate' alt='' dataid="+resp.data[i].id+" src='"+ctx+"/static/images/order/state-"+ resp.data[i].state+ ".png'/>";
									}else{
										list = list+"<img class='nochangestate' id='changestate' alt='' dataid="+resp.data[i].id+" src='"+ctx+"/static/images/order/icon-"+ resp.data[i].state+ ".png'/>";
									}
									list = list + "<ul class='itemcontent'>";
									list = list + "<li style='color: black;'>订单号："+ resp.data[i].id+"</li>";
									list = list + " <li style='color: black;'>配送地址：";
									if (resp.data[i].newAddr != null){
										list = list+ resp.data[i].newAddr;
									}else{
										list = list + resp.data[i].addr;
									}
									list = list+"</li><li style='color: #bfbfbf;'>"+resp.data[i].createdDate+" </li> </ul></div>"
												+ "<div class='left'>"
												+ "<a href='info?id="+resp.data[i].id+"'><img class='image' alt='' src='"+ctx+"/static/images/order/icon-join.png'></a>"
												+"</div></td></tr>"
								}
								$("#adddiv").before(list);
								$("#limit").val(limit);
							}

						});
			});
		}

		initData();
		initEvent();
	}

	init();

});
