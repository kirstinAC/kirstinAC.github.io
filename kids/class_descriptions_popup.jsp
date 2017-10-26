<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.KidsCoursePageHelper"/>
<jsp:useBean id="generalHelper" scope="page" class="com.clientviews.pagecontrol.KidsGeneralPageHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_ClassDescriptions" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="class_descriptions" class="classes" style="background-color:#ffffff; background-image:none;">

<div id="wrapper" style="width:350px; margin-left:0px;">

	<div style="padding-top:0px; padding-left:10px; width:350px;">
	
		<div id="content_wrapper" style="width:350px; padding-left:10px;">
	
			<h1 style="margin-left:0px; margin-bottom: 20px; padding-bottom:0px; border-bottom:dotted 1px #3F9EFF;"><jsp:setProperty name="resource" property="key" value="PageTitle_ClassDescriptions" /><jsp:getProperty name="resource" property="value" /></h1>
	
			<div id="content" style="margin-left:10px;">

			<%
				
				String KIDS_CLASS_PREFIX = "KID";
				pageHelper.getCourseList(KIDS_CLASS_PREFIX, generalHelper.getCurrentTerm());
				List<List> resultList = pageHelper.getCourseAllList();
				List[] crsList = (List[]) resultList.toArray(new List[0]);

				for (int i = 0; i < crsList.length; i++)
				{
					String[] crsData = (String[]) crsList[i].toArray(new String[0]);

					String name = crsData[0];
					String title = crsData[1];
					String desc = crsData[2];
					String location = crsData[3];
					String weektime = crsData[4];
					String datetime = crsData[5];
					String creditprice = crsData[6];
					
					out.println("<h2 style=\"font-size:16px; margin-top: 16px;\">"+ title + "</h2>");
					out.println("<h3 class=\"expandNextContainer\" style=\"font-size:14px; margin-top:-2px; margin-bottom:10px;\">"+ name + "</h3>");
					out.println("<dd><p>"+ desc + "<br/><br/>" + location + weektime + datetime + creditprice + "</p></dd>");
				
				}
				
			%>		
					
			</div>
		</div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
