<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<%

	String username = request.getParameter("user");
	String password = request.getParameter("password");
	String page_type = request.getParameter("wa");

	page_type = (page_type != null && page_type.length() > 0) ? page_type : "";
	username = (username != null && username.length() > 0 && !username.equals("User Name")) ? username : "";
	password = (password != null && password.length() > 0 && !password.equals("********")) ? password : "";

	String result_code = "";	
	String referer = "";

	if (!isSignIn && username != null && username.length() > 0 && !username.equals("User Name") && password != null && password.length() > 0 && !password.equals("********"))
	{
		if (!signin.hasSignInToken(session) || !signin.isStillSignIn(session, signInURL, signin.getSignInToken(session)))
		{	
		
			result_code = signin.signIn(session, signInURL, username, password);
			referer = request.getHeader("referer");
	
		}
	}	

%>

<div id="code"><%= result_code %></div>
<div id="referer"><%= referer %></div>
<div id="pageurl"><%= page_type %></div>

