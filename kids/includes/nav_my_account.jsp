<% if (isSignIn) { %>
	<li><a href="/kids/includes/webadvisor.jsp?wa=AccountSummaryUrl" class="account_summary webadvisor">Account Summary</a></li>
	<li><a href="/kids/includes/webadvisor.jsp?wa=MyScheduleUrl" class="my_schedule webadvisor">My Schedule</a></li>
	<li><a href="/kids/includes/webadvisor.jsp?wa=AddDropClassesUrl" class="add_drop_classes webadvisor">Add/Drop Classes</a></li>
	<li><a href="/kids/includes/webadvisor.jsp?wa=MyContactInfoUrl" class="my_contact_info webadvisor">My Contact Info</a></li>
<% } else { %>
	<li><div id="account_summary_nav"><a href="sign_in.jsp?wa=AccountSummaryUrl" id="account_summary_link">Account Summary</a></div></li>
	<li><div id="my_schedule_nav"><a href="sign_in.jsp?wa=MyScheduleUrl" id="my_schedule_link">My Schedule</a></div></li>
	<li><div id="add_drop_classes_nav"><a href="sign_in.jsp?wa=AddDropClassesUrl" id="add_drop_link">Add/Drop Classes</a></div></li>
	<li><div id="my_contact_info_nav"><a href="sign_in.jsp?wa=MyContactInfoUrl" id="my_contact_info_link">My Contact Info</a></div></li>
<% } %>
<li><a href="<jsp:setProperty name="resource" property="key" value="MyPasswordUrl" /><jsp:getProperty name="resource" property="value" />" class="my_password" target="_acid">My Password</a></li>
