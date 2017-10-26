<%-- Import the necessary Java classes --%>
<jsp:useBean id="mobileHtmlHelper" scope="page" class="com.clientviews.pagecontrol.KidsMobileHtmlPageHelper"/>
<jsp:useBean id="generalHelper" scope="page" class="com.clientviews.pagecontrol.KidsGeneralPageHelper"/>
<%
	String strURL = "http://" + request.getServerName() + "/kids/calendar.jsp";
	String term = generalHelper.getCurrentTerm().substring(3).toUpperCase();

	mobileHtmlHelper.setContentPage(strURL);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./includes/head.jsp" %>
</head>

<body class="home">

<div data-role="page" id="calendar">
	<div data-role="header">
		<h1>Calendar</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->
	<div data-role="content">
		<ul data-role="listview"> 
		
<%
		String[] termCode = {"SP", "SU", "FA"};
		String[] termLoop = {"Spring", "Summer", "Fall", "Spring", "Summer"};
	
		int startTerm = 0;
		
		for (int i = 0; i < 3; i++)
		{
			if (term.equals(termCode[i]))
			{
				startTerm = i;
				break;
			}
		}
		for (int j = startTerm; j < (startTerm+3) && j < termLoop.length; j++)
		{
			out.println("<li><a href=\"#" + termLoop[j].toLowerCase() + "\" data-transition=\"slide\">" + termLoop[j] + "</a></li>");
		}
%>
		</ul>

	</div><!-- /content -->
</div><!-- /page -->


<div data-role="page" id="spring">
	<div data-role="header">
		<h1>Spring Calendar</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->
	<div data-role="content">

	<% 
		out.println(mobileHtmlHelper.getMobileContent("m_spring")); 
	%>

	</div><!-- /content -->
</div><!-- /page -->

<div data-role="page" id="summer">
	<div data-role="header">
		<h1>Summer Calendar</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->
	<div data-role="content">

	<% 
		out.println(mobileHtmlHelper.getMobileContent("m_summer")); 
	%>

	</div><!-- /content -->
</div><!-- /page -->

<div data-role="page" id="fall">
	<div data-role="header">
		<h1>Fall Calendar</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->
	<div data-role="content">

	<% 
		out.println(mobileHtmlHelper.getMobileContent("m_fall")); 
	%>

	</div><!-- /content -->
</div><!-- /page -->

</body>
</html>