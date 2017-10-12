<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<style type="text/css">
@media screen and (min-width: 1000px) {
	#featured {
		height: 22.7em;
	}		
}
</style>

<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">

	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content index row">

		<div class="rotator mblhide">

			<div class="flexslider">
				  <ul class="slides">
						<li>
							<a href="gallery.jsp"><img src="images/rotator_gallery.jpg" /></a>
						</li>
						<li>
							<a href="http://www.artcenter.edu/accd/giving/donation.jsp" target="_blank"><img src="images/rotator_support.jpg" /></a>
						</li>
						<li>
							<a href="class.jsp" target="_new"><img src="images/rotator_featured_class.jpg" /></a>
						</li>
				  </ul>
			</div>

		</div>

		<aside class="sidebar mblhide">

			<div id="facebookfeed" class="col">

				<!-- <h2>What's <span class="new">NEW</span></h2> -->
                
                <div class="fb-page" data-href="https://www.facebook.com/ArtCenterAtNight/" data-tabs="timeline" data-width="232" data-height="230" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false"><blockquote cite="https://www.facebook.com/ArtCenterAtNight/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/ArtCenterAtNight/">ArtCenter at Night - ACN / ArtCenter College of Design</a></blockquote></div>

				

			</div>

			<div id="featured" class="col">

				<h2>FEATURED FACULTY</h2>
				<a href="featured-faculty.jsp"><img src="images/faculty/Jesse-Ellico.jpg" alt="Jesse Elico"></a>

				<div class="featcap">
				<h3>Jesse Ellico</h3>
					<p>&ldquo;I get to fly airplanes and blow things up. It&rsquo;s a little boy&rsquo;s dream.&rdquo;</p>
				</div>

			</div>

		</aside>

	</div>

	<div class="footernav col">

		<nav class="navtabs">

			<ul class="navtablist row">

				<li class="navtab mblshow"><div class="navwrap">
					<div class="contact"></div><h3><a href="contact.jsp">Contact</a></h3>
						<p>How to reach us. </p>
					</div>
				</li>
				<li class="navtab mblshow">
					<div class="navwrap"><div class="map"></div><h3><a href="https://maps.google.com/maps?q=950+s.+raymond+ave.+pasadena&oe=utf-8&client=firefox-a&channel=fflb&hnear=950+S+Raymond+Ave,+Pasadena,+California+91105&gl=us&t=h&z=16&iwloc=A" >Map</a></h3>
						<p>Get Directions. </p>
					</div>
				</li>

				<li class="navtab"><div class="navwrap">
					<div class="courses"></div><h3><a href="courses.jsp">Courses</a></h3> 
						<p>See what's currently being offered. </p>
					</div>
				</li>

				<li class="navtab"><div class="navwrap">
					<div class="catalog"></div><h3><a href="https://artcenter.hobsonsradius.com/ssc/iform/EC7B71zx67020x670c3N.ssc" target="_blank">Request a Catalog</a></h3>
						<p>Want a physical copy of our catalog? </p>
					</div>
				</li>

				<li class="navtab mblhide">
					<div class="navwrap"><div class="register"></div>
						<h3>
							<%@ include file="/includes/register_now.jsp" %>
						</h3>
						<p>What are you waiting for? </p>
					</div>
				</li>


				<li class="navtab">
					<div class="navwrap lastnav"><div class="gallery"></div><h3><a href="gallery.jsp">Student Gallery</a></h3>
						<p>Work by our incredible students. </p>
					</div>
				</li>

				<li class="navtab tblshow mblshow" style="background-color:white;">
					<div class="navwrap "><div class="evaluationkit"></div>
						<h3>
							<a href="https://acid.artcenter.edu/acid/login?service=https%3a%2f%2fartcenter.evaluationkit.com%2fMyEval%2fLoginCAS.aspx" target="_blank">Login to EvaluationKIT</a>
						</h3>
					</div>
				</li>

				<li class="navtab tblshow mblshow" style="background-color:white;">
					<div class="navwrap lastnav "><div class="evaluationkitapp"></div>
						<h3>
							<a href="pdf/EvaluationKIT_Training_Students_Using_the_Mobile_App.pdf" class="last" target="_blank">Instructions for EvaluationKIT App</a>
						</h3>
					</div>
				</li>
				
			</ul>

		</nav>

	</div><!--end footer nav-->

</div><!--end wrapper-->


<%@ include file="/includes/footer.jsp" %>


</body>
</html>
