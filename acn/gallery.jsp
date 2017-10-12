<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.AcnGeneralPageHelper"/>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>Gallery | ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<style type="text/css">
.fancybox-title-float-wrap {
    margin-bottom: -85px;
}    
.fancybox-title {
	font-family: "Apercu Mono Regular", Calibri, sans-serif;
}
.fancybox-nav {
	width: 5%;
	height: 95%;
}
</style>

<body id="gallery">
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content row">

	<div id="gallerywrap">

		<h1>Student Gallery</h1>

		<div class="galleryimages">
	
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
				String video = galleryData[7];
				String poster = galleryData[8];
				String type = galleryData[9];

				title = (title != null && title.length() > 0) ? title.toUpperCase() : "";
				image = (image != null && image.length() > 0) ? "/acn/images/gallery/" + image : "";
				poster = (poster != null && poster.length() > 0) ? "/acn/images/gallery/" + poster : image;
				video = (video != null && video.length() > 0) 
							? (type != null && type.length() > 0) 
								? video	: "/acn/movie/" + video 
										: "";

				if (video != null && video.length() > 0)
				{
		%>
					<a class="gallerybox fancybox.iframe" rel="gallery" data-fancybox-group="gallery" href="/acn/video/html5_video_gallery.jsp?w=<%= width %>&h=<%= height %>&v=<%= video %>&p=<%= poster %>&t=<%= type %>&k=video" title="<%= title %>">
						<img class="projectimage" src="<%= image %>" >
					</a>
					
		<% 		} else { 	%>
		
					<a class="gallerybox" rel="gallery" data-fancybox-group="gallery" href="images/gallery/<%= imageBig %>" title="<%= title %>">
						<img class="projectimage" src="<%= image %>" >
					</a>

		<%		}	
			}		
		%>
		

		</div><!--end galleryimages-->

	</div><!--end center column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>