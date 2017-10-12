<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%
	String width = request.getParameter("w"); 
	String height = request.getParameter("h");
	String movie = request.getParameter("v"); 
	String poster = request.getParameter("i"); 
	String type = request.getParameter("t"); 
	
	width = (width != null && width.length() > 0) ? width : "360";
	height = (height != null && height.length() > 0) ? height : "220";
	movie = (movie != null && movie.length() > 0) ? movie : "";
	poster = (poster != null && poster.length() > 0) ? poster : "";
	type = (type != null && type.length() > 0) ? type : "";

%>
<!DOCTYPE HTML>
<html lang="en" style="margin-left: auto; margin-right: auto; width: <%= width %>px; height: <%= height %>px;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Video Gallery</title>
<style type="text/css">
<!--
body {
	margin: 0px;
	padding: 0px;
}
-->
</style>

<link href="/acn/video/video-js-3.2.0.css" rel="stylesheet">
<script src="/acn/video/video-3.2.0.js"></script>
<script src="/acn/video/vimeo.js"></script>

<script>
  videojs.options.flash.swf = "/acn/video/video-js-3.2.0.swf"
</script>

</head>
<body bgcolor="#ffffff">

	<video id="acn_video_1" class="video-js vjs-default-skin" controls preload="auto" width="<%= width %>" height="<%= height %>"
		poster="<%= poster %>"   
		
		<% 	if (type.equalsIgnoreCase("vimeo"))	{ %>	
				
				data-setup='{"techOrder":["vimeo"]}' >
				<source src="<%= movie %>" 		type='video/vimeo' />
				
		<%  } else { %>

				>
				<source src="<%= movie %>.mp4" 	type='video/mp4' />
				<source src="<%= movie %>.webm" type='video/webm' />
				<source src="<%= movie %>.ogv" 	type='video/ogg' />
				<source src="<%= movie %>.flv" 	type='video/flv' />
				
		<%  } %>			
				
	</video>

</body>
</html>
