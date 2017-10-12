<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>Featured Faculty | ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<body id="featuredfaculty" >
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content row">

		<%@ include file="/includes/nav_explore.jsp" %>

		<div id="centercol" class="col">

			<div class="imagewrap" style="padding-bottom:2%;">
				<img src="images/faculty/Jesse-Ellico.jpg" title=" ">
			</div>
            
          <h1>Jesse Ellico</h1>
			<p>&ldquo;I get to fly airplanes and blow things up,&rdquo; says Jesse Ellico, an aerospace engineer for Orbital ATK, when asked to describe his job. &ldquo;It&rsquo;s a little boy&rsquo;s dream.&rdquo;</p>
			<p>The first thing Ellico tells students enrolled in his seven-week Introduction to Industrial Design Modeling workshop at ArtCenter at Night (ACN) is that they&rsquo;re &ldquo;going to make stuff and have fun.&rdquo;</p>
			<p>And indeed they do. In ArtCenter&rsquo;s Technical Skill Center, he familiarizes them with materials used to build models for industrial design presentations&mdash;styrene, urethane foam and polyester resin.</p>
			<p>He says he loves seeing the look of amazement on their faces when a modeling demonstration works, an amazement that partly stems from changes in the design world that have occurred due to the digital revolution.</p>
			<p>&ldquo;Many designers today enter the field without knowledge of how to make things,&rdquo; says Ellico. &ldquo;The question everyone asks is, Is that important?&rdquo;</p>
			
			<div class="imagewrap">
			  <p><img src="images/faculty/Jesse-Ellico-work.jpg"></p>
			</div>
		</div>
		<!--end center column-->

		<div id="rightcol" class="mblhide tblthide col">

				<div id="featured" class="col">

					<h2>STUDENT GALLERY</h2>
					<img src="images/gallery/58_Gallery-Large_DavidKnapp.jpg" alt="Student Gallery">

					<div class="featcap">
					<h3><a href="gallery.jsp">View Student Work</a></h3>
					<p>See a selection of work by our incredible students.</p>
					</div>

				</div>

		</div><!--right column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>