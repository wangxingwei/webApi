(function($){
	$.fn.menu=function (params){
		$menu=$(this);
		
		var html="";
		$menu.showMenu=function(){
			$.each(params,function(i,item){
				//获得一级菜单
					html+="<ul>";
					html+=_createMenu(item);//创建菜单
					
					html+="</ul>";							
			});
			$menu.append(html);
			//点击菜单事件
			$(".side_menu").click(function(e){
				e.stopPropagation();
				var id=$(this).attr("id");
				if($('#'+id).find(".arrow:first").attr("class").indexOf("glyphicon-menu-right")!=-1){
					$('#'+id).find(".arrow:first").removeClass("glyphicon-menu-right").addClass("glyphicon-menu-down");

				}else{
					$('#'+id).find(".arrow:first").removeClass("glyphicon-menu-down").addClass("glyphicon-menu-right");
				}
				
				$('#'+id).find("ul:first").slideToggle(300);
			});
		}			
		//递归获得子菜单
		_getChildrenMenu=function(childrens){
			var listMenu=new Array();
			var html="<ul>";
			for(var i=0;i<childrens.length;i++){
				item=childrens[i];
				html+=_createMenu(item);//创建菜单
				
			}
			html+="</ul>";
			return html;
		}
		//创建菜单
		_createMenu=function(item){
				var html="<li";
				if(item.children.length>0){
						html+=" class='side_menu'";
				}
				html+=" id='li_"+item.id+"'>";
				if(item.children.length>0){//如果有子菜单
						html+="<a href='#'>"+item.name+"<span class='arrow glyphicon glyphicon-menu-right' aria-hidden='true'></span></a>";
						var childrenMenu=_getChildrenMenu(item.children);
						html+=childrenMenu;
				}else{
						html+="<a href='"+item.url+"'>"+item.name+"</a>";
				}
				html+="</li>";
				return html;

		}
		
		
		return $menu;
	}

})(jQuery)