<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_Mars" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="mars" class="register">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1>Imagine Mars</h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_register.jsp" %>
				</ul>
				<div id="content">
					<article class="m_mars">
					<div class="main_image">
						<img src="/kids/images/ack_goes_to_mars.png" width="555" height="277" />
					</div>
					<p class="intro">Every Spring Term, all ArtCenter for Kids  students have an exciting opportunity to envision life on Mars in cooperation with NASA  and the Jet Propulsion Laboratory's Imagine Mars Program.</p>
					<p>All classes focus on one common  theme: Imagining a future life on Mars. Students translate this theme through the many disciplines represented in the program.</p>
					<p>For more information, visit <a href="http://imaginemars.jpl.nasa.gov" target="_new">imaginemars.jpl.nasa.gov</a>.</p>
					</article>
				</div>
				<br class="clear_break" />
			</div>
		</div>
		<div id="background1"></div>
		<div id="background2"></div>
		<div id="background3"></div>
		<div id="background4"></div>
	</div>
</div>
</body>
</html>
