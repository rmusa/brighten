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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

// $(function() {
//   // hook up the pagination links to refresh projects
//   $('.pagination a').click(function() {
//     $.get(
//       this.href,
//       null,
//       function(data) {
//         $('#comment_list').html(data);
//       },
//       'html'
//     );
//     return false;
//   });
// });

$(function() {
	$(".hover-text").hide();
});

var toggled = false;
$(function() {
	$("#brighten").click(
	  function() {
  		if (toggled) {
				$(this).animate( {'margin-top' : '+=130px'} );
				$('#first-sentence').fadeIn();
				$('#second-sentence').fadeIn();
				$(".hover-text").fadeOut();
				toggled = false;
			} else {
				$(this).animate( {'margin-top' : '-=130px'} );
				$('#first-sentence').fadeOut();
				$('#second-sentence').fadeOut();
				$(".hover-text").fadeIn();
				toggled = true;
			}
	});
});


