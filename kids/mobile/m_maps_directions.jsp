<%-- Import the necessary Java classes --%>
<jsp:useBean id="mobileHtmlHelper" scope="page" class="com.clientviews.pagecontrol.KidsMobileHtmlPageHelper"/>
<%
 	String location = request.getParameter("l"); 
 	location = (location != null && location.length() > 0) ? location : ""; 

 	String direction = request.getParameter("d"); 
 	direction = (direction != null && direction.length() > 0) ? direction : ""; 

	String strURL = "http://" + request.getServerName() + "/kids/directions.jsp";
	mobileHtmlHelper.setContentPage(strURL);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./includes/head.jsp" %>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

<style type="text/css">
	.ui-body-c a.ui-link { color: #008595; font-weight: bold; text-decoration: none; }
	.hidden { display:none; }
</style>

<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=true">
</script>

<script type="text/javascript">
  var marker;
  var map;
  var geocoder;
  function initialize(divVariable, address) 
  {
  	geocoder = new google.maps.Geocoder();
    //var artcenter = new google.maps.LatLng(0, 0);
    var myOptions = {
    	zoom: 12,
      	//center: artcenter,
		panControl: true,
		zoomControl: true,
		scaleControl: true,
      	mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById(divVariable), myOptions);
  	codeAddress(address);
	//marker = new google.maps.Marker({
    //	map:map,
    //	draggable:true,
    //	animation: google.maps.Animation.DROP,
    //	position: artcenter
	//});
  	google.maps.event.addListener(marker, 'click', toggleBounce);
  }
  
  function codeAddress(address) {
    geocoder.geocode( { 'address': address }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        marker = new google.maps.Marker({
            map: map,
	    	draggable:true,
	    	animation: google.maps.Animation.DROP,
            position: results[0].geometry.location
        });
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }
  
  function toggleBounce() {
    if (marker.getAnimation() != null) {
		marker.setAnimation(null);
	} else {
		marker.setAnimation(google.maps.Animation.BOUNCE);
	}
  }  
</script>

<script type="text/javascript" src="/kids/mobile/js/jquery.ui.map.js"></script>
<script type="text/javascript" src="/kids/mobile/js/jquery.mobile-1.0a4.1/jquery.mobile-1.0a4.1.min.js"></script>
<script type="text/javascript" src="/kids/mobile/js/jquery.ui.map.js"></script>

</head>

<body class="home" onload="initialize('map_canvas', '<%= direction %>')">

<!-- Maps & Directions -->
<div data-role="page" id="gmap">
	<div data-role="header">
		<h1>Maps &amp; Directions</h1>
		<a href="#" data-rel="back" data-icon="back" data-role="button" data-direction="reverse" class="ui-btn-left">Back</a>
	</div><!-- /header -->

	<div data-role="content"> 
		<div class="ui-bar-c ui-corner-all ui-shadow" style="padding:1em;">
			<div id="map_canvas" style="height:200px;"></div>
		</div>
		
		<% 
			out.println(mobileHtmlHelper.getMobileContent("m_"+location, true)); 
		%>
		
		
	</div><!-- end content -->
</div><!-- end page -->

</body>
</html>