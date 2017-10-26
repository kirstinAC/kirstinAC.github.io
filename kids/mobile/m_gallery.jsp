<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.KidsGeneralPageHelper"/>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./includes/head.jsp" %>

<link rel="stylesheet" type="text/css" href="/kids/mobile/css/photoswipe.css" />

	<style type="text/css">
		div.gallery-row:after { clear: both; content: "."; display: block; height: 0; visibility: hidden; }
		div.gallery-item { float: left; }
		div.gallery-item a { display: block; margin: 5px; }
		div.gallery-item img { display: block; width: 100%; height: auto; }
		#gallery .ui-content { overflow: hidden; }
	</style>
	
<script type="text/javascript" src="/kids/mobile/js/simple-inheritance.min.js"></script>
<script type="text/javascript" src="/kids/mobile/js/jquery.animate-enhanced.min.js"></script>
<script type="text/javascript" src="/kids/mobile/js/code-photoswipe-jQuery-1.0.12.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#gallery a").photoSwipe();
		});
	</script>

</head>

<body class="home">

<div data-role="page" id="gallery" class="gallery-page">

	<div data-role="header">
		<h1>Student Gallery</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div>

	<div data-role="content">	
		
		<div class="gallery">
	
			<div class="gallery-row">
		
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
					
					out.println("<div class=\"gallery-item\"><a href=\"/kids/images/gallery/" + imageBig + "\" rel=\"external\"><img src=\"/kids/images/gallery/" + image + "\" alt=\"" + title + "\" /></a></div>");
					
				}
					
			%>
		
			</div>
		
		</div><!-- /gallery -->
		
	</div><!-- /content -->
</div><!-- /page -->


</body>
</html>
