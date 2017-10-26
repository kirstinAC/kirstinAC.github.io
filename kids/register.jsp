<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_HowToRegister" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="how_to_register" class="register">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_HowToRegister" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_register.jsp" %>
				</ul>
				<div id="content">
					<p class="intro">You may register and pay for classes up until the first day of classes. However, ArtCenter for Kids classes fill quickly, so we suggest you sign up early in the registration period to secure your spot in class. </p>
					<h2>Priority Online Registration</h2>
					<p>For priority  registration, 
					
					<% if (isSignIn) { %>
						<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesTokenUrl" /><jsp:getProperty name="resource" property="value" /><%= signInToken %>" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">register online</a>.
					<% } else { %>
						<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">register online</a>.
					<% } %>
					
					Online  registration can be used if you are paying your tuition with a credit or debit  card. </p>
					<h3 class="expandNextContainer"><a href="javascript:;">Registration for New Students</a></h3>
					<div>
						<p><strong>Step 1:</strong><br />
							To register for a class, select 

						<% if (isSignIn) { %>
							"<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesTokenUrl" /><jsp:getProperty name="resource" property="value" /><%= signInToken %>" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">Register for Classes</a>"
						<% } else { %>
							"<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">Register for Classes</a>"
						<% } %>

							and locate the class or classes in which you would like to enroll. Click the "select" box beside the class title to add it to your shopping cart.</p>
						<p>	Be sure to see our <a href="calendar.jsp">calendar</a> for important class registration dates.</p>
						<p> After selecting your class(es), click &quot;Submit&quot;  at the bottom of the page to begin our secure, priority online registration  process.</p>
						<p><strong>Step 2:</strong><br />
							Create an ArtCenter for Kids student account.</p>
						<p><strong>Step 3:</strong><br />
							Pay for your class(es). Verify the classes you have selected, and confirm your class  schedule and tuition. Select &quot;Register Now,&quot; &quot;Method of Payment,&quot;  then &quot;Submit&quot; to complete your registration. Visa, MasterCard,  Discover and American Express are accepted for online registration.</p>
						<p><strong>Step 4:</strong><br />
							Your credit card will be processed immediately.</p>
						<p><strong>Step 5:</strong><br />
							Your ArtCenter for Kids student login, password and registration information will  be confirmed by email.</p>
					</div>
					<h3 class="expandNextContainer">Returning Students</h3>
					<div>
						<p><strong>Step 1:</strong><br />
							Log in using your ArtCenter for Kids user name and password.</p>
						<p><strong>Step 2:</strong><br />
							To register for a class, select 

						<% if (isSignIn) { %>
							"<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesTokenUrl" /><jsp:getProperty name="resource" property="value" /><%= signInToken %>" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">Register for Classes</a>."
						<% } else { %>
							"<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">Register for Classes</a>."
						<% } %>

						<p>	Be sure to see our <a href="calendar.jsp">calendar</a> for important class registration dates.</p>
						<p> After selecting your class(es), click &quot;Submit&quot;  at the bottom of the page to begin our secure, priority online registration  process.</p>
						<p><strong>Step 3:</strong><br />
							Pay for your class(es). Verify the classes you have selected, and confirm your class  schedule and tuition. Select &quot;Register Now,&quot; &quot;Method of Payment,&quot; then &quot;Submit&quot; to complete your registration. Visa, MasterCard,  Discover and American Express are accepted for online registration.</p>
						<p><strong>Step 4:</strong><br />
							Your credit card will be processed immediately.</p>
						<p><strong>Step 5:</strong><br />
							Your ArtCenter for Kids student login, password and registration information will  be confirmed by email.</p>
					</div>
					<h2>Registering In Person or by Mail</h2>
					<p>If you will be  paying by check or money order, you must pay in person or by mail. Cash is not  accepted. </p>
					<p><strong>Registering In Person<br />
						</strong>Register in person at ArtCenter's Public  Programs office located at <a href="directions.jsp">South  Campus</a>.<em> </em>Be sure to bring your completed <a href="http://www.artcenter.edu/kids/pdf/KIDS_Reg_Form.pdf" target="_regform">registration form</a> and tuition payment. Payments are only accepted during <a href="contact.jsp">office  hours</a>.</p>
					<p><strong>Registering  By Mail<br />
						</strong>Payment by  mail must be in the form of personal or company check, money order or credit  card. </p>
					<p>Students paying by check or money  order must print out the <a href="http://www.artcenter.edu/kids/pdf/KIDS_Reg_Form.pdf" target="_regform">registration form</a><em> </em>and mail the completed form with payment  to: </p>
					<p>ArtCenter  College of Design<br />
					ArtCenter for Kids<br />
						P.O. Box 7197 <br />
						Pasadena, CA  91109-7197 </p>
					<p>Registration will be confirmed by mail. </p>
					<p>Please note: In person  or faxed registration forms received after 5 p.m. or on weekends will not be  processed until the following business day.  Your space in class is not guaranteed until your registration has been  processed. We recommend using our 
					
					<% if (isSignIn) { %>
						<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesTokenUrl" /><jsp:getProperty name="resource" property="value" /><%= signInToken %>" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="webadvisor">secure online registration process</a>
					<% } else { %>
						<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="webadvisor">secure online registration process</a>
					<% } %>					
					
					as the fastest way to register and pay for classes.</p>
					<p><strong>Registration Confirmation</strong><br />
						Online registration will be confirmed via email. In person, faxed or mailed registration will be confirmed by mail. If you have questions while completing  your registration, contact the Art Center for Kids office at 626.396.2319 or <a href="mailto:kids@artcenter.edu">kids@artcenter.edu</a>.</p>
						
					<p><strong>Late Registration</strong><br />
						Late registration is held on the first day of classes in Public Programs at the South Campus at 950 South Raymond Avenue in Pasadena from noon to 1 p.m.</p>
						
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
