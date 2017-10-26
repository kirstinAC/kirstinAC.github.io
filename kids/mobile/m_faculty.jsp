<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.KidsFacultyPageHelper"/>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./includes/head.jsp" %>
</head>

<body class="home">

<div data-role="page" id="faculty">

	<div data-role="header">
		<h1>Faculty</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->

	<div data-role="content">
		<ul data-role="listview" data-filter="true" data-filter-placeholder="Search faculty..." data-filter-theme="b">
		
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

					String lastname_first_char = lastname.length() > 0 ? lastname.substring(0,1) : "";

					if (lastname_first_char.length() > 0 && !lastname_first_char.equals(prev_lastname_first_char))
					{
						out.println("<li data-role=\"list-divider\">"+ lastname_first_char + "</li>");
					}

					out.println("<li><a href=\"#fac-" + key + "\" data-transition=\"flip\">" + firstname + " " + lastname + "</a></li>");

					prev_lastname_first_char = lastname_first_char.length() > 0 ? lastname_first_char : "";

				}
			%>					
							
		</ul>
	</div><!-- /content -->

</div><!-- /page -->

<%
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

			education = (education != null && education.length() > 0) ? "<h4>EDUCATION</h4><p>" + education + "</p>" : "";
			course = (course != null && course.length() > 0) ? "<h4>CLASSES</h4><p>" + course  + "</p>" : "";

			out.println("<div data-role=\"page\" id=\"fac-" + key + "\">");
			
			out.println("<div data-role=\"header\">");
			out.println("<h1>Faculty Detail</h1>");
			out.println("</div><!-- /header -->");
			out.println("<div data-role=\"content\">");
			out.println("<h2>" + firstname + " " + lastname + "</h2>");
			out.println("<p>" + desc + "</p><p>" + education + course + "</p>");
			out.println("</div><!-- /content -->");
			out.println("</div><!-- /page -->");

				
		}

%>

</body>
</html>