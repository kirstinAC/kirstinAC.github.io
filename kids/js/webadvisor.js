// Creates lightbox for links with class "webadvisors"
$(document).ready(function(){

	$("a.webadvisor").fancybox({
		'type'					:	'iframe',
		'transitionIn'			:	'elastic',
		'transitionOut'			:	'elastic',
		'speedIn'				:	600, 
		'speedOut'				:	200, 
		'width'					:	'78%',
		'height'				:	'98%',
		'autoScale'				:	true,
		'overlayColor'			:	'#000', 
		'hideOnOverlayClick'	:	false
	});

});