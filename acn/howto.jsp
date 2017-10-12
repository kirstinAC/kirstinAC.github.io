<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>How to Register | ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<body id="howto" >
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content howto row">

		<%@ include file="/includes/nav_register.jsp" %>

		<div id="centercol" class="col">

			<h1>How to Register</h1>

			<p>Prior to registration, if you have questions about your eligibility or course prerequisites, call 626.396.2319. It may be necessary to meet with, or submit samples of your artwork to an <a href="resources.jsp?active=0">ACN advisor</a>.</p>

			<p>Registration forms and course tuition must be received by the Friday preceding the start of the term.</p>

			<p>Your early registration reserves your seat in class and helps ensure your course selections meet required enrollment levels. Courses without the required minimum enrollment, as determined by the program director, will be cancelled one to three days before the first class meeting. Students enrolled in a cancelled course will be notified by an ACN staff member.</p>

			<p>Your space in class is not guaranteed until your registration has been received and processed. <span class="highlight">We highly recommend using our secure online registration process as the fastest way to register and pay for ArtCenter at Night classes.</span></p>

			<p>Late registration forms will be accepted the first week of the term for courses with available seats. They can be submitted online, in person at the <a href="contact.jsp">Public Programs office</a> or by fax with credit card payment.</p>

			<p><span class="highlight">Once the term begins, a non-refundable late registration fee of $50 per course will be charged. </span><span class="italic">Note: This does not apply to shorter workshops or for courses that begin later in the term.</span> </p>

			<p>A $10 fee will be charged for a first returned check. A $20 fee will be charged for any subsequent returned checks.</p>

			<h2>Priority Online Registration</h2>
			<p>For priority registration, 
			
				<% if (isSignIn) { %>
					<a class="fancybox" data-fancybox-type="iframe" href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesTokenUrl" /><jsp:getProperty name="resource" property="value" /><%= signInToken %>" onclick="javascript:window.open('coursepopup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));">register online</a>
				<% } else { %>
					<a class="fancybox" data-fancybox-type="iframe" href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" id="register_class_link" onclick="javascript:window.open('coursepopup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));">register online</a>
				<% } %>
			
			with a credit or debit card (Visa, Mastercard, American Express or Discover Card).</p>

			<p>Be sure to see our <a href="calendar.jsp">Calendar</a> for important course registration dates.</p>

			<ul id="inlinelist" class="inlineAccordionList">
				<li>
					<header>
						<h2 class="expandable">Registration for New Students</h2>
					</header>
					<div>
						<h4>Step 1:</h4>
						<p>To register for a class, select 
						
							<% if (isSignIn) { %>
								<a class="fancybox" data-fancybox-type="iframe" href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesTokenUrl" /><jsp:getProperty name="resource" property="value" /><%= signInToken %>" onclick="javascript:window.open('coursepopup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));">Register Now</a>
							<% } else { %>
								<a class="fancybox" data-fancybox-type="iframe" href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" id="register_class_link" onclick="javascript:window.open('coursepopup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));">Register Now</a>
							<% } %>
						
						and locate the course(s) in which you would like to enroll. Click on a specific course title to see the course description, prerequisite information and course tuition.&nbsp; A second window will open. To make your course selection, return to the main window and select the box next to a class title to add it to your shopping cart. </p>
						<p>After selecting your course(s), click &quot;submit&quot; to begin our secure registration process.<br />

						<h4>Step 2:</h4>
						<p>Create your ACN student account on the Personal Identification page.</p>
						<h4>Step 3:</h4>
						<p>Verify the courses you have selected and confirm your course schedule and tuition. Select &quot;register now/check out,&quot; &quot;method of payment,&quot; and finally, &quot;submit&quot; to complete your registration.</p>

						<h4>Step 4:</h4>
						<p>Your credit card will be processed immediately. If your credit card is declined, your registration has not been processed. Please contact your credit card company if you feel your card was declined in error.</p>

						<h4>Step 5:</h4>

						<p>Your ACN student login (username), password and registration information will be confirmed by email. Please save this information, as you will need it to check your class schedule, add or drop courses, check your grades or to request an unofficial transcript. To ensure your confirmation email is not blocked, add <a href="mailto:publicprograms@artcenter.edu">publicprograms@artcenter.edu</a> to your address book or contacts list.</p>
					</div>
				</li>

				<li>
					<header>
						<h2 class="expandable">Returning Students:</h2>
					</header>
					<div>
						<h4>Step 1:</h4>
						<p>Login using your ACN username and password. Please contact the South Campus Help Desk (626.396.2390 or <a href="mailto:helpdesk@artcenter.edu">helpdesk@artcenter.edu</a>) if you have forgotten your username and password.
						</p>
						<p>
						Be sure to see our <a href="calendar.jsp">Calendar</a> for important course registration dates.</p>

						<h4>Step 2:</h4>

						<p>To register for a class, go to 
						
							<% if (isSignIn) { %>
								<a class="fancybox" data-fancybox-type="iframe" href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesTokenUrl" /><jsp:getProperty name="resource" property="value" /><%= signInToken %>" onclick="javascript:window.open('coursepopup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));">Register Now</a>
							<% } else { %>
								<a class="fancybox" data-fancybox-type="iframe" href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" id="register_class_link" onclick="javascript:window.open('coursepopup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));">Register Now</a>
							<% } %>						
							
						and select the course(s) you would like to add to your shopping cart. Click on a specific course title to see the course description, prerequisite information and course tuition. A second window will open. To make your course selection, return to the main window and select the box next to a class title to add it to your shopping cart.</p>

						<p>After selecting your course(s), click &quot;submit&quot; to begin our secure registration process.<br />

						<h4>Step 3:</h4>

						<p>Verify the courses you have selected and confirm your course schedule and tuition. Select &quot;register now/check out,&quot; &quot;method of payment,&quot; and finally, &nbsp;&quot;submit&quot; to complete your registration. <br />

						<h4>Step 4:</h4>

						<p>Your credit card will be processed immediately. If your credit card is declined, your registration has not been processed. Please contact your credit card company if you feel your card was declined in error.<br />

						<h4>Step 5:</h4>

						<p>Your ACN registration will be confirmed by email.</p>
					</div>
				</li>
			</ul>

			<h2>Registering in Person</h2>

			<p>If you will be paying by check or money order, you must pay in person or by mail. Cash is not accepted.</p>

			<ul id="inlinelist" class="inlineAccordionList">
				<li>
					<header>
						<h2 class="expandable">Register in Person</h2>
					</header>
					<div>
						<p>Register in person at ArtCenter&rsquo;s <a href="contact.jsp">Public Programs office</a>. &nbsp;Be sure to bring your completed <a href="pdf/acn_regform.pdf" target="_blank">registration form</a> and tuition payment. Payments are only accepted during <a href="contact.jsp">office hours</a>.</p>

						<p><span class="italic">Please note: In-person registration forms received after 5:00 p.m. will be processed the next business day. Your space in class is not guaranteed until your registration has been processed.</span></p>

						<p>If you register in person, you will receive a registration confirmation letter by mail, along with an ACN student username and password. Please save this information, as you will need it to check your class schedule, add or drop courses, check your grades or to request an unofficial transcript.</p>

						<p>If your registration is received within a week of the start of the term, you may not receive your confirmation letter before classes begin. It is your responsibility to confirm your registration and class schedule with our office. You may pick up your confirmation letter in the Public Programs office during the first week of class.</p>
					</div>
				</li>
				<li>
					<header>
						<h2 class="expandable">Registering by Mail or Fax</h2>
					</header>
					<div>
						<p>Please fill out the <a href="pdf/acn_regform.pdf" target="_blank">registration form</a> and mail it, along with full course tuition payment (check, money order or credit card) to: </p>

						<p>ArtCenter at Night<br />
						P.O. Box 7197<br />
						Pasadena, CA 91109-7197</p>

						<p>Or, you may fax your registration to 626.396.4219. You must include your credit card information for payment if you register by fax.</p>

						<p>You will be mailed a registration confirmation letter, along with an ACN student username and password. Please save this information, as you will need it to check your class schedule, add or drop courses, check your grades or to request an unofficial transcript. </p>

						<p>If your registration is received within a week of the start of the term, you may not receive your confirmation letter before classes begin. It is your responsibility to confirm your registration and class schedule with our office. You may pick up your confirmation letter in the <a href="contact.jsp">Public Programs office</a> during the first week of class.</p>
					</div>
				</li>
			</ul>

			<h2>International Students</h2>

			<p>International students with a native language other than English must score a 173 on the computer-based Test of English as a Foreign Language (TOEFL) or 61 on the Internet-based TOEFL (iBT) before registering for ArtCenter at Night studio art classes.</p>

			<p>A score of 213 (CBT) or 80 (iBT) is required for Humanities and Sciences classes. A copy of your score report should accompany your registration form.</p>

			<p>Students with visas such as B-1 or B-2 should be aware their immigration status may be in jeopardy. The ArtCenter at Night program is unable to issue I-20s, nor are we able to advise students on any visa issues.</p>

		</div><!--end center column-->

		<div id="rightcol" class="col">

			<!--empty for now-->

		</div><!--right column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>