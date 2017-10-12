<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<%@ page import="java.text.SimpleDateFormat" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.AcnCoursePageHelper"/>
<jsp:useBean id="generalHelper" scope="page" class="com.clientviews.pagecontrol.AcnGeneralPageHelper"/>
<%@ include file="/includes/bundles.jsp" %>
<%
 	String queryString = request.getParameter("query"); 
 	queryString = (queryString != null && queryString.length() > 0) ? queryString : ""; 
%>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>Course Descriptions | ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<body id="coursedescriptions">
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content classes row">

		<%@ include file="/includes/nav_explore.jsp" %>

		<div id="centercol" class="col">

		<div class="columnwrap">
			
			<h1>Course Descriptions</h1>

			<p><span class="highlight">The classes listed below are not necessarily offered every term. For current class schedules, or to register, select <%@ include file="/includes/register_now.jsp" %>.</span></p>
			<p>Helpful hint: When you are ready to register, write down your class number(s) before selecting <%@ include file="/includes/register_now.jsp" %>.</p>                         

			<div>
				<form name="coursesearch" method="post" action="/acn/coursedescriptions.jsp">
					<label>Keyword Search:</label>
					<input type="text" name="query" class="keywordinput" style="color: #42b7ff !important; border: 1px solid #ECECEC !important;" value="<%= queryString %>" onClick="this.value=''" />
					<input type="submit" value="Search" class="keyword" style="color: #42b7ff !important; border: 1px solid #ECECEC !important;" />
				</form>
			</div>
			<%
                           String url = "https://inside.artcenter.edu/api/courses?act=list_course_categories&trm=";
                            url = url + generalHelper.getCurrentTerm(-17);
                            URL destination = new URL(url);
                            URLConnection Api = destination.openConnection();
                            BufferedReader in = new BufferedReader(new InputStreamReader(Api.getInputStream()));

                            String inputLine;
                            String[] crs;
			%>

			<h2>Search by Category:</h2>
			<ul id="" class="">

			<%
                                while ((inputLine = in.readLine()) != null)
                                {
 
                                        crs = inputLine.split("#");
                                        for(String tmp : crs)
                                        {
						String code = tmp.substring(0, tmp.indexOf("|"));
						String category = tmp.substring(tmp.indexOf("|")+1);
                                                String[] data = tmp.split("|");
                                                out.println("<li style='border-bottom: 1px solid #3c3c41; margin-bottom: .5em; padding-bottom: .5em;'>");
                                                out.println("<a href='/acn/coursedescriptions.jsp?cate=" + code + "' style='color: #42b7ff; font-size: 1.4em; line-height: 1.55em; text-decoration: none;'>" + category + "</a>");
                                                out.println("</li>");
                                        }
                                }
                                in.close();
			%>


			</ul><!--end courselist-->

		</div>

	</div><!--end column wrap-->

	</div><!--end center column-->

	<div id="rightcol" class="col">
	</div><!--right column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>
