<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="/includes/resources.jsp" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.TeensCoursePageHelper"/>
<jsp:useBean id="generalHelper" scope="page" class="com.clientviews.pagecontrol.TeensGeneralPageHelper"/>
<jsp:useBean id="translateHelper" scope="page" class="com.clientviews.pagecontrol.TeensTranslatePageHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_ClassDescriptions" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="class_descriptions" class="classes <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">	
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>
	
	<ul id="subnav">
		<%@ include file="/includes/nav_classes.jsp" %>
	</ul>

	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_ClassDescriptions" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="content_wrapper">
		<div id="content">

			<p><b>
				<jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText1" /><jsp:getProperty name="resource" property="value" />		

				<% if (isUs ) { %>
					<% if (isSignIn) { %>
						<a href="/teens/includes/webadvisor.jsp?wa=SearchForClassesTokenUrl" onclick="<%= cpopup %>" class="search_for_classes webadvisor"><jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText2" /><jsp:getProperty name="resource" property="value" /></a>.
					<% } else { %>
						<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="<%= cpopup %>" class="search_for_classes webadvisor"><jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText3" /><jsp:getProperty name="resource" property="value" /></a>.
					<% } %>					
				<% } else { %>					
					<jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText3" /><jsp:getProperty name="resource" property="value" />
				<% } %>					

			</b></p>
			<p>
			
				<jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText4" /><jsp:getProperty name="resource" property="value" />		
			
				<% if (isUs ) { %>
					<% if (isSignIn) { %>
						<a href="/teens/includes/webadvisor.jsp?wa=SearchForClassesTokenUrl" onclick="<%= cpopup %>" class="search_for_classes webadvisor"><jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText5" /><jsp:getProperty name="resource" property="value" /></a>.
					<% } else { %>
						<a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="<%= cpopup %>" class="search_for_classes webadvisor"><jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText6" /><jsp:getProperty name="resource" property="value" /></a>.
					<% } %>					
				<% } else { %>					
					<jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText3" /><jsp:getProperty name="resource" property="value" />
				<% } %>					
			</p>
		
		
			<h3 class="expandNextContainer"><jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText7" /><jsp:getProperty name="resource" property="value" /></h3>
			<div>
			<%
				translateHelper.setLocale(locale_string);

				String TEENS_CLASS_PREFIX = "HSD";
				pageHelper.getCourseList(TEENS_CLASS_PREFIX, generalHelper.getCurrentTerm(-14));
				
				List<List> weekdayList = pageHelper.getCourseWeekDayList();
				List[] crsWeekdayList = (List[]) weekdayList.toArray(new List[0]);

				for (int i = 0; i < crsWeekdayList.length; i++)
				{
					String[] crsData = (String[]) crsWeekdayList[i].toArray(new String[0]);

					String name = crsData[0];
					String title = crsData[1];
					String desc = (!isUs) ? translateHelper.Translate(crsData[2]) : crsData[2];
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
			<h3 class="expandNextContainer"><jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText8" /><jsp:getProperty name="resource" property="value" /></h3>		
			<div>
			<%
				List<List> weekendList = pageHelper.getCourseWeekEndList();
				List[] crsWeekendList = (List[]) weekendList.toArray(new List[0]);

				for (int i = 0; i < crsWeekendList.length; i++)
				{
					String[] crsData = (String[]) crsWeekendList[i].toArray(new String[0]);

					String name = crsData[0];
					String title = crsData[1];
					String desc = (!isUs) ? translateHelper.Translate(crsData[2]) : crsData[2];
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
			<h3 class="expandNextContainer"><jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText9" /><jsp:getProperty name="resource" property="value" /></h3>		
			<div>
			<%
				List<List> summerworkshopList = pageHelper.getCourseSummerWorkshopList();
				List[] crsSummerworkshopList = (List[]) summerworkshopList.toArray(new List[0]);

				for (int i = 0; i < crsSummerworkshopList.length; i++)
				{
					String[] crsData = (String[]) crsSummerworkshopList[i].toArray(new String[0]);

					String name = crsData[0];
					String title = crsData[1];
					String desc = (!isUs) ? translateHelper.Translate(crsData[2]) : crsData[2];
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
			<h3 class="expandNextContainer"><jsp:setProperty name="resource" property="key" value="ClassDescriptionsContentText10" /><jsp:getProperty name="resource" property="value" /></h3>		
			<div>
			<%
				List<List> summerintensiveList = pageHelper.getCourseSummerIntensiveList();
				List[] crsSummerintensiveList = (List[]) summerintensiveList.toArray(new List[0]);

				for (int i = 0; i < crsSummerintensiveList.length; i++)
				{
					String[] crsData = (String[]) crsSummerintensiveList[i].toArray(new String[0]);

					String name = crsData[0];
					String title = crsData[1];
					String desc = (!isUs) ? translateHelper.Translate(crsData[2]) : crsData[2];
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
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
