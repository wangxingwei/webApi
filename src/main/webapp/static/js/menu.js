$(document).ready(function(){
    //点击显示隐藏完成菜单和简洁菜单
    $(".menu-oc").click(function(){
            $(".nav-menu").animate({left:"-292px"})	;
            $(".leftmenu2").animate({left:"0px"})
            $(".rightcon").css("margin-left","52px")
   })
    $(".menu-oc1").click(function(){
            $(".nav-menu").animate({left:"0px"})	;
            $(".leftmenu2").animate({left:"-192px"});
            $(".rightcon").css("margin-left","220px");
   })
    $("#dropdownMenu").hover(function(){
        $(".dropdown-menu").show();
    },function(){
        $(".dropdown-menu").hide();
    });
    $(".nav-menu a").attr("target","frmright");
    var liList=$(".nav-menu ul li");
    for(var i=0;i<liList.length;i++){
        if($(liList[i]).find("ul").length>0){
            $(liList[i]).find("a:first").before("<span class='arrow glyphicon glyphicon-menu-right' aria-hidden='true'></span>");
        }
    }
    //点击菜单事件
    $(".nav-menu ul li").click(function(e){
        e.stopPropagation();
        if($(this).find(".arrow:first").length>0){
            if($(this).find(".arrow:first").attr("class").indexOf("glyphicon-menu-right")!=-1){
                $(this).find(".arrow:first").removeClass("glyphicon-menu-right").addClass("glyphicon-menu-down");
            }else{
                $(this).find(".arrow:first").removeClass("glyphicon-menu-down").addClass("glyphicon-menu-right");
            }
        }

        $(this).find("ul:first").slideToggle(300);
    });

});