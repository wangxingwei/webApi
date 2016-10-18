
    function showPages(pageCount,pageNo){//分页
        $("#pagination").paginate({
            count 		: pageCount,
            start 		: pageNo,
            display     : 10,
            border					: true,
            border_color			: '#BEF8B8',
            text_color  			: '#68BA64',
            background_color    	: '#E3F2E1',
            border_hover_color		: '#68BA64',
            text_hover_color  		: 'black',
            background_hover_color	: '#CAE6C6',
            rotate      : false,
            images		: false,
            mouse		: 'press',
            onChange     			: function(page){
                $('._current','#paginationdemo').removeClass('_current').hide();
                $('#p'+page).addClass('_current').show();
                showData(page);
            }
        });
    }
    //滚动的分页
    function showScrollPages(pageCount,pageNo){
        $("#pagination").paginate({
            count 		: pageCount,
            start 		: pageNo,
            display     : 10,
            border					: true,
            border_color:'#FFF',
            text_color  			: '#099ACF',
            background_color    	: '#FFF',
            text_hover_color  		: '#FFF',
            background_hover_color	: '#099ACF',
            border_hover_color		: '#ccc',
            images					: false,
            rotate     				 : true,
            mouse					: 'press',
            onChange     			: function(page){
                $('._current','#paginationdemo').removeClass('_current').hide();
                $('#p'+page).addClass('_current').show();
                showData(page);
            }
        });
    }





