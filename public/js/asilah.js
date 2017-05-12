$(document).ready(function() {
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

function notif(tipe,judul,isi){
	$('#notif').addClass('alert-'+tipe);
	$('#notif .notif-title').html(judul);
	$('#notif .notif-body').html(isi);
	$('#notif').fadeIn();
	setTimeout(function(){$('#notif').fadeOut(function(){$('#notif').removeClass('alert-'+tipe);});},4000);
}

function load_page2(link){
	if (link=='#') {return false;}
	//inisial page adalah dahboard
	$.ajax({
        method: "GET",
        dataType: "html",
        url: link,
        success: function(res){
            $('.content-wrapper2').html(res);
        }
    });
    console.log('ajax');
}

function load_page_menu(link,link_log,area,id_jenis,nip,nama,time) {
	if (link=='#') {return false;}
	//inisial page adalah dahboard
	$.ajax({
        method: "GET",
        dataType: "html",
        url: link,
        success: function(res){
            $('.content-wrapper2').html(res);
        }
    });
    $.get("http://ipinfo.io", function(response) {    	
    	var datas = "link="+link+"&area="+area+"&id_jenis="+id_jenis+"&nip="+ nip+"&nama="+ nama+"&time="+ time+"&ip="+ response.ip;
    	$.ajax({
	        method: "POST",
	        dataType: "json",
	        url: link_log,
	        data: datas,
	        success: function(res){
	            console.log(urel);
	        }
	    });
	}, "jsonp");
}

function load_page(link,storage){
	var use_cache=localStorage.getItem('USE_CACHE');
	var page_content=localStorage.getItem(storage);
	if (link=='#') {return false;}
	if(page_content=='' || page_content==null || use_cache=='false'){
		//inisial page adalah dahboard
		$.ajax({
	        method: "GET",
	        dataType: "html",
	        url: link,
	        beforeSend: function() {
                $(".content-wrapper").css("background-color", 'white');
                $(".load").css("display", 'block');
                $(".content-wrapper2").css("display", 'none');

            },
            complete: function() {
                $(".content-wrapper").css("background-color", '#ecf0f5');
                $(".load").css("display", 'none');
                $(".content-wrapper2").css("display", 'block');
            },
	        success: function(res){
	            $('.content-wrapper2').html(res);
	            localStorage.setItem(storage,res);
	        }
	    });
		console.log('ajax');
	}else{
		console.log('cache');
		$('.content-wrapper2').html(page_content);
	}
	return false;
}

function reload_page2(link){
	if (link=='#') {return false;}
	$.ajax({
        method: "GET",
        dataType: "html",
        url: link,
        success: function(res){
            $('.content-wrapper2').html(res);
        }
    });
    return false;
}

function reload_page(link,storage){
	if (link=='#') {return false;}
	$.ajax({
        method: "GET",
        dataType: "html",
        url: link,
        success: function(res){
            $('.content-wrapper2').html(res);
            localStorage.setItem(storage,res);
        }
    });
    return false;
}


function reload_page_data(link,datas){
	if (link=='#') {return false;}
	$.ajax({
        method: "POST",
        dataType: "html",
        url: link,
        data: datas,
        success: function(res){
            $('.content-wrapper2').html(res);
        }
    });
    return false;
}

//menuju link tertentu tanpa save page
function go_page(link){ 
	if (link=='#') {return false;}
	
	$.ajax({
        method: "GET",
        dataType: "html",
        url: link,
        beforeSend: function() {
                $(".content-wrapper").css("background-color", 'white');
                $(".load").css("display", 'block');
                $(".content-wrapper2").css("display", 'none');

            },
            complete: function() {
                $(".content-wrapper").css("background-color", '#ecf0f5');
                $(".load").css("display", 'none');
                $(".content-wrapper2").css("display", 'block');
            },
        success: function(res){
            $('.content-wrapper2').html(res);
            $('.ui-pnotify-closer').click();
        }
    });
    return false;
}

//menuju link tertentu tanpa save page dengan data ; POST
function go_page_data(link,datas){ 
	if (link=='#') {return false;}
	
	$.ajax({
        method: "POST",
        dataType: "html",
        url: link,
        data: datas,
        beforeSend: function() {
                $(".content-wrapper").css("background-color", 'white');
                $(".load").css("display", 'block');
                $(".content-wrapper2").css("display", 'none');

            },
            complete: function() {
                $(".content-wrapper").css("background-color", '#ecf0f5');
                $(".load").css("display", 'none');
                $(".content-wrapper2").css("display", 'block');
            },
        success: function(res){
            $('.content-wrapper2').html(res);
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
	        	$('.content-wrapper2').html(res);
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