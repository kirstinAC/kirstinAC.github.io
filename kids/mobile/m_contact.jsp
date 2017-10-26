<%-- Import the necessary Java classes --%>
<jsp:useBean id="mobileHtmlHelper" scope="page" class="com.clientviews.pagecontrol.KidsMobileHtmlPageHelper"/>
<%
	String strURL = "http://" + request.getServerName() + "/kids/contact.jsp";
	mobileHtmlHelper.setContentPage(strURL);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./includes/head.jsp" %>
</head>

<body class="home">

<div data-role="page" id="contact">
	<div data-role="header">
		<h1>Contact Us</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->
	<div data-role="content">

	<% 
		out.println(mobileHtmlHelper.getMobileContent("m_contact", true)); 
	%>

	</div><!-- /content -->
</div><!-- /page -->



</body>
</html>