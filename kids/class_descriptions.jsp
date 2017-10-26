<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.KidsCoursePageHelper"/>
<jsp:useBean id="generalHelper" scope="page" class="com.clientviews.pagecontrol.KidsGeneralPageHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_ClassDescriptions" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="class_descriptions" class="classes">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_ClassDescriptions" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_classes.jsp" %>
				</ul>
				<div id="content">
				
					<p><b>The classes listed below are not necessarily offered every term. For current class schedules, or to register,  select 
						<% if (isSignIn) { %>
							<a href="/sat/includes/webadvisor.jsp?wa=SearchForClassesTokenUrl" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">Register for Classes</a>.
						<% } else { %>
							<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="search_for_classes webadvisor">Register for Classes</a>.
						<% } %>					
					</b></p>
					<p>Helpful hint: When you are ready to register, write down your class number(s) before selecting 
						<% if (isSignIn) { %>
							<a href="/sat/includes/webadvisor.jsp?wa=SearchForClassesTokenUrl" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">Register for Classes</a>.
						<% } else { %>
							<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="search_for_classes webadvisor">Register for Classes</a>.
						<% } %>					
					</p>
				
					<%
						String KIDS_CLASS_PREFIX = "KID";
						pageHelper.getCourseList(KIDS_CLASS_PREFIX, generalHelper.getCurrentTerm());
					%>
					<h3 class="expandNextContainer">SUNDAY CLASSES</h3>
					<div>
					<%
						List<List> sundayList = pageHelper.getCourseSundayList();
						List[] crsSundayList = (List[]) sundayList.toArray(new List[0]);

						for (int i = 0; i < crsSundayList.length; i++)
						{
							String[] crsData = (String[]) crsSundayList[i].toArray(new String[0]);

							String name = crsData[0];
							String title = crsData[1];
							String desc = crsData[2];
							String location = crsData[3];
							String weektime = crsData[4];
							String datetime = crsData[5];
							String creditprice = crsData[6];

							out.println("<h2>"+ title + "</h2>");
							out.println("<p>"+ name + "</p>");
							out.println("<p>"+ desc + "</p>");
							out.println("<p>"+ location + weektime + datetime + creditprice + "</p>");
						}
					%>
					</div>
					<h3 class="expandNextContainer">SUMMER WORKSHOPS</h3>
					<div>
					<%
						List<List> summerworkshopList = pageHelper.getCourseSummerWorkshopList();
						List[] crsSummerworkshopList = (List[]) summerworkshopList.toArray(new List[0]);

						for (int i = 0; i < crsSummerworkshopList.length; i++)
						{
							String[] crsData = (String[]) crsSummerworkshopList[i].toArray(new String[0]);

							String name = crsData[0];
							String title = crsData[1];
							String desc = crsData[2];
							String location = crsData[3];
							String weektime = crsData[4];
							String datetime = crsData[5];
							String creditprice = crsData[6];

							out.println("<h2>"+ title + "</h2>");
							out.println("<p>"+ name + "</p>");
							out.println("<p>"+ desc + "</p>");
							out.println("<p>"+ location + weektime + datetime + creditprice + "</p>");
						}
					%>		
					</div>
					<h3 class="expandNextContainer">FAMILY WORKSHOPS</h3>
					<div>
					
					<%
						List<List> familyworkshopList = pageHelper.getCourseFamilyWorkshopList();
						List[] crsFamilyworkshopList = (List[]) familyworkshopList.toArray(new List[0]);

						for (int i = 0; i < crsFamilyworkshopList.length; i++)
						{
							String[] crsData = (String[]) crsFamilyworkshopList[i].toArray(new String[0]);

							String name = crsData[0];
							String title = crsData[1];
							String desc = crsData[2];
							String location = crsData[3];
							String weektime = crsData[4];
							String datetime = crsData[5];
							String creditprice = crsData[6];

							out.println("<h2>"+ title + "</h2>");
							out.println("<p>"+ name + "</p>");
							out.println("<p>"+ desc + "</p>");
							out.println("<p>"+ location + weektime + datetime + creditprice + "</p>");
						}
					%>							
					
					</div>
					
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
