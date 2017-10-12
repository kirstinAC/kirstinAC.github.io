<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%

	String errorHdr = "<h3>ERROR: The username or the password you entered is incorrect. Please try again.</h3>";
	
	String referer = request.getHeader("referer");
	
	String signoutNav = "<a href=\"signout.jsp\" id=\"logoutlink\">Logout</a>";


//MUST DO Register Now

	resource.setKey("SearchForClassesTokenUrl");
	String registernowUrl = resource.getValueByKey(locale_string, "WebAdvisorUrl") + resource.getValue();
	
	
%>
<script type="text/javascript">

$(document).ready(function(){

	function isEmpty(str) 
	{
    	return (!str || 0 === str.length  || /^\s*$/.test(str));
	}	

    var showLogin = function(link) {
		if (!$(link).hasClass('fancybox'))
		{
			$('#drawerwrap').animate({height:'10.5em'}, 500);
			$('.toggle, #loginlink').removeClass('triggerdown');
			$('.login').css("display","list-item");
		}
	}

	$('#myscheduleLink').click(function() {
		$('input[name=wa]').val("MyScheduleUrl");
		showLogin('#myscheduleLink');
	});	

	$('#adddropclassLink').click(function() {
		$('input[name=wa]').val("AddDropClassesUrl");
		showLogin('#adddropclassLink');
	});	

	$('#accountsummaryLink').click(function() {
		$('input[name=wa]').val("AccountSummaryUrl");
		showLogin('#accountsummaryLink');
	});	

	$('#mygradesLink').click(function() {
		$('input[name=wa]').val("MyGradesUrl");
		showLogin('#mygradesLink');
	});	
	
	$('#mytranscriptLink').click(function() {
		$('input[name=wa]').val("MyTranscriptsUrl");
		showLogin('#mytranscriptLink');
	});	

	$('#my1098tLink').click(function() {
		$('input[name=wa]').val("My1098tUrl");
		showLogin('#my1098tLink');
	});	
	
	$('#mycontactinfoLink').click(function() {
		$('input[name=wa]').val("MyContactInfoUrl");
		showLogin('#mycontactinfoLink');
	});	

	//FOR tuition page 
	$('#tuition1098tLink').click(function() {
		$('input[name=wa]').val("My1098tUrl");
		showLogin('#tuition1098tLink');
	});		
	
	$('#tuition1098ConsenttLink').click(function() {
		$('input[name=wa]').val("My1098tConsentUrl");
		showLogin('#tuition1098ConsenttLink');
	});		
	


	$('#loginlink').click(function() {
		$('input[name=wa]').val("");
	});	
	
	$('#drawerclose').click(function() {
		$('#message').html(" ");
	});	
	
	
	$('#searchquery').click(function() {
		var squery = $('input[name=searchquery]').val();
		if (!isEmpty(squery)) {
	  		document.forms['searchacn'].submit();
	  		return false;
		}
	});	

    //**To prevent main nav drop down when search input focused**//
	$('#searchquery').focus(function() {
		$('#navlist').css({"visibility":"hidden"});
	});	
	$('#searchquery').blur(function() {
		$('#navlist').css({"visibility":"visible"});		
	});	
	
	$(document).keypress(function(e) {
	  	if (e.which == 13) {
	  	
	  	   	$("#submit_button").click();

	  		//document.forms['searchacn'].submit();
	  		//return false;

	  	}
	});
	
	$('#submit_button').click(function() {
	
		var pass_user = $('input[name=username]');	
		var pass_word = $('input[name=password]');	
		var page_type = $('input[name=wa]');
		var exit_code = true;

        //start the ajax
        $.ajax({
            url: "includes/confirm_sign_in.jsp",
            type: "GET",
			data: { "username": pass_user.val(), "password": pass_word.val(), "wa": page_type.val() },
            cache: false,
            async: false,
            success: function (data) 
            {         
				var $response = $(data);
               	var return_code = $response.filter('#code').text();
               	var page_url = $response.filter('#pageurl').text();
               	var si_token = $response.filter('#token').text();
               	var referer_url = $response.filter('#referer').text();

               	if (return_code != null)
               	{
               		if (return_code == "0")
               		{
						if (page_url == "")
						{
							window.parent.document.location.href = referer_url;
						}
						else
						{
					        $('#drawerwrap').animate({height:'0em'}, 500);
						
							$("#loginlink").removeAttr('id');
							$("#loginLogo").html('<%= signoutNav %>');						

							$('#register_class_link').attr({
							  	'href': '<%= registernowUrl %>' + si_token
							});

							$('#myscheduleLink,#adddropclassLink,#accountsummaryLink,#mygradesLink,#mytranscriptLink,#my1098tLink,#mycontactinfoLink,#tuition1098tLink,#tuition1098ConsenttLink').attr({
							  	'class': 'fancybox',
							  	'data-fancybox-type': 'iframe'
							});
							
							$('#myscheduleLink').attr({
							  	'href': 'includes/webadvisor.jsp?wa=MyScheduleUrl'
							});

							$('#adddropclassLink').attr({
							  	'href': 'includes/webadvisor.jsp?wa=AddDropClassesUrl'
							});

							$('#accountsummaryLink').attr({
							  	'href': 'includes/webadvisor.jsp?wa=AccountSummaryUrl'
							});

							$('#mygradesLink').attr({
							  	'href': 'includes/webadvisor.jsp?wa=MyGradesUrl'
							});

							$('#mytranscriptLink').attr({
							  	'href': 'includes/webadvisor.jsp?wa=MyTranscriptsUrl'
							});

							$('#my1098tLink').attr({
							  	'href': 'includes/webadvisor.jsp?wa=My1098tUrl'
							});
							
							$('#mycontactinfoLink').attr({
							  	'href': 'includes/webadvisor.jsp?wa=MyContactInfoUrl'
							});
							
							//FOR tuition page 
							$('#tuition1098tLink').attr({
							  	'href': 'includes/webadvisor.jsp?wa=My1098tUrl'
							});
							
							$('#tuition1098ConsenttLink').attr({
							  	'href': 'includes/webadvisor.jsp?wa=My1098tConsentUrl'
							});
							

							$.fancybox({
								helpers : {
									overlay : {
										css : {
											'background' : 'rgba(255, 255, 255, 0.90)'
										}
									},
									changeFade: 10,
									changeSpeed: 10,
								},
								type 				: 'iframe',
								href				: 'includes/webadvisor.jsp?wa='+page_type.val(),
								hideOnOverlayClick	: false
								
							});
						
						

						}						
						
					}
					else
					{
						$('#message').html("<%= errorHdr %>");
						exit_code = false;
					}
				}
				return true;
            }
        });	
		return exit_code;
	});		
	
});

</script>


<div id="drawerwrap" class="mblhide">

	<div id="drawer">
		<a id="drawerclose"><span class="hide">Closer</span></a>
		<ul>
			<li class="login">
				<h2><a href="#">Login</a></h2>

				<div class="logininfo">

					<div class="support">
					<h3>Need Help with your Login?</h3>
					<p>Contact the Help Desk at:<br />helpdesk@artcenter.edu or 626.396.2390</p>
					</div>

					<div class="registration">
					<h3>Registration Questions?</h3>
					<p>Contact Public Programs: 626.396.2319</p>
					</div>

				</div><!--end  login info-->

				<div class="loginform">
					<form id="sign_in_form" action="" method="">
						<input type="text" name="username" placeholder="Username" class="user" />
						<input type="password" name="password" placeholder="Password" class="user" />
						<input type="button" value="Login" name="submit" class="submit" id="submit_button" />
						<input type="hidden" name="wa" id="walink" value="">
					</form>
				</div><!--end  login form-->
				<div id="message" class="loginmessage">
				</div>

			</li>

		</ul><!--end  login info-->

	</div><!--end drawer-->

</div><!--end drawerwrap-->

