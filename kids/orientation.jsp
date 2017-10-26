<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_Orientation" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="orientation" class="register">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_Orientation" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_register.jsp" %>
				</ul>
				<div id="content">
					<h4>Orientation </h4>
					<p>On the first Sunday of each session, an orientation is held for Hillside Campus classes only at the Ahmanson Auditorium at 12:15 p.m. The entrance to the auditorium is located beneath the bridge on MacMinn Drive.</p>
				</div>
				<br class="clear_break" />
			</div>
		</div>
		<div id="background1"></div>
		<div id="background2"></div>
		<div id="background3"></div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
