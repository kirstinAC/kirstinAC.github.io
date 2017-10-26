<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_SpecialInvitationToParents" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="special_invite" class="register">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_SpecialInvitationToParents" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_register.jsp" %>
				</ul>
				<div id="content">
					<div class="main_image">
						<img src="images/special_invite.png" width="555" height="277" />
					</div>
					<p class="intro">An important part of ArtCenter for Kids is creating awareness of art and design's impact on the world around us.</p>
					<p>With this in mind, we invite parents to enroll in an ArtCenter for Kids class. When you enroll your child in an ArtCenter for Kids class, you may register yourself in a Kids class for free.</p>
					<p>Space is limited to one parent per class, and we ask that you attend every Sunday class during the seven-week class session. You cannot take the same class as your child. There is a non-refundable materials fee of $30 for all classes ($45 for <i>Photography</i> and <i>Photography Book Workshop</i>).</p>
					<p>To sign up for your parent’s ArtCenter for Kids class, complete the <a href="https://www.artcenter.edu/kids/pdf/KIDS_Reg_Form.pdf" target="newwindow">registration form</a> and fax it to our office at 626.396.4219. Parent reservations cannot be made online.</p>
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
