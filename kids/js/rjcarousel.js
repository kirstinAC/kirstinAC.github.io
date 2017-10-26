$(document).ready(function(){

	// Enables a horizontal carousel slide for the following html markup
	/*
	<div id="rjcarousel_wrapper">  <!-- outer container -->
		<div id="rjcarousel_belt">
			<!-- content to be slided here -->
		</div>
	</div>
	<a href="javascript:;" class="rjcarousel_backward">< Backward</a> <!-- button for backwards slide -->
	<a href="javascript:;" class="rjcarousel_forward">Forward ></a> <!-- content forwards here -->
	*/
	
	var slidedistanceOffset = 170; // If this value is 0 then the slide offset for each slide is exactly the width of the slide_wrapper
	var leftPadding = 30;
	var rightPadding = 50;
	
	var slidewidth = $("#rjcarousel_wrapper").width();
	var slidedistance = $("#rjcarousel_wrapper").width() - slidedistanceOffset;
	var beltwidth = $("#rjcarousel_wrapper")[0].scrollWidth;

	function getCurrentLeftOffset() {
		// returns a positive number of the left offset of the belt
		return -($("#rjcarousel_belt").css("left").replace('px','')); 
	}


	// *** FORWARD function
	function rjcarousel_forward(speed){
		$("#rjcarousel_belt").stop()
		if (getCurrentLeftOffset()+slidedistance+rightPadding >= beltwidth-slidewidth) {
			 // current distance too large for a full slide, so only slide until the end
			 s = beltwidth-slidewidth-getCurrentLeftOffset()+rightPadding;
		} else {
			 // slide by the full slide distance
			 s = slidedistance;
		}
		$("#rjcarousel_belt").animate({
			left: '-=' + s
		}, speed, 'easeOutExpo');
	}


	// *** BACKWARD function
	function rjcarousel_backward(speed){
		$("#rjcarousel_belt").stop() // stop all current animations on the element

		if (getCurrentLeftOffset()+leftPadding <= slidedistance) {
			// current distance is too small for a full slide distance, so only slide by the smaller value
			s = getCurrentLeftOffset()+leftPadding;
		} else {
			// slide by the full slide distance
			s = slidedistance;
		}
		$("#rjcarousel_belt").animate({
			left: '+=' + s
		}, speed, 'easeOutExpo');
	}



	$("#rjcarousel_belt").css('left', leftPadding);	// Set initial slide position

	
	// Attach forward function to link
	$(".rjcarousel_forward").click(function(){
		rjcarousel_forward(1500);
	}); 
	
	
	// Attach backward function to link
	$(".rjcarousel_backward").click(function() {
		rjcarousel_backward(1500); 
	}); 
	
	
	$('div#rjcarousel_wrapper')
	.bind('mousewheel', function(event, delta) {
		var dir = delta > 0 ? 'Up' : 'Down';
		var	vel = Math.abs(delta);
		speed = 1500/vel;
		if (dir == 'Down') {
			rjcarousel_forward(speed); // Faster mouse wheel will result in faster slide speed
		}
		else
		{
			rjcarousel_backward(speed);// Faster mouse wheel will result in faster slide speed
		}
		return false;
	});

});
