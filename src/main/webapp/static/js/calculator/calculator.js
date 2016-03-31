/**
 * jiangyukun on 2015-11-09 19:31
 */

define(function (require) {
	var $ = require('zepto');
   
    
    
    var num=$(".num")
    var deletenum=$(".delete");
    var clearnum=$(".clear");
    function init() {
        function initData() {
        }

        function initEvent() {
        	num.tap(function(){
        		selected=$(this);
        		selected.addClass("number");
        		var number=selected.text();
        		number=$(".payMoney").text()+number;
        		if((/^(([1-9]\d{0,5})|0)(\.\d{1,2})?$/.test(number))||(/^(([1-9]\d{0,5})|0)(\.)?$/.test(number))){
        			$(".payMoney").html(number);
        			$(".clear").show();
        			$(".pay").css("background-color","#00CD00");
        		}
        		setTimeout(function() { 
        			selected.removeClass("number");
        			}, 100); 
        		
        	});
        	deletenum.tap(function(){
        		var amount=$(".payMoney").text();
        		if(amount == ""){
        			return;
        		}
        		amount=amount.substring(0,amount.length-1);
        		$(".payMoney").html(amount);
        		if(amount == ""){
        			$(".clear").hide();
        			$(".pay").css("background-color","#bfbfbf");
        		}
        	});
        	clearnum.tap(function(){
        		$(".payMoney").html("");
        		$(".clear").hide();
    			$(".pay").css("background-color","#bfbfbf");
        	})
        }

        initData();
        initEvent();
    }

    init();
 
});
