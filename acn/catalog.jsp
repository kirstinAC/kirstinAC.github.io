<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>Catalog | ART CENTER AT NIGHT</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<body id="viewcatalog" >
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content row">

		<%@ include file="/includes/nav_explore.jsp" %>

		<div id="centercol" class="col">

			<h1>Catalog</h1>

			<p><a href="pdf/acn_catalog.pdf" target="_blank">
				<img src="images/acn_catalog_th.jpg" width="244" height="354" style="border:none;" alt="Art Center at Night 2015-2016 Catalog" /></a></p>
				
			<p>In an effort to reduce waste and pursue a more sustainable approach, we only mail catalogs once a year to our mailing list.</p> 
			<p><a href="https://artcenter.hobsonsradius.com/ssc/iform/EC7B71zx67020x670c3N.ssc" target="_catalog">Request a Printed Catalog.</a></p> 

			</div><!--end center column-->

		</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>