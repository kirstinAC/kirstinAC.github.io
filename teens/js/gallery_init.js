$(document).ready(function(){

	// Get title from each gallery image and create a new div that enables a rollover effect
	
	$("a[rel='gallery']").each(function(n) {
		
		// create new div and use the title as text
		var thetitle = $(this).attr("title");
		$(this).append('<div class="gallery_caption">' + thetitle + '</div>');
		
		// use image width for width of new div
		var theimagewidth = $(this).children("img").width() - 10; // minus padding
		$(this).children("div").css("width", theimagewidth + "px");
		
		// set opacity
		$(this).children("div").css("opacity",.8);
		
		
		// Define hover function for image
		$(this).hover(
			function(){
				$(this).children("div").addClass("hover");
			},
			function(){
				$(this).children("div").removeClass("hover");
			}
		);

	});
});

