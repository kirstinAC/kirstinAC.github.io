function myHoverOver(){
	// show secondary nav bar
	$(this).children("ul").css('display','block');
	// format primary link
	$(this).children("a.primary").addClass('over');
	$(this).children("#my_account_nav").children("a.primary").addClass('over');
}
function myHoverOut(){
	$(this).children("ul").css('display','none');
	$(this).children("a.primary").removeClass('over');
	$(this).children("#my_account_nav").children("a.primary").removeClass('over');
}

$(document).ready(function(){
	// Drop-down Navigation
	$('#nav li.primary').hover(myHoverOver, myHoverOut);

	// Sign-in Lightbox
	$("a#sign_in_link,a#my_account_link,a#my_schedule_link,a#add_drop_link,a#account_summary_link,a#my_contact_info_link").colorbox({
		title:false,
		innerWidth:"612px",
		innerHeight:"423px",
		initialWidth:"1px",
		initialHeight:"1px",
		opacity:.7,
		iframe:true,
		transition:"fade",
		returnFocus:false
	});

	// Credits Lightbox
	$("a#credits").colorbox({
		title:false,
		innerWidth:"612px",
		innerHeight:"483px",
		opacity:.7,
		iframe:true,
		returnFocus:false
	});
});