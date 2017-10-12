<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<body id="googlesearch" >
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content search row">

		<aside class="sidebar">

			<div id="sidemenu" class="col">

			</div>

		</aside>

	<div id="centercol" class="col">

 		<h1>Search Results</h1>


<%		
	String p = request.getParameter("access");
	String q = request.getParameter("q");
	String qstr = request.getParameter("searchquery");

	//qstr = (q != null && q.length() > 0) ? q : qstr;	

	q = (q != null) ? q.trim() : "";
	q = (q != null && q.length() > 0) ? q : qstr;
	q = q.replaceAll(" ", "%20");

	String url = (qstr != null && qstr.length() > 0 && p != null && p.length() > 0) 
					? "http://google.artcenter.edu/search?" + qstr
					: "http://google.artcenter.edu/search?q=" + q + "&site=acn&client=acn_frontend&proxystylesheet=acn_frontend&output=xml_no_dtd&filter=1&proxyreload=1";
	
	url = (url.indexOf("&site=") < 0) ? url + "&site=acn" : url;
	url = (url.indexOf("&client=") < 0) ? url + "&client=acn_frontend" : url;

	URL google = new URL(url);
	
    URLConnection g = google.openConnection();
	BufferedReader in = new BufferedReader(new InputStreamReader(g.getInputStream()));
	
	String inputLine;

	while ((inputLine = in.readLine()) != null) 
	{
		String outLine = inputLine.replaceAll("href=\"search", "href=\"search.jsp");
		outLine = outLine.replaceAll("#e5ecf9", "#d5f3f4");
		outLine = outLine.replaceAll("ACN Search", "<span style=\"font-size:0.8em;\">ACN Search&nbsp;</span>");
		
		out.println(outLine);
		
	}
	
	in.close();
	
%>

	</div><!--end center column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>