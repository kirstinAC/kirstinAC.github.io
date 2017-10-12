<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>Public Programs | ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<body id="publicprograms" >
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content row">

		<%@ include file="/includes/nav_about.jsp" %>

		<div id="centercol" class="col">

		<h1>About Public Programs</h1>

			<p>In addition to ACN, ArtCenter offers the following Public Programs:</p>

			<h2>ArtCenter for Teens</h2>
			<p><a href="https://www.artcenter.edu/teens/" target="_blank">ArtCenter for Teens</a> gives high school students (grades 9&ndash;12) an opportunity to explore their creativity, learn about art and design disciplines and career opportunities, and study with a faculty that introduces them to professional practices and standards.</p>

			<h2>ArtCenter for Kids</h2>
			<p>In <a href="https://www.artcenter.edu/kids/" target="_blank">ArtCenter for Kids</a>, students in grades 4&ndash;8 spend Sunday afternoons engaged in art and design activities that develop creativity, innovation and visual literacy.</p>

			<h2>Summer Institute for Teachers</h2>
			<p>Led by experts in Design-Based Learning (DBL) education, <a href="http://www.artcenter.edu/teachers/" target="_blank">Summer Institute for Teachers</a> is a week-long workshop that teaches K&ndash;12 educators practical and effective design-based techniques and activities that they can use in their classrooms to improve student performance. </p>

		</div><!--end center column-->

		<div id="rightcol" class="col">

			<div id="featured" class="mblhide tblthide col">

				<h2>FEATURED CLASS</h2>
				<img src="images/classes/intro-to-surface-design.jpg" alt="Student Story">

				<div class="featcap">
				<h3><a href="class.jsp">Intro to Surface Design</a></h3>
				<p>Learn about  styles and techniques used in creating surface designs.</p>
				</div>

			</div>

		</div><!-- end right column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>