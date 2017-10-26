<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_DirectorsLetter" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="directors_letter" class="about">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_DirectorsLetter" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_about.jsp" %>
				</ul>
				<div id="content">
				  <p><p align="center"><b>&quot;This is your life.<br />
					  Do what you love,<br />
					    and do it often.&quot;<br />
				  The Holstee Manifesto</b></center></p>
                    <p>As human beings, our brains are wired to be creative, inventive and inspired. Children are born with these exceptional talents. But over time, research shows that they begin to lose them. This natural ability to dream up new ideas and the courage to test them out requires time and space to develop. </p>
                  <p>                      That&rsquo;s why we created ArtCenter for Kids. Our program gives children an opportunity to imagine, create and explore their future selves; to help children develop skills and attitudes that will drive their success in school, life and future work; and to help them see that they can make their imagination visible and turn the ordinary into the extraordinary.</p>
                    <p>                      Here in ArtCenter for Kids, we motivate students to express themselves in new ways and discover their sources of inspiration. Our classes mirror the many disciplines offered at ArtCenter and are taught by members of the College&rsquo;s community &mdash; faculty, alumni, undergraduate and graduate students &mdash; who encourage new ways of thinking, seeing and doing.</p>
                    <p>                      ArtCenter for Kids is open to students in grades 4 &mdash; 8 at the College&rsquo;s Hillside and South campuses in Pasadena.</p>
                    <p>                      Join us on this journey to nurture our children&rsquo;s creativity and help them design and build the world as they imagine it. </p>
                    <p>                      <b>Paula Goodman<br />
                      Director, K&mdash;12 Programs</b></p>
                    <p align="center"><b>&ldquo;The world of reality has its limits; the world of imagination is boundless.&rdquo; <br />
                  Jean-Jacques Rousseau</b></p>
<p class="intro">&nbsp;</p>
					<p>&nbsp;</p>
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
