<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_FamilyWorkshop" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="family_workshops" class="classes">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_FamilyWorkshop" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_classes.jsp" %>
				</ul>
				<div id="content">
					<p class="intro">Every term, Art Center for Kids offers a variety of one-day family workshops Sundays from 1 to 4 p.m. at South Campus. The cost, which includes all materials, is $30 per person. Children of all ages are welcome when accompanied by an adult.</p>
					<p>View descriptions of the types of workshops that we offer <a href="class_descriptions.jsp">here</a>. For current classes, meeting information and to register, select 
						<% if (isSignIn) { %>
							<a href="/sat/includes/webadvisor.jsp?wa=SearchForClassesTokenUrl" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">Register for Classes</a>.
						<% } else { %>
							<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="search_for_classes webadvisor">Register for Classes</a>.
						<% } %>					
					</p>
					<p>Helpful hint: When you are ready to register, write down your class number(s) before selecting Register for Classes. Please note that a separate online or printed registration form must be submitted for each family member. </p>
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
