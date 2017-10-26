<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_Scholarships" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="scholarships" class="register">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_Scholarships" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_register.jsp" %>
				</ul>
				<div id="content">
					<div class="main_image">
						<img src="images/scholarships.jpg" width="555" height="277" />
					</div>
					<p class="intro">We believe that every child should have the opportunity to explore their love of art and design, regardless of financial means. To this end, scholarships are offered to those demonstrating need.</p>
					<h4>Scholarship Application Deadlines</h4>
					<p>	Fall 2017: September 28<br/>
						Spring 2018: February 1</p>
					<h4>To Apply for a Scholarship<br />
					</h4>
					<p>Complete the entire <a href="/kids/pdf/KIDS_Reg_Form.pdf" class="registration_form" target="_regform">registration form</a>, including the scholarship section.  Mail the completed form to:<strong></strong></p>
					<p>ArtCenter for Kids<br />
						ArtCenter College of Design<br />
						P.O. Box 7197<br />
						Pasadena, CA 91109-7197<br />
					ATTN: ArtCenter for Kids Scholarship</p>
					<h4>Scholarship Notification</h4>
					<p>Scholarship applicants will by notified of the scholarship  committee's decision by mail two weeks prior to  the start of the term. </p>
					
					<div id="support">
					<h4>Support for ArtCenter for Kids scholarships has been generously provided by:</h4>
					<p>Grace Ray Anderson<br />
						ArtCenter Partners<br />
						The Margaret A. Cargill Foundation<br />
						Collectors Foundation<br />
						The Green Foundation<br />
						Lowell Milken Family Foundation<br />
						The Kenneth T. and Eileen L. Norris Foundation<br />
						Wallis Foundation
					</p>
					<h4>General support for ArtCenter for Kids has been generously provided by the Margaret A. Cargill Foundation.</h4>
					</div>
				</div>
				<br class="clear_break" />
			</div>
		</div>
		<div id="background1"></div>
		<div id="background2"></div>
		<div id="background3"></div>
		<div id="background5"></div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
