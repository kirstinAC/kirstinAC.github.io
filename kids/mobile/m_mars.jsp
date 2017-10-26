<%-- Import the necessary Java classes --%>
<jsp:useBean id="mobileHtmlHelper" scope="page" class="com.clientviews.pagecontrol.KidsMobileHtmlPageHelper"/>
<%
	String strURL = "http://" + request.getServerName() + "/kids/mars.jsp";
	mobileHtmlHelper.setContentPage(strURL);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./includes/head.jsp" %>
<script type="text/javascript" src="/kids/mobile/js/jquery.myimgscale-0.2.min.js"></script>
</head>

 <script type="text/javascript">
 $(document).ready(function() { 
 	var divW = $("div.main_image").width();
	var imgW = $("img").width();

 	var divH = $("div.main_image").height();
	var imgH = $("img").height();
	
	var ratioX = divW / imgW;
	var ratioY = divH / imgH;

	var ratio = ratioX < ratioY ? ratioX : ratioY;
	
    var newWidth = parseInt(imgW * ratio, 10);
    var newHeight = parseInt(imgH * ratio, 10);

 	$("img").scaleImage({scale: "fit"});
 	
 	$("img").css({'margin-top': '0px', 'overflow': 'hidden'});
 	$("div.main_image").css({'height': newHeight});
});
</script>

<body class="home">

<div data-role="page" id="contact">
	<div data-role="header">
		<h1>Imagine Mars</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->
	<div data-role="content">
	<% 
		out.println(mobileHtmlHelper.getMobileContent("m_mars", true)); 
	%>

	</div><!-- /content -->
</div><!-- /page -->

</body>
</html>