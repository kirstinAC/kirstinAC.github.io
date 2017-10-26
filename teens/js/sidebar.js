$(document).ready(function(){


	// Image replacement for Saturday High logo
	$("img.logo_artcenter_for_teens").hover(
	  function () {
		$(this).attr("src", "images/logo_artcenter_for_teens_hover.png");
	  }, 
	  function () {
		$(this).attr("src", "images/logo_artcenter_for_teens.png");
	  }
	);

	// Credits Lightbox
	$("a#credits_link").colorbox({
		title:false,
		width:"600px",
		height:"360px",
		opacity:.7,
		iframe:true,
		returnFocus:false
	});


});













// The resizeing of the sidebar via javascript is unneccessary now with a redesigned sidebar that is shorter.
// The sidebar is now positioned fixed and does not scroll and can be extend to fit 100% of window height via CSS

/*
function resizeSidebar() {
	// resize Sidebar to fill 100% height of window
	$('#sidebar').css('height','') // Remove height to get accurate count of document height
	document_height = $(document).height();
	$('#sidebar').css('height',document_height-20-40) // minus padding on bottom and #language
}

$(document).ready(function(){

	resizeSidebar(); // ON LOAD: resize Sidebar to fill 100% height 

	// ON WINDOW RESIZE:
	$(window).resize(function () { 
		// resize Sidebar to fill 100% height if browser window is resized
		var resizeTimer;
		$(window).resize(function() {
			clearTimeout(resizeTimer);
			resizeTimer = setTimeout(resizeSidebar, 50); // Do something after a slight delay for the sake of UI responsiveness 
		});
	});

});
*/