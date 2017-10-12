<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>	
</head>
<title>Faculty | ACN | ArtCenter at Night</title>
<body>
<%
	String url = "https://inside-dev.artcenter.edu/api/profile?act=facultyList&dept=ACN";
	URL destination = new URL(url);
	URLConnection Api = destination.openConnection();
	BufferedReader in = new BufferedReader(new InputStreamReader(Api.getInputStream()));
	
	String inputLine;

	while ((inputLine = in.readLine()) != null) 
	{
		out.println(inputLine);
	}
	
	in.close();

%>
</body>
</html>
