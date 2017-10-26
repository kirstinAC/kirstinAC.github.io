<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.TeensCoursePageHelper"/>
<jsp:useBean id="generalHelper" scope="page" class="com.clientviews.pagecontrol.TeensGeneralPageHelper"/>
<jsp:useBean id="translateHelper" scope="page" class="com.clientviews.pagecontrol.TeensTranslatePageHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_ClassDescriptions" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>

<style media="screen" type="text/css">
      .layer1_class { position: absolute; z-index: 1; top: 10px; left: 10px; visibility: visible; }
      .layer2_class { position: absolute; z-index: 2; top: 10px; left: 10px; visibility: hidden }
</style>
<script>
  function downLoad(){
	if (document.all){
		document.all["layer1"].style.visibility="hidden";
		document.all["layer2"].style.visibility="visible";
	} else if (document.getElementById){
		node = document.getElementById("layer1").style.visibility='hidden';
		node = document.getElementById("layer2").style.visibility='visible';
	}
  }
</script>


<body  onload="downLoad()" id="class_descriptions_popup" class="classes <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">

<div id="layer1" class="layer1_class">
	<p><img src="images/ajax-loader.gif">&nbsp;&nbsp;<strong><em>Please wait while this page is loading...</em></strong></p>
</div>

<div id="layer2" class="layer2_class">

<div id="class_descriptions_popup_headline">
	<h1>&nbsp;</h1>
</div>

<div id="wrapper" style="width:400px;">

	<div style="padding-top:80px; padding-left:10px; width:400px;">
	
		<div id="content">
		
			<%
			
				translateHelper.setLocale(locale_string);

				String TEENS_CLASS_PREFIX = "HSD";
				pageHelper.getCourseList(TEENS_CLASS_PREFIX, generalHelper.getCurrentTerm(-14));
				List<List> resultList = pageHelper.getCourseAllList();
				List[] crsList = (List[]) resultList.toArray(new List[0]);

				for (int i = 0; i < crsList.length; i++)
				{
					String[] crsData = (String[]) crsList[i].toArray(new String[0]);

					String name = crsData[0];
					String title = crsData[1];
					String desc = (!isUs) ? translateHelper.Translate(crsData[2]) : crsData[2];
					String location = crsData[3];
					String weektime = crsData[4];
					String datetime = crsData[5];
					String creditprice = crsData[6];
					
					out.println("<h2>"+ title + "</h2>");
					out.println("<h3 class=\"expandNextContainer\" style=\"font-size:14px; margin-top:-10px; margin-bottom:10px;\">"+ name + "</h3>");
					out.println("<dd>"+ desc + "<br/><br/>" + location + weektime + datetime + creditprice + "</dd>");
					
				
				}
			%>
		
		
		</div>
	</div>
</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
