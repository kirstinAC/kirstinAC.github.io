<%-- Import the necessary Java classes --%>
<jsp:useBean id="mobileHtmlHelper" scope="page" class="com.clientviews.pagecontrol.KidsMobileHtmlPageHelper"/>
<%
	String strURL = "http://" + request.getServerName() + "/kids/directions.jsp";
	mobileHtmlHelper.setContentPage(strURL);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./includes/head.jsp" %>
</head>

<body class="home">

<!-- Maps & Directions -->
<div data-role="page" id="maps">
	<div data-role="header">
		<h1>Maps &amp; Directions</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- end header -->
	
	<div data-role="content">
		<ul data-role="listview" data-inset="true">
			<li><a href="m_maps_directions.jsp?l=South&d=950+South+Raymond+Avenue,+Pasadena,+CA+91105"  rel="external">South Campus</a></li>
			<li><a href="m_maps_directions.jsp?l=Hillside&d=1700+Lida+St,+Pasadena,+Los+Angeles,+California+91103" rel="external">Hillside Campus</a></li>
		</ul>
	
		<% 
			out.println(mobileHtmlHelper.getMobileContent("m_directions", true)); 
		%>
	
	</div><!-- end content -->
</div><!-- end page -->

</body>
</html>