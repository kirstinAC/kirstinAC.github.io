<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<%@ page import="java.text.SimpleDateFormat" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.AcnCoursePageHelper"/>
<jsp:useBean id="generalHelper" scope="page" class="com.clientviews.pagecontrol.AcnGeneralPageHelper"/>
<%@ include file="/includes/bundles.jsp" %>
<%
 	String queryString = request.getParameter("cate"); 
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

			<%
                            String url = "https://inside.artcenter.edu/api/courses?act=list_courses_in_category&cate=" + queryString + "&trm=" + generalHelper.getCurrentTerm(-17);
                            URL destination = new URL(url);
                            URLConnection Api = destination.openConnection();
                            BufferedReader in = new BufferedReader(new InputStreamReader(Api.getInputStream()));

                            String inputLine;
                            String[] crs;

			%>
			<ul id="cours" class="">

			<%
                                HashMap<String,String> CYCLE_CODE = new HashMap<String, String>();
                                                CYCLE_CODE.put("ALL", "Fall, Spring and Summer");
                                                CYCLE_CODE.put("FASP", "Fall and Spring");
                                                CYCLE_CODE.put("SPSU", "Spring and Summer");
                                                CYCLE_CODE.put("FASU", "Fall and Summer");
                                                CYCLE_CODE.put("SP", "Spring");
                                                CYCLE_CODE.put("SU", "Summer");
                                                CYCLE_CODE.put("FA", "Fall");

                                while ((inputLine = in.readLine()) != null)
                                {
                                        crs = inputLine.split("#!#");
                                        for(String tmp : crs)
                                        {
                                                String[] data = tmp.split("#,#");
                                                out.println("<li><header>");
	                                        out.println("<h1>"+ data[0] + "</h1>");
        	                                out.println("<h2>"+ data[1] + "</h2>");
                	                        out.println("</header>");
                        	                out.println("<div>");
                                	        out.println("<p>"+ data[2] + "</p>");
				
						String units = (data[3].equals("0")) ? "Noncredit" : data[3].equals("1") ? data[3] + " unit" : data[3] + " units";
                              	        	out.println("<p>"+ units + "</p>");
						if(CYCLE_CODE.get(data[4]) != null)		
		              		        	out.println("<p><sup>&dagger;</sup>Class regularly offered in "+ CYCLE_CODE.get(data[4]) + "</p>");

                                    		out.println("</div></li>");
                                        }
                                }
                                in.close();
/**

				for (int i = 0; i < crsCourseList.length; i++)
				{
					String[] crsData = (String[]) crsCourseList[i].toArray(new String[0]);

					String name = crsData[0];
					String title = crsData[1];
					String desc = crsData[2];
					String location = crsData[3];
					String weektime = crsData[4];
					String datetime = crsData[5];
					String creditprice = crsData[6];
					String crs_code_desc = crsData[7];
					String cycle = crsData[8];

					if ((prev_code_desc.length() == 0) || !prev_code_desc.equals(crs_code_desc))
					{
						if (prev_code_desc.length() > 0)
						{
							out.println("</ul></li>");
						}
						out.println("<li>");
						out.println("<a href=\"#\">" + crs_code_desc + "</a>");
						out.println("<ul id=\"classsection\" class=\"subAccordionList\">");
					}


					out.println("<li><header>");
					out.println("<h1>"+ title + "</h1>");
					out.println("<h2>"+ name + "</h2>");
					out.println("</header>");
					out.println("<div>");
					out.println("<p>"+ desc + "</p>");
					out.println("<p>"+ location + weektime + datetime + creditprice + "</p>");
					out.println("<p>"+ cycle + "</p>");
					out.println("</div></li>");

			    	prev_code_desc = crs_code_desc;
**/
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
