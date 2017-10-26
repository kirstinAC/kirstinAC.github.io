<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_OurMission" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="our_mission" class="about">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_OurMission" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_about.jsp" %>
				</ul>
				<div id="content">
					<article class="m_mission">
					<p class="intro">ArtCenter for Kids offers a wide range of unique art and design classes created just for youth in grades 4 through 8. Teaching skills such as critical thinking, innovation and visual literacy, our classes help kids learn to solve problems creatively, find new ways of expression and become designers of their own worlds.</p>
					<p>ArtCenter for Kids Sunday classes meet for seven-week sessions held Sundays from 1 to 4 p.m. at ArtCenter's South Campus. We also offer intensive <a href="/kids/summerworkshops.jsp">five-day workshops</a> during summer. Our classes are small&mdash;with no more than 15 children per class&mdash;allowing our students to have personalized, one-on-one attention from our distinguished <a href="/kids/facultybios.jsp">faculty</a>.</p>
					<p>Providing young people with opportunities to use art and design to think critically and broadly can inspire and change lives. This freedom to express oneself and embark on a lifelong journey of self-discovery is vital to the ArtCenter for Kids mission.</p>
					</article>
				</div>
				<br class="clear_break" />
			</div>
		</div>
		<div id="background1"></div>
		<div id="background2"></div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
