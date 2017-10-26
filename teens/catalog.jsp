<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_Catalog" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="catalog" class="classes <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">	
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>
	
	<ul id="subnav">
		<%@ include file="/includes/nav_classes.jsp" %>
	</ul>

	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_Catalog" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="content_wrapper">
		<div id="content">
		
			<p><a href="/teens/pdf/teen-catalog-2017-2018.pdf" target="newwindow"><img src="/images/teens_catalog_th.jpg" width="244" height="354" style="border:none;" alt="ArtCenter for Teens 2017-2018 Catalog" /></a>
			  <embed src="teen-catalog-2017-2018.pdf" width="32" height="32"></embed>
			</p>
			<jsp:setProperty name="resource" property="key" value="CatalogContentText" /><jsp:getProperty name="resource" property="value" />		
			
		</div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
