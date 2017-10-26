<div id="header">
	<div id="logos"><a href="http://www.artcenter.edu" target="_accd" id="logo_art_center">Art Center College of Design</a> <a href="index.jsp" id="logo_kids">Art Center for Kids</a> <span style="color:red; position:absolute; top:0px; font-size:50px; font-weight: bold;">*** TEST SITE ***</span>  </div>

	<div id="sign_in_logo">
		<% if (isSignIn) { %>
			<a href="signout.jsp" id="sign_out_link">Sign Out</a>
		<% } else { %>
			<a href="sign_in.jsp" id="sign_in_link">Sign In</a>
		<% } %>
	</div>	

</div>
