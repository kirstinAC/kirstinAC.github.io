$(document).ready(function(){

	
	// On Page load check if an anchor link is in the url
	// If so, display the appropriate bio
	var url=window.location;  
	var anchor_link = "";
	anchor_link=url.hash.substring(1); //anchor without the # character
	
	if (anchor_link != "") {
		var faculty_bio=$('#faculty_list dd[class="' + anchor_link + '"]').html(); // Get the text for the bio
		if (faculty_bio) {
			$("#faculty_content").html(faculty_bio); // Place bio text into div
			$('a[href="#' + anchor_link + '"]').addClass("active");
		}
	}


	// When bio link is clicked, display appropriate bio
	$("#faculty_list dt a").click(function(event){
		var faculty_bio=$(this).parent().nextAll("dd").html();  // Get the text for the bio
		$("#faculty_content").html(faculty_bio); // Place bio text into div
		$("#faculty_list dt a").removeClass("active"); // De-highlight all links
		$(this).addClass("active"); // Keep clicked link highlighted
	}); 

});
