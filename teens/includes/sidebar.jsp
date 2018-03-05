<div id="sidebar">
	<a href="http://www.artcenter.edu" target="_accd"><img src="images/logo_artcenter.png" width="152" height="22" alt="Art Center College of Design" class="logo_artcenter" /></a>
	<a href="index.jsp"><img src="images/logo_artcenter_for_teens.png" width="153" height="62" alt="ArtCenter for Teens" class="logo_artcenter_for_teens" /></a>
	<div id="homenote">Courses in art and design for high school students (grades 9-12)</div>
	
	<div id="sign_in_logo">
		<% if (isSignIn) { %>
			<a href="includes/signout.jsp" id="sign_out_link"><span class="sign_in_arrow">Sign Out</span></a>
		<% } else { %>
			<a href="javascript:;" id="sign_in_link"><span class="sign_in_arrow">Sign In</span></a>
		<% } %>
	</div>
	
	<%@ include file="/includes/signin.jsp" %>
	<a href="calendar.jsp" id="calendar_headline">Calendar</a>
	<dl id="calendar_list">
		<dt><span class="day">2</span> <span class="month">April</span></dt>
		<dd>Registration Begins</dd>
		<span class="line"></span>
		<dt><span class="day">2</span> <span class="month">June</span></dt>
		<dd>Classes Begin</em></dd>
		<span class="line"></span>
	</dl>
	
	

	<dl id="evalation_kit">

		<dt><span class="day"></span></dt>

		<dd><a id="evalation_kit_headline" href="https://acid.artcenter.edu/acid/login?service=https%3a%2f%2fartcenter.evaluationkit.com%2fMyEval%2fLoginCAS.aspx" target="_blank">Login to EvaluationKIT</a></dd>

		<dd><a id="evalation_kit_headline" href="pdf/EvaluationKIT_Training_Students_Using_the_Mobile_App.pdf" target="_blank">Instructions for EvaluationKIT App</a></dd>
	
	</dl>
	
	<div id="social_media_icons"> <a href="http://www.facebook.com/profile.php?id=190259267681745" title="Follow us on Facebook" target="_new" id="facebook">Facebook</a> <a href="credits.jsp" id="credits_link" alt="Credits">Credits</a> </div>
</div>
