<!DOCTYPE html>
<html>
<head>
<%@ include file="./includes/head.jsp" %>
</head>

<body class="home">

<!-- Home -->
<div data-role="page" id="home">
	<h2 id="banner">Art Center For Kids Mobile</h2>
	<!--
	<div data-role="content">
		<ul data-role="listview" data-inset="true">
			<li><a href="m_calendar.jsp" rel="external"><img src="/kids/mobile/images/cal.jpg" alt="Calendar" class="ui-li-icon">Calendar</a></li>
			<li><a href="m_class.jsp" rel="external"><img src="/kids/mobile/images/class.jpg" alt="Classes" class="ui-li-icon">Classes</a></li> 
			<li><a href="m_faculty.jsp" rel="external"><img src="/kids/mobile/images/fac.jpg" alt="Faculty" class="ui-li-icon">Faculty</a></li>
			<li><a href="m_gallery.jsp" rel="external"><img src="/kids/mobile/images/gal.jpg" alt="Gallery" class="ui-li-icon">Gallery</a></li>
			<li><a href="m_maps.jsp" rel="external"><img src="/kids/mobile/images/map.jpg" alt="Maps" class="ui-li-icon">Maps &amp; Directions</a></li>
			<li><a href="m_contact.jsp" rel="external"><img src="/kids/mobile/images/contactus.png" alt="Contact" class="ui-li-icon">Contact Us</a></li>
		</ul>
	</div> --><!-- end content -->

	<!--
	<div class="ui-grid-a">
		<div class="ui-block-a"><a href="m_class.jsp" rel="external" data-role="button"><img src="/kids/mobile/images/class.jpg" alt="Classes" class="ui-li-icon">Classes</a></div>
		<div class="ui-block-b"><a href="m_calendar.jsp" rel="external" data-role="button"><img src="/kids/mobile/images/cal.jpg" alt="Calendar" class="ui-li-icon">Calendar</a></div>

		<div class="ui-block-a"><a href="m_faculty.jsp" rel="external" data-role="button"><img src="/kids/mobile/images/fac.jpg" alt="Faculty" class="ui-li-icon">Faculty</a></div>
		<div class="ui-block-b"><a href="m_maps.jsp" rel="external" data-role="button"><img src="/kids/mobile/images/map.jpg" alt="Maps" class="ui-li-icon">Directions</a></div>

		<div class="ui-block-a"><a href="m_gallery.jsp" rel="external" data-role="button"><img src="/kids/mobile/images/gal.jpg" alt="Gallery" class="ui-li-icon">Gallery</a></div>
		<div class="ui-block-b"><a href="m_contact.jsp" rel="external" data-role="button"><img src="/kids/mobile/images/contactus.png" alt="Contact" class="ui-li-icon">Contact Us</a></div>

	</div> --><!-- /grid-a -->	
	
	<br />
	<br />
	
	<div class="ui-grid-b">
		<div class="ui-block-a" align="center">
			<a href="m_calendar.jsp" rel="external"><img src="/kids/mobile/images/calendar2.png" alt="Calendar"><br/>Calendar</a>
		</div>
		<div class="ui-block-b" align="center">
			<a href="m_maps.jsp" rel="external"><img src="/kids/mobile/images/directions2.png" alt="Directions"><br/>Directions</a>
		</div>
		<div class="ui-block-c" align="center">
			<a href="m_contact.jsp" rel="external"><img src="/kids/mobile/images/contact2.png" alt="Contact"><br/>Contact</a>
		</div>
	</div><!-- /grid-b -->	
	
	<br />
	
	<div class="ui-grid-b">
		<div class="ui-block-a" align="center">
			<a href="m_class.jsp" rel="external"><img src="/kids/mobile/images/classes2.png" alt="Classes"><br/>Classes</a>
		</div>
		<div class="ui-block-b" align="center">
			<a href="m_faculty.jsp" rel="external"><img src="/kids/mobile/images/faculty2.png" alt="Faculty"><br/>Faculty</a>
		</div>
		<div class="ui-block-c" align="center">
			<a href="m_gallery.jsp" rel="external"><img src="/kids/mobile/images/gallery2.png" alt="Gallery"><br/>Gallery</a>
		</div>
	</div><!-- /grid-b -->	
	
	
	<!--
	<div class="ui-grid-a">
		<div class="ui-block-a">
			<ul data-role="listview" data-inset="true">
				<li><a href="m_class.jsp" rel="external"><img src="/kids/mobile/images/class.jpg" alt="Classes" class="ui-li-icon">Classes</a></li> 
				<li><a href="m_faculty.jsp" rel="external"><img src="/kids/mobile/images/fac.jpg" alt="Faculty" class="ui-li-icon">Faculty</a></li>
				<li><a href="m_gallery.jsp" rel="external"><img src="/kids/mobile/images/gal.jpg" alt="Gallery" class="ui-li-icon">Gallery</a></li>
			</ul>
		</div>
		<div class="ui-block-b">
			<ul data-role="listview" data-inset="true">
				<li><a href="m_calendar.jsp" rel="external"><img src="/kids/mobile/images/cal.jpg" alt="Calendar" class="ui-li-icon">Calendar</a></li>
				<li><a href="m_maps.jsp" rel="external"><img src="/kids/mobile/images/map.jpg" alt="Maps" class="ui-li-icon">Directions</a></li>
				<li><a href="m_contact.jsp" rel="external"><img src="/kids/mobile/images/contactus.png" alt="Contact" class="ui-li-icon">Contact</a></li>
			</ul>
		</div>
	</div> --><!-- /grid-a -->	
	
	<div data-role="content">
		<div align="center">
			<a href="/kids/index.jsp?view=full" rel="external" data-role="button"><img src="/kids/mobile/images/web.jpg" alt="Full Site" class="ui-li-icon">Full Site</a> 
		</div>			
	</div><!-- end content -->
	
	<div data-role="footer" class="nav-glyphish" data-position="fixed">
		<div data-role="navbar" class="nav-glyphish" data-grid="d">
		<ul>
			<li><a href="m_about.jsp" rel="external" id="n_mission" data-icon="custom" class="ui-btn-active ui-state-persist">About</a></li>
			<li><a href="mailto:kids@artcenter.edu" id="n_email" data-icon="custom">Email</a></li>
			<li><a href="m_openhouse.jsp" rel="external" id="n_open" data-icon="custom">Open</a></li>
			<li><a href="tel:16263962319" id="n_contact" data-icon="custom">Phone</a></li>
			<li><a href="m_mars.jsp" rel="external" id="n_mars" data-icon="custom">Mars</a></li>
		</ul>
		</div>
	</div>
	
</div><!-- end page -->


</body>
</html>