<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.TeensGeneralPageHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_Gallery" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
<script type="text/javascript" src="js/gallery_init.js"></script>
<script type="text/javascript" src="js/rjcarousel.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript" src="js/jquery.mousewheel-3.0.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="css/rjcarousel.css" media="screen" />
<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
</head>
<body id="gallery" class="gallery <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>

	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_Gallery" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="rjcarousel_wrapper">
		<div id="rjcarousel_belt">
		<%
			List<List> resultList = pageHelper.getGallery(session);
			List[] galleryList = (List[]) resultList.toArray(new List[0]);

			for (int i = 0; i < galleryList.length; i++)
			{
				String[] galleryData = (String[]) galleryList[i].toArray(new String[0]);

				String xpos = galleryData[0];
				String ypos = galleryData[1];
				String image = galleryData[2];
				String imageBig = galleryData[3];
				String title = galleryData[4];
				String width = galleryData[5];
				String height = galleryData[6];
				
				title = (title != null && title.length() > 0) ? title.toUpperCase() : "";
		%>

			<div class="gallery_caption_wrapper" style="left:<%= xpos %>; top:<%= ypos %>;">
				<a href="images/gallery/<%= imageBig %>" rel="gallery" title="<%= title %>"><img src="images/gallery/<%= image %>" width="<%= width %>" height="<%= height %>" /></a></div>
		
		<%
			}
		%>
		
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$("#rjcarousel_wrapper a").fancybox({
				'titlePosition'	: 'inside',
				'overlayOpacity' : 0.7,
				'overlayColor' : '#000'
			});

		});
	</script>
	<div id="forward_button" class="rjcarousel_forward"></div>
	<div id="backward_button" class="rjcarousel_backward"></div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
