<%
	String signOutNav = "<a href=\"includes/signout.jsp\" id=\"sign_out_link\"><span class=\"sign_in_arrow\">Sign Out</span></a>";
	String myAccountNav = "<a href=\"/teens/includes/webadvisor.jsp?wa=AccountSummaryUrl\" id=\"my_account_nav_link\" class=\"account primary webadvisor\">My Account</a>";						
	String accountSummaryNav = "<a href=\"/teens/includes/webadvisor.jsp?wa=AccountSummaryUrl\" id=\"account_summary_nav_link\" class=\"account_summary webadvisor\">Account Summary</a>";						
	String myScheduleNav = "<a href=\"/teens/includes/webadvisor.jsp?wa=MyScheduleUrl\" id=\"my_schedule_nav_link\" class=\"my_schedule webadvisor\">My Schedule</a>";						
	String addDropClassesNav = "<a href=\"/teens/includes/webadvisor.jsp?wa=AddDropClassesUrl\" id=\"add_drop_classes_nav_link\" class=\"add_drop_classes webadvisor\">Add/Drop Classes</a>";						
	String myGradesNav = "<a href=\"/teens/includes/webadvisor.jsp?wa=MyGradesUrl\" id=\"my_grades_nav_link\" class=\"my_grades webadvisor\">My Grades</a>";
	String myTranscriptsNav = "<a href=\"/teens/includes/webadvisor.jsp?wa=MyTranscriptsUrl\" id=\"my_transcripts_nav_link\" class=\"my_transcripts webadvisor\">My Transcripts</a>";
	String contactInfoNav = "<a href=\"/teens/includes/webadvisor.jsp?wa=MyContactInfoUrl\" id=\"my_contact_info_nav_link\" class=\"my_contact_info webadvisor\">My Contact Info</a>";						
%>
<div id="hidefromview">
	<div id="sign_in">
		<h1>Sign In</h1>
		<form id="sign_in_form" action="" method="">
			<input name="user" type="text" value="User Name" class="inputfield"/>
			<input name="password" type="password" value="********" class="inputfield"/>
			<input name="submit" type="submit" value="Submit" id="submit_link" />
		</form>
		<p id="sign_in_p">
			<div id="password">
				<h3>Need Help with your login?</h3>
				Contact the Help Desk at:
				<a href="mailto:helpdesk@artcenter.edu">helpdesk@artcenter.edu</a> or 626.396.2390
				<h3>Registration questions?</h3>
				Contact Public Programs:
				626.396.2319
			</div>
		</p>
		<p id="sign_in_p">&nbsp;</p>
	</div>
	<div id="from_url"></div>
</div>
<div id="hidefromview">
	<div id="validate">
		<h1>Sign In</h1>
		<div id="failure">
			<h2 id="msg_hdr">ERROR: Unable to sign in.</h2>
			<div id="msg_expired" style="padding-bottom:10px;">
				<h4>Password expired.</h4>
				<span style="padding-left:24px;"><a href="<jsp:setProperty name="resource" property="key" value="MyPasswordUrl" /><jsp:getProperty name="resource" property="value" />" target="_acid">Change Password ?</a></span>
			</div>
			<div id="msg_txt">
				<h4>Please contact the Help Desk.</h4>
			</div>
		</div>
		<p id="validate_p">
			<div id="password">
				<h3>Need Help with your login?</h3>
				Contact the Help Desk at:
				<a href="mailto:helpdesk@artcenter.edu">helpdesk@artcenter.edu</a> or 626.396.2390
				<h3>Registration questions?</h3>
				Contact Public Programs:
				626.396.2319
			</div>
		</p>
		<p id="validate_p">&nbsp;</p>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#sign_in_link,#my_account_link,#account_summary_link,#my_schedule_link,#add_drop_link,#my_grades_link,#my_transcripts_link,#my_contact_info_link").colorbox({
	
		title: function(){
		    var url = $(this).attr('href');
			$("#from_url").html(url);
			return false;
		},
	
		width:"276px",
		height: "362px",
		opacity:.7,
		inline:true,
		href:"#sign_in",
		returnFocus:false
	});
	
	$("#submit_link").colorbox({
		title:false,
		width:"276px",
		opacity:.7,
		inline:true,
		href:"#validate",
		returnFocus:false
	});
	
	
	$("#msg_expired").hide();
	$("#msg_txt").hide();
	
	$('#submit_link').click(function() {
		var pass_user = $('input[name=user]');	
		var pass_word = $('input[name=password]');	
 		var page_url = $("#from_url").text();
 		
        //start the ajax
        $.ajax({
            url: "includes/confirm_sign_in.jsp",
            type: "GET",
			data: { "user": pass_user.val(), "password": pass_word.val(), "wa": page_url },
            cache: false,
            async: false,
            success: function (data) 
            {         
				var $response = $(data);
               	var return_code = $response.filter('#code').text();
               	var page_url = $response.filter('#pageurl').text();
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
							var gotoPageUrl = "/teens/includes/webadvisor.jsp?wa=" + page_url;
						
							parent.$("#sign_in_link").removeAttr('id');
							parent.$("#sign_in_logo").html('<%= signOutNav %>');						
						
							parent.$("#my_account_link").removeAttr('id');
							parent.$("#account_summary_link").removeAttr('id');
							parent.$("#my_schedule_link").removeAttr('id');
							parent.$("#add_drop_link").removeAttr('id');
							parent.$("#my_grades_link").removeAttr('id');
							parent.$("#my_transcripts_link").removeAttr('id');
							parent.$("#my_contact_info_link").removeAttr('id');

							parent.$("#my_account_nav").html('<%= myAccountNav %>');						
							parent.$("#account_summary_nav").html('<%= accountSummaryNav %>');						
							parent.$("#my_schedule_nav").html('<%= myScheduleNav %>');						
							parent.$("#add_drop_classes_nav").html('<%= addDropClassesNav %>');						
							parent.$("#my_grades_nav").html('<%= myGradesNav %>');						
							parent.$("#my_transcripts_nav").html('<%= myTranscriptsNav %>');						
							parent.$("#my_contact_info_nav").html('<%= contactInfoNav %>');						

							parent.$("a#my_account_nav_link,a#account_summary_nav_link,a#my_schedule_nav_link,a#add_drop_classes_nav_link,a#my_grades_nav_link,a#my_transcripts_nav_link,a#my_contact_info_nav_link").colorbox({
								title:false,
								width:"784",
								height:"801",
								opacity:.7,
								iframe:true,
								returnFocus:false,
								overlayClose:false
							});

							$("#submit_link").colorbox({
								title:false,
								width:"784",
								height:"801",
								opacity:.7,
								iframe:true,
								returnFocus:false,
								inline:false,
								href:gotoPageUrl,
								overlayClose:false
							});
						
					
						}
						
						//window.location.href = referer_url;
					}
					else
               		if (return_code == "1")
               		{
               			$("#msg_expired").show();
						$("#msg_txt").hide();
					}
					else
					{
               			$("#msg_expired").hide();
						$("#msg_txt").show();
					}
				}
				return true;
            }
            
            
        });
         
	});		
	
	
});
</script>

