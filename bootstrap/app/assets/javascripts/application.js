// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$('#like_link').click(function(){
		var post_id = $(this).attr('title')
		var like_or_unlike =  $(this).text();
		var key = 0;
		if(like_or_unlike == 'Like') {
           key = 1	          
		}
		$.ajax({
		    type: 'get',
			url: '/likes/index',
			data:{id :post_id, key :key},
			success: function(data){
				 if(key) {
				 	$('#like_link').html('Unlike');
				 }else {
				 	$('#like_link').html('Like');
				 }

				 $('#like_id').html(data);
				
			}
		})
	})
})