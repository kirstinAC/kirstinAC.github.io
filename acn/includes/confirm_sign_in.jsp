<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>
<%

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String page_type = request.getParameter("wa");

	page_type = (page_type != null && page_type.length() > 0) ? page_type : "";
	username = (username != null && username.length() > 0) ? username : "";
	password = (password != null && password.length() > 0)? password : "";

	String result_code = "";	
	String referer = "";
	String token = "";

	if (!isSignIn && username != null && username.length() > 0 && password != null && password.length() > 0)
	{
		if (!signin.hasSignInToken(session) || !signin.isStillSignIn(session, signInURL, signin.getSignInToken(session)))
		{	
		
			result_code = signin.signIn(session, signInURL, username, password);
			token = signin.getSignInToken(session);
			referer = request.getHeader("referer");
			referer = ( referer != null && referer.length() > 0 && referer.substring(referer.length()-1).equals("#") ) ? referer.substring(0,referer.length()-1) : referer;
		}
	}	

%>

<div id="code"><%= result_code %></div>
<div id="referer"><%= referer %></div>
<div id="pageurl"><%= page_type %></div>
<div id="token"><%= token %></div>


