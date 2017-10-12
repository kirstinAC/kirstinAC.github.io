<div id="login" class="mblhide">
	<div id="loginLogo">
	<%  if (isSignIn) 
		{ 
			out.println("<a href=\"signout.jsp\" id=\"logoutlink\">Logout</a>");
		}
		else
		{
			out.println("<a href=\"#\" id=\"loginlink\" class=\"triggerdown\">Login</a>");
		}
	%>
	</div>
</div>
