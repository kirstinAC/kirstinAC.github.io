<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_ContactUs" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="contact_us" class="contact">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_ContactUs" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_contact.jsp" %>
				</ul>
				<div id="content">
					<article class="m_contact">
					<h4>ArtCenter for Kids</h4>
					<p>ArtCenter College of Design<br />South Campus<br />
						950 South Raymond Ave.<br />
					Pasadena, CA 91105</p>
					<p><strong>Telephone</strong>: 626.396.2319<br />
						<strong>Fax</strong>: 626.396.4219<br />
					<strong>Email</strong>: <a href="mailto:kids@artcenter.edu">kids@artcenter.edu</a></p>
					<h4>Mailing Address</h4>
					<p>P.O. Box 7191<br />
						Pasadena, CA 91101-7197</p>
					<h4>Office Hours</h4>
					<p>Monday&#8211;Thursday 10  a.m.&#8211; 9 p.m.<br />
						Friday 9 a.m.&#8211;5  p.m.<br />
						Closed weekends and major holidays.</p>
					<h4>Emergency Contact</h4>
					<p>The ArtCenter for Kids office is closed Sundays. In the event of an emergency involving an ArtCenter for Kids student, please contact Campus Security at 626.396.2299.</p>
					<p class="intro">&nbsp;</p>
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
