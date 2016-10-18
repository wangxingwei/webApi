// JavaScript Document
$(function(){

	//完整菜单效果1
		$(".menu_list").hide();
		$(".menu_list_first").show();
		$(".a_list").click(function(){
			var len = $('.a_list').length;
			var index = $(".a_list").index(this);
			for(var i=0;i<len;i++){
				if(i == index){
					$('.menu_list').eq(i).slideToggle(300);
					}else{
						$('.menu_list').eq(i).slideUp(300);
					}
				}
			});
		//完整菜单效果2
		/*$(".a_list").each(function(l){
			$(this).click(function(){
				var len = $('.a_list').length;
				for(var i=0;i<len;i++){
					if(i == l){
						$('.menu_list').eq(i).slideToggle(100);
					}else
					{
						$('.menu_list').eq(i).slideUp(100);
					}
				}
			})	
		})*/
	})
	
	//点击显示隐藏完成菜单和简洁菜单
	$(function(){
		$(".menu-oc").click(function(){
			$(".leftmenu1").animate({left:"-292px"})	;
			$(".leftmenu2").animate({left:"0px"})
			$(".rightcon").css("margin-left","52px")
		})
		$(".menu-oc1").click(function(){
			$(".leftmenu1").animate({left:"0px"})	;
			$(".leftmenu2").animate({left:"-192px"});
			$(".rightcon").css("margin-left","240px");
		})		
	})
	
	//简洁菜单点击效果
	/*
	$(function(){
		$(".j_menu_list").hide();
		$(".j_a_list").click(function(){
			var len = $('.j_a_list').length;
			var index = $(".j_a_list").index(this);
			for(var i=0;i<len;i++){
				if(i == index){
					$('.j_menu_list').eq(i).slideToggle(300);
					}else{
						$('.j_menu_list').eq(i).slideUp(300);
					}
				}
		});
		$(".j_menu_list>span>i").click(function(){
			$(".j_menu_list").slideUp(300)	
		})
	})*/
	//简洁菜单移动效果
	$(function(){
		$(".j_menu_list").hide();
		$(".j_a_list").hover(function(){
			$(".leftmenu2 ul li").hover(function(){
				$(this).find('.j_menu_list').show();	
			},function(){
				$(this).find('.j_menu_list').hide();
			});
		})
	})
function showLocale(objD)
{
	var str,colorhead,colorfoot;
	var yy = objD.getYear();
	if(yy<1900) yy = yy+1900;
	var MM = objD.getMonth()+1;
	if(MM<10) MM = '0' + MM;
	var dd = objD.getDate();
	if(dd<10) dd = '0' + dd;
	var hh = objD.getHours();
	if(hh<10) hh = '0' + hh;
	var mm = objD.getMinutes();
	if(mm<10) mm = '0' + mm;
	var ss = objD.getSeconds();
	if(ss<10) ss = '0' + ss;
	var ww = objD.getDay();
	if ( ww==0 ) colorhead="<font color=\"#FFFFFF\">";
	if ( ww > 0 && ww < 6 ) colorhead="<font color=\"#FFFFFF\">";
	if ( ww==6 ) colorhead="<font color=\"#FFFFFF\">";
	if (ww==0) ww="星期日";
	if (ww==1) ww="星期一";
	if (ww==2) ww="星期二";
	if (ww==3) ww="星期三";
	if (ww==4) ww="星期四";
	if (ww==5) ww="星期五";
	if (ww==6) ww="星期六";
	colorfoot="</font>"
	str = colorhead + yy + "年" + MM + "月" + dd + "日" + hh + ":" + mm + ":" + ss + " " + ww + colorfoot;
	return(str);
}