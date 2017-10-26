<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.TeensFacultyPageHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_FacultyBios" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="faculty_bios" class="about <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">	
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>
	
	<ul id="subnav">
		<%@ include file="/includes/nav_about.jsp" %>
	</ul>

	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_FacultyBios" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="content_wrapper">
		<div id="content">
			<dl>
			
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
					education = (education != null && education.length() > 0) ? "<h2><span style=\"font-size:12px;\">EDUCATION</span></h2>" + education : "";
					course = (course != null && course.length() > 0) ? "<h2><span style=\"font-size:12px;\">CLASSES</span></h2>" + course : "";
					
					if (lastname_first_char.length() > 0 && !lastname_first_char.equals(prev_lastname_first_char))
					{
						out.println("<h2>"+ lastname_first_char + "</h2>");
					}
					
					out.println("<dt class=\"expandNextContainer\">"+ firstname + " " + lastname + "</dt>");
					out.println("<dd>"+ desc + "<p>" + education + course + "</p></dd>");
				
					
					prev_lastname_first_char = lastname_first_char.length() > 0 ? lastname_first_char : "";

				}
			%>
			
			</dl>		
			<br />
			<br />
		</div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
