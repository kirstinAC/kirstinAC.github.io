<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_FAQ" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="faq" class="about <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>

	<ul id="subnav">
		<%@ include file="/includes/nav_about.jsp" %>
	</ul>
	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_FAQ" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="content_wrapper">
		<div id="content">

			<jsp:setProperty name="resource" property="key" value="FaqContentText1" /><jsp:getProperty name="resource" property="value" />		

				<% if (isSignIn) { %>
					<jsp:setProperty name="resource" property="key" value="FaqContentText2" /><jsp:getProperty name="resource" property="value" />		
				<% } else { %>
					<jsp:setProperty name="resource" property="key" value="FaqContentText3" /><jsp:getProperty name="resource" property="value" />		
				<% } %>

			<jsp:setProperty name="resource" property="key" value="FaqContentText4" /><jsp:getProperty name="resource" property="value" />		

				<% if (isSignIn) { %>
					<jsp:setProperty name="resource" property="key" value="FaqContentText5" /><jsp:getProperty name="resource" property="value" />		
				<% } else { %>
					<jsp:setProperty name="resource" property="key" value="FaqContentText6" /><jsp:getProperty name="resource" property="value" />		
				<% } %>

			<jsp:setProperty name="resource" property="key" value="FaqContentText7" /><jsp:getProperty name="resource" property="value" />		

		</div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
