<%
	String locale_string = resource.getLocaleString(session);

	String signInURL = resource.getValueByKey(locale_string, "SingleSignOnUrl"); 
	String signInToken = signin.getSignInToken(session);
	boolean isSignIn = (signin.hasSignInToken(session) && signin.isStillSignIn(session, signInURL, signInToken)) ? true : false;
%>