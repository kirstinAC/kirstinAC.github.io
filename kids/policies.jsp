<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_Policies" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="policies" class="register">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_Policies" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_register.jsp" %>
				</ul>
				<div id="content">
					<h4>Refund  Policy</h4>
					<p>A full refund will be given to students who  withdraw from ArtCenter for Kids via our website or by written notice before the start of the first class. <b>There are no refunds granted after the first day of classes.</b></p>
					<h4>Class Changes and Cancellations </h4>
					<p>ArtCenter reserves the right to cancel any class, limit  class size, change times or substitute instructors for those listed in the class  schedule as it deems necessary. Class cancellations will not be announced until  the end of the registration period. You will receive a full refund if the  College must cancel a class for which you have registered.</p>
                    <h4>Dismissal Policy</h4><p>At its sole discretion, ArtCenter for Kids reserves the right to dismiss or refuse enrollment to any student or anyone acting on behalf of the student whose conduct fails to comply with the policies, rules and standards of the College.</p>
                    <p><b>Student Code of Conduct</b><br />It is the intention of the Student Code of Conduct to clarify certain standards of behavior by students and by adults acting on their behalf that are essential to ArtCenter&#8217;s educational mission and its community life. Unacceptable behaviors include, but are not limited to, those described in this Code. Students <b><i>and adults acting on their behalf</i></b> are expected to comply with all laws and to respect the right and privileges of all other members of the ArtCenter community and its neighbors.<br />
                    <p><b>Prohibited Conduct</b><br />Prohibited conduct includes but is not limited to the following:                                        
                    <p><b>1.</b> Intentionally or recklessly causing physical or psychological harm to any ArtCenter community member, yourself or to any person on College premises or at College activities either on or off campus, or causing reasonable apprehension of such harm. This includes, without limitation: computer, telephone, social, racial and sexual harassment or assault; verbal or written threats; stalking; intimidation; and verbal and physical abuse or harassment.</p>
					<p><b>2.</b> Intentionally or recklessly interfering with normal College or College-sponsored activities, including but not limited to studying; teaching; research; College administration; judicial proceedings; or fire, police, or emergency services.</p>
					<p><b>3.</b> Failure to comply with the directions of College officials acting in performance of their duties, including but not limited to staff, faculty and Campus Security officers. This includes verbally threatening, abusing or harassing any of the above in the performance of his or her duties.</p>
					<p>Engaging in any of the above conduct may result in dismissal from the College or in the inability to participate in ArtCenter for Kids.</p>
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
