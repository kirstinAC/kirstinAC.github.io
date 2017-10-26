<div id="nav_wrapper">
<ul id="nav">
	<li class="primary"><a href="mission.jsp" class="about primary">About Us</a>
		<ul id="about">
			<%@ include file="/includes/nav_about.jsp" %>
		</ul>
	</li>
	<li class="primary"><a href="class_descriptions.jsp" class="classes primary">Classes</a>
		<ul>
			<%@ include file="/includes/nav_classes.jsp" %>
		</ul>
	</li>
	<li class="primary"><a href="register.jsp" class="register primary">More Info</a>
		<ul>
			<%@ include file="/includes/nav_register.jsp" %>
		</ul>
	</li>
	<li class="primary"><a href="gallery.jsp" class="gallery primary">Gallery</a>
	</li>
	<li class="primary">
		<div id="my_account_nav">
			<% if (isSignIn) { %>			
				<a href="/kids/includes/webadvisor.jsp?wa=AccountSummaryUrl" class="account primary webadvisor">My Account</a>
			<% } else { %>
				<a href="sign_in.jsp?wa=AccountSummaryUrl" id="my_account_link" class="account primary">My Account</a>
			<% } %>				
		</div>
		<ul>
			<%@ include file="/includes/nav_my_account.jsp" %>
		</ul>
	</li>
	<li class="primary"><a href="donate.jsp" class="donate primary">Donate Now</a>
	</li>
	<li class="primary"><a href="contact.jsp" class="contact primary" style="width:90px;padding-right:0px;">Contact Us</a>
		<ul>
			<%@ include file="/includes/nav_contact.jsp" %>
		</ul>
	</li>
	<br class="clear_break" />
</ul>
</div>