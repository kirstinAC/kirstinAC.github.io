// Creates lightbox for links with class "webadvisors"
var options = {
		title:false,
		width:"784",
		height:"801",
		opacity:.7,
		iframe:true,
		returnFocus:false,
		overlayClose:false
	};
$(document).ready(function(){
	$("a.webadvisor").colorbox(options);
});