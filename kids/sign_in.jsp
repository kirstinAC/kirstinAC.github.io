<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<%
	String page_type = request.getParameter("wa");
	page_type = (page_type != null && page_type.length() > 0) ? page_type : "";

	String passwordUrl = resource.getValueByKey(locale_string, "MyPasswordUrl");

	String errorHdr = "<div id='sign_in_form'><h2>ERROR: Unable to sign in.</h2><div id='message'></div>";
	String errorMsg = "<h4>Please contact the Help Desk.</h4>";
	String errorExp = "<h4>Password expired.</h4><span style='padding-left:24px;'><a href='" + passwordUrl + "' target='_acid'>Change Password ?</a></span>";
	String errorHlp = "<p><div id='password'><h3>Need Help with your login?</h3>Contact the Help Desk at: <a href='mailto:sctech@artcenter.edu'>sctech@artcenter.edu</a> or 626.396.4234<h3>Registration questions?</h3>Contact Public Programs: 626.396.2319</div></p>";
	
	String referer = request.getHeader("referer");
	
	String signOutNav = "<a href=\"signout.jsp\" id=\"sign_out_link\">Sign Out</a>";
	String myAccountNav = "<a href=\"/kids/includes/webadvisor.jsp?wa=AccountSummaryUrl\" id=\"my_account_nav_link\" class=\"account primary webadvisor\">My Account</a>";						
	String accountSummaryNav = "<a href=\"/kids/includes/webadvisor.jsp?wa=AccountSummaryUrl\" id=\"account_summary_nav_link\" class=\"account_summary webadvisor\">Account Summary</a>";						
	String myScheduleNav = "<a href=\"/kids/includes/webadvisor.jsp?wa=MyScheduleUrl\" id=\"my_schedule_nav_link\" class=\"my_schedule webadvisor\">My Schedule</a>";						
	String addDropClassesNav = "<a href=\"/kids/includes/webadvisor.jsp?wa=AddDropClassesUrl\" id=\"add_drop_classes_nav_link\" class=\"add_drop_classes webadvisor\">Add/Drop Classes</a>";						
	String contactInfoNav = "<a href=\"/kids/includes/webadvisor.jsp?wa=MyContactInfoUrl\" id=\"my_contact_info_nav_link\" class=\"my_contact_info webadvisor\">My Contact Info</a>";						
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title>Sign In</title>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.6.custom.min.js"></script> <!-- Provides easing functions -->
<script type="text/javascript" src="js/inputfield.js"></script>
<link href="https://fast.fonts.com/cssapi/318b09cb-fc08-4a65-ad84-8ecbd602d14c.css" rel="stylesheet" type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/lightboxes.css" rel="stylesheet" type="text/css" />

</head>

<script type="text/javascript">

$(document).ready(function(){

	$('#submit_link').click(function() {
	
		var pass_user = $('input[name=user]');	
		var pass_word = $('input[name=password]');	
		var exit_code = true;

        //start the ajax
        $.ajax({
            url: "includes/confirm_sign_in.jsp",
            type: "GET",
			data: { "user": pass_user.val(), "password": pass_word.val(), "wa": "<%= page_type %>" },
            cache: false,
            async: false,
            success: function (data) 
            {         
				var $response = $(data);
               	var return_code = $response.filter('#code').text();
               	var page_url = $response.filter('#pageurl').text();
               	var referer_url = "<%= referer %>";

               	if (return_code != null)
               	{
               		if (return_code == "0")
               		{
						parent.$.colorbox.close();
						
						if (page_url == "")
						{
							window.parent.document.location.href = referer_url;
						}
						else
						{
							parent.$("#sign_in_link").removeAttr('id');
							parent.$("#sign_in_logo").html('<%= signOutNav %>');						

							parent.$("#register_class_link").removeAttr('id');

							parent.$("#my_account_link").removeAttr('id');
							parent.$("#account_summary_link").removeAttr('id');
							parent.$("#my_schedule_link").removeAttr('id');
							parent.$("#add_drop_link").removeAttr('id');
							parent.$("#my_contact_info_link").removeAttr('id');

							parent.$("#register_class_nav").html("<a href='/kids/includes/webadvisor.jsp?wa=SearchForClassesTokenUrl' id='register_class_nav_link' onclick='javascript:window.open(\"class_descriptions_popup.jsp\", \"wn_classdescription\", \"width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX=\"+(window.screen.width - 480));' class='register_for_classes webadvisor'>Register for Classes</a>");

							parent.$("#my_account_nav").html('<%= myAccountNav %>');						
							parent.$("#account_summary_nav").html('<%= accountSummaryNav %>');						
							parent.$("#my_schedule_nav").html('<%= myScheduleNav %>');						
							parent.$("#add_drop_classes_nav").html('<%= addDropClassesNav %>');						
							parent.$("#my_contact_info_nav").html('<%= contactInfoNav %>');						


							parent.$("a#my_account_nav_link,a#my_schedule_nav_link,a#add_drop_classes_nav_link,a#account_summary_nav_link,a#my_contact_info_nav_link,a#register_class_nav_link").fancybox({
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

							parent.$.fancybox({
									'type'				:	'iframe',
									'transitionIn'		:	'elastic',
									'transitionOut'		:	'elastic',
									'speedIn'			:	600, 
									'speedOut'			:	200, 
									'width'				:	'78%',
									'height'			:	'98%',
									'autoScale'			:	true,
									'overlayColor'		:	'#000', 
									'href'				: 	'/kids/includes/webadvisor.jsp?wa=<%= page_type %>',
									'hideOnOverlayClick':	false
							});
						}						
						
					}
					else
               		if (return_code == "1")
               		{
						$('#showform').html("<%= errorHdr %>");  
						$('#message').html("<%= errorExp %>")  
						.append("<%= errorHlp %>")  
						.hide()  
						.fadeIn(1500, function() {  
						});  					
						exit_code = false;
                   	}
					else
					{
						$('#showform').html("<%= errorHdr %>");  
						$('#message').html("<%= errorMsg %>")  
						.append("<%= errorHlp %>")  
						.hide()  
						.fadeIn(1500, function() {  
						});  					
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

<body id="sign_in_page">
<h1>Sign In</h1>

<div id="showform">
	<form id="sign_in_form" action="" method="">
		<input name="user" type="text" value="User Name" class="inputfield"/><br />
		<input name="password" type="password" value="********" class="inputfield"/><br />
		<input name="submit" type="submit" value="Submit" id="submit_link" />
		<p>
			<div id="password">
				<h3>Need Help with your login?</h3>
				Contact the Help Desk at:
				<a href="mailto:sctech@artcenter.edu">sctech@artcenter.edu</a> or 626.396.4234
				<h3>Registration questions?</h3>
				Contact Public Programs:
				626.396.2319
			</div>
		</p>
	</form>
</div>

</body>
</html>

