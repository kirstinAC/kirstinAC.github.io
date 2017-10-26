function myHoverOver(){
	// Set height to 100% on a few items to allow secondary bar to go to bottom of page
	$(this).css('height','100%');
	$(this).parents("#header").css('height','100%');
	// show secondary nav bar
	$(this).children("ul").css('display','block');
	// format primary link
	$(this).children("a.primary").addClass('over');
	$(this).children("#my_account_nav").children("a.primary").addClass('over');
}
function myHoverOut(){
	$(this).children("ul").css('display','none');
	$(this).css('height','');
	$(this).parents("#header").css('height','');
	$(this).children("a.primary").removeClass('over');
	$(this).children("#my_account_nav").children("a.primary").removeClass('over');
}

$(document).ready(function(){
	$('#nav li.primary').hover(myHoverOver, myHoverOut);
});

