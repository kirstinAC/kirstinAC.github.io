<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<%
	String token = signin.getSignInToken(session);
	
	if (signin.hasSignInToken(session) && signin.isStillSignIn(session, signInURL, token))
	{
		signin.signOut(session, signInURL, token);
	}	

	response.sendRedirect(request.getHeader("referer"));
%>

