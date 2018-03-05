<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_SummerWorkshop" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="summer_workshops" class="classes">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_SummerWorkshop" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_classes.jsp" %>
				</ul>
				<div id="content">
					<p class="intro">ArtCenter for Kids offers one-week sessions during summer, between June 25 and August 10. Workshops are held at South Campus Monday through Friday from 9 a.m. to noon. The cost, which includes all materials, is $300 per course, with the exception of <i>Photography Book Workshop</i>, which is $375. <a href="scholarships.jsp">Scholarships</a> are available. </p>
					<p>View the types of workshops we typically offer <a href="class_descriptions.jsp">here</a>.</p>
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
