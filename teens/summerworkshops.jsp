<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_SummerWorkshop" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="summer_workshops" class="classes <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">	
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>
	
	<ul id="subnav">
		<%@ include file="/includes/nav_classes.jsp" %>
	</ul>

	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_SummerWorkshop" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="content_wrapper">
		<div id="content">

			<h3>Summer Workshops</h3>
			<p>ArtCenter for Teens offers an expanded series of one- and two-week workshops in the summer, designed to give student an intensive, unique experience in art and design. Classes meet between <b>June 25 and August 10</b> at South Campus Mondays through Fridays from 9 a.m. to 3:50 p.m.</p> 
			
			<p>Enrollment is limited to 15 students per workshop, with the exception of digital media workshops, which are limited to 12 students.</p> 

			<p>Tuition for most one-week workshops is $400, and $800 for two-week workshops.</p> 
			<p>Summer 2018 workshop offerings and schedules will be available in early March. View the types of workshops we typically offer <a href="/teens/classdescriptions.jsp">here</a>.</p>		

		</div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
