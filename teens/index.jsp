<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
<script type="text/javascript" src="js/stepcarousel.js"></script>
<link href="css/stepcarousel.css" rel="stylesheet" type="text/css" />
</head>
<body id="home" class="<jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>

	<div id="content_wrapper">
		<a href="/teens/directorsletter.jsp">
			<h1>ArtCenter for Teens 
			offers courses in art and design for high school students 
			(grades 9 - 12)</h1>
		</a>
	</div>
	<%@ include file="/includes/stepcarousel_home.jsp" %>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
