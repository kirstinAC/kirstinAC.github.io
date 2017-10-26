<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_Catalog" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="catalog" class="classes">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_Catalog" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_classes.jsp" %>
				</ul>
				<div id="content">
					<div class="leftColumn">
						<p><a href="/pdf/artcenter-kids-2017-2018-catalog.pdf" target=newwindow>Download our most recent catalog in PDF format.</a></p> 
						<p><a href="https://artcenter.hobsonsradius.com/ssc/iform/EC7B71zx67020x670c3N.ssc" target="_catalog">Request a printed catalog.</a></p> 
					</div>
					<div class="rightColumn"><img src="/images/artcenter-kids-2017-2018-catalog-thumbnail" width="244" height="353" alt="ArtCenter For Kids Catalog 2017-2018" />
					  <form id="form1" name="form1" method="post" action="">
				      </form>
					</div>
				</div>
				<br class="clear_break" />
			</div>
		</div>
		<div id="background1"></div>
		<div id="background2"></div>
		<div id="background3"></div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
