$(document).ready(function() {
	
	$('.historyAPI').on('click', function(e){
        e.preventDefault();
        var href = $(this).attr('href');
         
        // Getting Content
        // getContent(href, true);
         
        $('.historyAPI').removeClass('active');
        $(this).addClass('active');
    });

	$.ajax({
	    method: "GET",
	    dataType: "html",
	    url: 'index/menu/json',
	    success: function(menu){
	    	//menu dinamis ambil dari controller
	    	// eval(menu); 
	    	//load_page('pendaftaran','page_pendaftaran');
	    }
	}); 
	//jika pakai cache ganti true
	localStorage.setItem('USE_CACHE','false');
});


window.addEventListener("popstate", function(e) {
	var base = localStorage.getItem('base_url');
	var host = 'http://'+window.location.hostname+location.pathname;
	var link = host.replace(base, '');
    go_page(link);
});

function notif(tipe,judul,isi){
	$('#notif').addClass('alert-'+tipe);
	$('#notif .notif-title').html(judul);
	$('#notif .notif-body').html(isi);
	$('#notif').fadeIn();
	setTimeout(function(){$('#notif').fadeOut(function(){$('#notif').removeClass('alert-'+tipe);});},4000);
}

function load_page(link,storage){
	var use_cache=localStorage.getItem('USE_CACHE');
	var page_content=localStorage.getItem(storage);
	if (link=='#') {return false;}
	var link = localStorage.getItem('base_url')+link;
	if(page_content=='' || page_content==null || use_cache=='false'){
		//inisial page adalah dahboard
		$.ajax({
	        method: "GET",
	        dataType: "html",
	        url: link,
	        success: function(res){
	            history.pushState(null, null, link); 
	            $('.content-wrapper').html(res);
	            localStorage.setItem(storage,res);
	        }
	    });
		console.log('ajax');
	}else{
		console.log('cache');
		$('.content-wrapper').html(page_content);
	}
	return false;
}

function reload_page(link,storage){
	var link = localStorage.getItem('base_url')+link;
	if (link=='#') {return false;}
	$.ajax({
        method: "GET",
        dataType: "html",
        url: link,
        success: function(res){
            history.pushState(null, null, link); 
            $('.content-wrapper').html(res);
            localStorage.setItem(storage,res);
        }
    });
    return false;
}

//menuju link tertentu tanpa save page
function go_page(link){ 
	var link = localStorage.getItem('base_url')+link;
	if (link=='#') {return false;}
	//notif('warning','Loading','<i class="fa fa-refresh fa-spin"></i> please wait..');
	
	$.ajax({
        method: "GET",
        dataType: "html",
        url: link,
        success: function(res){
            history.pushState(null, null, link); 
            $('.content-wrapper').html(res);
            $('.ui-pnotify-closer').click();
        }
    });
    return false;
}

//load page dan update cache
function update_page_cache(link,storage){
		if (link=='#') {return false;}
		if (localStorage.getItem('USE_CACHE')=='true') {
			localStorage.setItem(storage,'');
		}
		$.ajax({
	        method: "GET",
	        dataType: "html",
	        url: link,
	        success: function(res){
	        	$('.content-wrapper').html(res);
				if (localStorage.getItem('USE_CACHE')=='true') {
	            	localStorage.setItem(storage,res);
				}	
	        }
	    });
	    return false;
}

function update_cache(link,storage){
	if (localStorage.getItem('USE_CACHE')=='true') {
		if (link=='#') {return false;}
		localStorage.setItem(storage,'');
		$.ajax({
	        method: "GET",
	        dataType: "html",
	        url: link,
	        success: function(res){
	            localStorage.setItem(storage,res);
	        }
	    });
	    return false;
	}	
}