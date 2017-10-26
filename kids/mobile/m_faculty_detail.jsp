<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.KidsFacultyPageHelper"/>
<%
 	String id = request.getParameter("id"); 
 	id = (id != null && id.length() > 0) ? id : ""; 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Art Center for Kids Mobile</title>

<link rel="stylesheet" href="/kids/mobile/js/jquery.mobile-1.0a4.1/jquery.mobile-1.0a4.1.min.css" />

<link rel="stylesheet" type="text/css" href="/kids/css/styles.css" />
<link rel="stylesheet" type="text/css" href="/kids/mobile/css/main.css" />
<link rel="stylesheet" type="text/css" href="/kids/mobile/css/mobile.css"  />

<script type="text/javascript" src="/kids/mobile/js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="/kids/mobile/js/jquery.mobile-1.0a4.1/jquery.mobile-1.0a4.1.min.js"></script>

</head>


<body class="home">
<div data-role="page" id="detail">
	<div data-role="header">
		<h1>Faculty Detail</h1>
		<a href="/kids/mobile/m_index.jsp" data-icon="home" data-iconpos="notext" data-direction="reverse" class="ui-btn-right">Home</a>
	</div><!-- /header -->
	<div data-role="content">

	<%
		List<List> resultList = pageHelper.getFacultyList();
		List[] facList = (List[]) resultList.toArray(new List[0]);

		for (int i = 0; i < facList.length; i++)
		{
			String[] facData = (String[]) facList[i].toArray(new String[0]);

			String key = facData[0];
			
			if (key != null && key.length() > 0 && key.equals(id))
			{
				String firstname = facData[1];
				String lastname = facData[2];
				String middlename = facData[3];
				String displayname = facData[4];
				String desc = facData[5];
				String education = facData[6];
				String course = facData[7];
				
				education = (education != null && education.length() > 0) ? "<h4>EDUCATION</h4><p>" + education + "</p>" : "";
				course = (course != null && course.length() > 0) ? "<h4>CLASSES</h4><p>" + course  + "</p>" : "";
				
				out.println("<h2>" + firstname + " " + lastname + "</h2>");
				out.println("<p>" + desc + "</p><p>" + education + course + "</p>");
				
				break;				
			}
		}

	%>

	</div><!-- /content -->
</div><!-- /page -->


</body>
</html>