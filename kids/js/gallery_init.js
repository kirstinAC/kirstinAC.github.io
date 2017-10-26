// Get title from each gallery image and create a new div that enables a rollover effect
$(document).ready(function(){

$("a[rel='gallery']").each(function(n) {
		
		// create new div and use the title as text
		var thetitle = $(this).attr("title");
		$(this).append('<div class="gallery_caption">' + thetitle + '</div>');
		
		// use image width for width of new div
		var theimagewidth = $(this).children("img").width() - 10; // minus padding
		$(this).children("div").css("width", theimagewidth + "px");
		
		
		
		// Define hover function for image
		$(this).hover(
			function(){
				$(this).children("div").addClass("hover");
				$(this).children("img").css("opacity",.8); // set opacity for image
			},
			function(){
				$(this).children("div").removeClass("hover");
				$(this).children("img").css("opacity", 1); // restore opacity for image
			}
		);

	});
});


// Setup FancyBox
$(document).ready(function(){
	$("#rjcarousel_wrapper a").fancybox({
		'padding' : '0',
		'titlePosition'	: 'inside',
		'overlayOpacity' : 0.7,
		'overlayColor' : '#000'
	});

});
