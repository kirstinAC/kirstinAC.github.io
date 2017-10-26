<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php 
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_OpenHouse" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="open_house" class="about">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_OpenHouse" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_about.jsp" %>
				</ul>
				<div id="content">
					<article class="m_openhouse">
					<div class="main_image">
						<img src="/kids/images/open_house.jpg" width="555" height="277" />
					</div>
					<p class="intro">Curious about Art Center for Kids? Art Center welcomes elementary and middle school students, parents and educators to our Open House at the end of each seven-week session. It’s a great opportunity to learn more about the classes we offer.</p>
					<p>All Hillside Campus classes meet in the cafeteria at 4 p.m. to exhibit their work. Classes scheduled at South Campus meet in their assigned classrooms.  Visit our <a href="calendar.jsp">Calendar</a> for upcoming Open House dates.</p>
					</article>
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
