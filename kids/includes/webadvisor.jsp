<jsp:useBean id="resource" scope="page" class="com.clientviews.pagecontrol.KidsResourcePageHelper"/>
<jsp:useBean id="signin" scope="page" class="com.clientviews.pagecontrol.KidsSignInPageHelper"/>

<%
	String page_type = request.getParameter("wa");
	page_type = (page_type != null && page_type.length() > 0) ? page_type : "";
	
	String locale_string = resource.getLocaleString(session);
	boolean isUs = resource.isUs(locale_string);

	String signInURL = resource.getValueByKey(locale_string, "SingleSignOnUrl"); 
	String signInToken = signin.getSignInToken(session);
	
	if (signin.hasSignInToken(session) && signin.isStillSignIn(session, signInURL, signInToken))
	{
		String page_url = resource.getValueByKey(locale_string, "WebAdvisorUrl") + 
							resource.getValueByKey(locale_string, page_type) + signInToken;
		response.sendRedirect(page_url);
	}
%>


<script>
	parent.$.colorbox({
		title:false,
		width:"276px",
		opacity:.7,
		inline:true,
		href:"#sign_in",
		returnFocus:false
	});
</script>

