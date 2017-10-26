<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_AboutPublicPrograms" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="public_programs" class="about">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_AboutPublicPrograms" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_about.jsp" %>
				</ul>
				<div id="content">
					<div class="main_image">
						<img src="images/public_programs.jpg" width="555" height="277" />
					</div>
					<p class="intro">ArtCenter's <a href="http://www.artcenter.edu/accd/programs/public_programs.jsp" target="_accd">Public  Programs</a> offer a wide range of art and design courses for individuals  at every stage of their educational, professional or personal development.</p>
					<p>Headquartered at South Campus and holding classes at both  campuses, these programs feature a varied and evolving curriculum led by a  dedicated faculty of professional artists and designers&mdash;many of whom are Art  Center alumni themselves.</p>
					<p><a href="https://www.artcenter.edu/acn/" target="_acn"><strong>ArtCenter at Night</strong></a> (ACN), our continuing studies program, offers a wide range of  studio-based and academic classes taught by many of the same faculty who teach  in the College's degree programs.</p>
					<p><a href="https://www.artcenter.edu/teens/" target="_sat"><strong>ArtCenter for Teens</strong></a>, for  teens in grades 9 through 12, helps  students discover their creative voices and explore a rich art and design  curriculum in a college environment.</p>
					<p><a href="http://www.artcenter.edu/kids"><strong>ArtCenter for Kids</strong></a> nurtures creativity and fosters an understanding of the art and design process  in children in grades 4 through 8.</p>
					<p><a href="http://www.artcenter.edu/teachers/" target="_teacher"><strong>Summer Institute for  Teachers</strong></a> is an intensive, five-day workshop for K&#8211;12 educators based on a proven and award-winning methodology, Design-Based Learning, which helps students hone their natural creativity and develop higher-level thinking skills.</p>
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
