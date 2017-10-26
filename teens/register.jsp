<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_HowToRegister" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="how_to_register" class="register <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">	
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>
	
	<ul id="subnav">
		<%@ include file="/includes/nav_register.jsp" %>
	</ul>

	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_HowToRegister" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="content_wrapper">
		<div id="content">
		
			<jsp:setProperty name="resource" property="key" value="RegisterContentText1" /><jsp:getProperty name="resource" property="value" />		

			<% if (isSignIn) { %>
				<jsp:setProperty name="resource" property="key" value="RegisterContentText2" /><jsp:getProperty name="resource" property="value" />		
			<% } else { %>
				<jsp:setProperty name="resource" property="key" value="RegisterContentText3" /><jsp:getProperty name="resource" property="value" />		
					<% if (isUs ) { %>
						<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />				
					<% } %>					
				<jsp:setProperty name="resource" property="key" value="RegisterContentText3_1" /><jsp:getProperty name="resource" property="value" />		
			<% } %>					
			
			<jsp:setProperty name="resource" property="key" value="RegisterContentText4" /><jsp:getProperty name="resource" property="value" />		

				<% if (isSignIn) { %>
					<jsp:setProperty name="resource" property="key" value="RegisterContentText5" /><jsp:getProperty name="resource" property="value" />		
				<% } else { %>
					<jsp:setProperty name="resource" property="key" value="RegisterContentText6" /><jsp:getProperty name="resource" property="value" />		
					<% if (isUs ) { %>
						<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />					
					<% } %>					
					<jsp:setProperty name="resource" property="key" value="RegisterContentText6_1" /><jsp:getProperty name="resource" property="value" />		
				<% } %>					

			<jsp:setProperty name="resource" property="key" value="RegisterContentText7" /><jsp:getProperty name="resource" property="value" />		

				<% if (isSignIn) { %>
					<jsp:setProperty name="resource" property="key" value="RegisterContentText8" /><jsp:getProperty name="resource" property="value" />		
				<% } else { %>
					<jsp:setProperty name="resource" property="key" value="RegisterContentText9" /><jsp:getProperty name="resource" property="value" />		
					<% if (isUs ) { %>
						<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />					
					<% } %>					
					<jsp:setProperty name="resource" property="key" value="RegisterContentText9_1" /><jsp:getProperty name="resource" property="value" />		
				<% } %>					

			<jsp:setProperty name="resource" property="key" value="RegisterContentText10" /><jsp:getProperty name="resource" property="value" />		
				
				<% if (isSignIn) { %>
					<jsp:setProperty name="resource" property="key" value="RegisterContentText11" /><jsp:getProperty name="resource" property="value" />		
				<% } else { %>
					<jsp:setProperty name="resource" property="key" value="RegisterContentText12" /><jsp:getProperty name="resource" property="value" />		
					<% if (isUs ) { %>
						<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />
					<% } %>					
					<jsp:setProperty name="resource" property="key" value="RegisterContentText12_1" /><jsp:getProperty name="resource" property="value" />		
				<% } %>					
				
			<jsp:setProperty name="resource" property="key" value="RegisterContentText13" /><jsp:getProperty name="resource" property="value" />		

	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
