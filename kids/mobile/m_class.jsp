<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.KidsCoursePageHelper"/>
<jsp:useBean id="generalHelper" scope="page" class="com.clientviews.pagecontrol.KidsGeneralPageHelper"/>

<%
	String KIDS_CLASS_PREFIX = "KID";
	pageHelper.getCourseList(KIDS_CLASS_PREFIX, generalHelper.getCurrentTerm());
%>	

<!DOCTYPE html>
<html>
<head>
<%@ include file="./includes/head.jsp" %>
</head>

<body class="home">

<div data-role="page" id="class">

	<div data-role="header">
		<h1>Class Descriptions</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->

	<div data-role="content">
		<ul data-role="listview"> 
			<li><a href="#sunday" data-transition="flip">Sunday Classes</a></li>
			<li><a href="#summer" data-transition="flip">Summer Workshops</a></li>
			<li><a href="#family" data-transition="flip">Family Workshops</a></li>
		</ul>
	</div><!-- /content -->

</div><!-- /page -->

<div data-role="page" id="sunday">
	<div data-role="header">
		<h1>Sunday Classes</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->
	<div data-role="content">

		<div data-role="collapsible-set">

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

				out.println("<div data-role=\"collapsible\" data-collapsed=\true\">");
				out.println("<h3>"+ title + "</h3>");
				out.println("<p>"+ name + "</p>");
				out.println("<p>"+ desc + "</p>");
				out.println("<p>"+ location + weektime + datetime + creditprice + "</p>");
				out.println("</div>");
			}
		%>

		</div>
		
	</div><!-- /content -->
</div><!-- /page -->

<div data-role="page" id="summer">
	<div data-role="header">
		<h1>Summer Workshops</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->
	<div data-role="content">

		<div data-role="collapsible-set">

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

				out.println("<div data-role=\"collapsible\" data-collapsed=\true\">");
				out.println("<h3>"+ title + "</h3>");
				out.println("<p>"+ name + "</p>");
				out.println("<p>"+ desc + "</p>");
				out.println("<p>"+ location + weektime + datetime + creditprice + "</p>");
				out.println("</div>");
			}
		%>

		</div>
		
	</div><!-- /content -->
</div><!-- /page -->

<div data-role="page" id="family">
	<div data-role="header">
		<h1>Family Workshops</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->
	<div data-role="content">

		<div data-role="collapsible-set">

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

				out.println("<div data-role=\"collapsible\" data-collapsed=\true\">");
				out.println("<h3>"+ title + "</h3>");
				out.println("<p>"+ name + "</p>");
				out.println("<p>"+ desc + "</p>");
				out.println("<p>"+ location + weektime + datetime + creditprice + "</p>");
				out.println("</div>");
			}
		%>

		</div>
		
	</div><!-- /content -->
</div><!-- /page -->


</body>
</html>