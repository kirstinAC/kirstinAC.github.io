<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.KidsFacultyPageHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_FacultyBios" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
<script type="text/javascript" src="js/faculty_bios.js"></script>
</head>
<body id="faculty_bios" class="about">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_FacultyBios" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_about.jsp" %>
				</ul>
				<div id="content">
					<dl id="faculty_list" class="leftColumn">
					
					<%
						List<List> resultList = pageHelper.getFacultyList();
						List[] facList = (List[]) resultList.toArray(new List[0]);

						String prev_lastname_first_char = "";

						for (int i = 0; i < facList.length; i++)
						{
							String[] facData = (String[]) facList[i].toArray(new String[0]);

							String key = facData[0];
							String firstname = facData[1];
							String lastname = facData[2];
							String middlename = facData[3];
							String displayname = facData[4];
							String desc = facData[5];
							String education = facData[6];
							String course = facData[7];

							String lastname_first_char = lastname.length() > 0 ? lastname.substring(0,1) : "";
							education = (education != null && education.length() > 0) ? "<h4>EDUCATION</h4><p>" + education + "</p>" : "";
							course = (course != null && course.length() > 0) ? "<h4>CLASSES</h4><p>" + course  + "</p>" : "";

							if (lastname_first_char.length() > 0 && !lastname_first_char.equals(prev_lastname_first_char))
							{
								out.println("<h2>"+ lastname_first_char + "</h2>");
							}

							out.println("<dt><a href=\"#" + key + "\">" + firstname + " " + lastname + "</a></dt>");
							out.println("<dd class=\"" + key + "\"><h3>" + firstname + " " + lastname + "</h3><p>" + desc + "</p><p>" + education + course + "</p></dd>");

							prev_lastname_first_char = lastname_first_char.length() > 0 ? lastname_first_char : "";

						}
					%>					
					
					</dl>
					<div id="faculty_content" class="rightColumn">
						<img src="images/faculty_bios.jpg" width="361" height="279" />
						<div id="background2"></div>
					</div>
				</div>
				<br class="clear_break" />
			</div>
		</div>
		<div id="background1"></div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
