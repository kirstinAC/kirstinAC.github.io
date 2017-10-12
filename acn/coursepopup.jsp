<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.AcnCoursePageHelper"/>
<jsp:useBean id="generalHelper" scope="page" class="com.clientviews.pagecontrol.AcnGeneralPageHelper"/>
<%@ include file="/includes/bundles.jsp" %>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<body id="coursepopup">
	<div id="top-bar">
	</div><!--end topbar-->
	
<div id="wrapper">
	<header id="siteheader" class="row">
		<div id="branding" class="col">
			<h1><a href="#"><span class="hide">ArtCenter at Night</span></a></h1>
		</div>
	</header>

	<div class="main_content classes row">

		<aside class="sidebar">
			<br/><br/>
		</aside>
		
		<div id="centercol" class="col">

		<div class="columnwrap">
			
			<h1>Course Descriptions</h1>

                        <%
                           String url = "https://inside.artcenter.edu/api/courses?act=list_course_categories&trm=";
                            url = url + generalHelper.getCurrentTerm(-17);
                            URL destination = new URL(url);
                            URLConnection Api = destination.openConnection();
                            BufferedReader in = new BufferedReader(new InputStreamReader(Api.getInputStream()));

                            String inputLine;
                            String[] crs;
                        %>
                        
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
                                                out.println("<a href='/acn/coursedescriptions.jsp?cate=" + code + "' style='color: #42b7ff; font-size: 1.44em; line-height: 1.55em; text-decoration: none;'>" + category + "</a>");
                                                out.println("</li>");
                                        }
                                }
                                in.close();

			%>

			</ul><!--end courselist-->

			<p><br/></p>

		</div>

	</div><!--end column wrap-->

	</div><!--end center column-->

	<div id="rightcol" class="col">
	</div><!--right column-->

	</div><!--main content-->

</div><!--end wrapper-->

</body>
</html>

