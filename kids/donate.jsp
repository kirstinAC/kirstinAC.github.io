<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_DonateNow" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="donate_now" class="donate">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_DonateNow" /><jsp:getProperty name="resource" property="value" /></h1>
				<div id="content">
					<p class="intro">Art Center for Kids depends on the generosity of individuals and organizations to provide much-needed funding for <a href="scholarships.jsp">scholarships</a> awarded to deserving students.</p>
					<p>The need for scholarship support often exceeds available funds. Your gift to Art  Center for Kids makes an immediate impact on the lives of  promising young artists and designers. <a href="https://www.artcenter.edu/accd/giving/donation.jsp" target="_accd">Make a donation online today</a>.</p>
				</div>
				<br class="clear_break" />
			</div>
		</div>
		<p id="donate_today"><a href="https://www.artcenter.edu/accd/giving/donation.jsp" target="_accd"><span class="word1">Donate</span> <span class="word2">online</span> <span class="word3">today</span></a></p>
		<div id="background1"></div>
		<div id="background2"></div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
