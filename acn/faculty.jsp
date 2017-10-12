<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.AcnFacultyPageHelper"/>
<%@ include file="/includes/bundles.jsp" %>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>Faculty | ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<body id="faculty">
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content faculty row">

		<%@ include file="/includes/nav_explore.jsp" %>

		<div id="centercol" class="col">

				<h1>Faculty</h1>

				<p>ACN instructors are practicing artists and designers who know how to maintain a competitive edge. Many ACN instructors also teach in Art Center&#39;s degree programs. </p>

				<ul id="facultylist">

				<%
                    String url = "https://inside.artcenter.edu/api/profile?act=acnFaculty";
                    URL destination = new URL(url);
                    URLConnection Api = destination.openConnection();
                    BufferedReader in = new BufferedReader(new InputStreamReader(Api.getInputStream()));

                    String inputLine;
                    String[] fac;
                    
                    while ((inputLine = in.readLine()) != null)
                    {   
                        fac = inputLine.split("#");
                        
                        for(String tmp : fac)
                        {
                            String[] data = tmp.split("&");
                            out.println("<li><a href='http://www.artcenter.edu/about/get-to-know-artcenter/people/detail.html?accdID="+ data[0] +"'>"+ data[2] +", "+ data[1] +"</a></li>");
                        }

                    }

                    in.close();

				%>					

				</ul><!--end faculty list-->

		</div><!--end center column-->

		<div id="rightcol" class="col">

			<!--empty for now-->

			</div>

		</div><!--right column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>
