$(document).ready(function(){

	// Enables slide functionality for elements that immediately follow an element that has the class "expandNextContainer"

	$(".expandNextContainer").css("cursor","pointer");

	$(".expandNextContainer").mouseenter(function(){
		$(this).addClass("hover");
	});
	$(".expandNextContainer").mouseleave(function(){
		$(this).removeClass("hover");
	});

	$(".expandNextContainer:not(.active)").next() // For all containers except those that are active...
		.css("display","none"); // Hide container

	$(".expandNextContainer").click(function(){
		if($(this).hasClass('active')) 
		{
		}
		else
		{
			$(".expandNextContainer").parents('div:eq(0)').find('.active').next().slideToggle(500,"easeOutExpo");
			$(".expandNextContainer").parents('div:eq(0)').find('.active').toggleClass("active");
		}		

		$(this).next().slideToggle(500,"easeOutExpo");  // Slide toggle
		$(this).toggleClass("active");
	});
	
});