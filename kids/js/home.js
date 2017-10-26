function specialsHoverOver(){
	$(this).children('a').children('img').stop();
	$(this).children('a').children('img').fadeTo(250, 0.6);
	$(this).children('a').children('h3').addClass('over');
}
function specialsHoverOut(){
	$(this).children('a').children('img').stop();
	$(this).children('a').children('img').fadeTo(250, 1);
	$(this).children('a').children('h3').removeClass('over');
}

$(document).ready(function(){
	// Rollovers for Homepage Specials
	$('#home_specials li').hover(specialsHoverOver, specialsHoverOut);

});