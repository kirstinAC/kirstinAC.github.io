<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
<script type="text/javascript" src="js/stepcarousel.js"></script>
<script type="text/javascript" src="js/home.js"></script>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
</head>
<body id="home" class="home">
<div id="background">
	<div id="wrapper">

	<%@ include file="/includes/header.jsp" %>

		<h1><strong>Grades <br />4&#8211;8</strong> <br />Classes in Creativity, Innovation & <br />Visual Literacy</h1>
		<div id="content_bg">

			<%@ include file="/includes/nav.jsp" %>

			<div id="content_wrapper">

				<%@ include file="/includes/home_stepcarousel.jsp" %>

				<a href="calendar.jsp" id="calendar_headline">Spring 2018 Calendar</a>

				<dl id="calendar_list">
					<dt>
						<span class="day">29</span> 
						<span class="month">Jan</span>
					</dt>
					<dd>Spring registration begins</dd>
					<dt>
						<span class="day">01</span> 
						<span class="month">Feb</span>
					</dt>
					<dd>Deadline to apply for Spring scholarships</dd>
					<dt>
						<span class="day">25</span> 
						<span class="month">Feb</span>
					</dt>
					<dd>Spring classes begin</dd>	
					<dt>
						<span class="day">15</span> 
						<span class="month">APR</span>
					</dt>
					<dd>Spring classes end<br />
						<span>Open House<br/>
						3:30pm</span>
					</dd>				
				</dl>

				<ul id="home_specials">
					<li><a href="scholarships.jsp"><img src="images/homepage_specials/scholarships.jpg" width="240" height="145" />
						<h3>Apply for Scholarship</h3>
						</a></li>
					<li><a href="catalog.jsp"><img src="images/homepage_specials/catalog.jpg" width="240" height="145" />
						<h3>Request a Catalog</h3>
						</a></li>
					<li><a href="specialinvitation.jsp"><img src="images/homepage_specials/invitation.png" width="240" height="145" />
						<h3>Special Invitation to Parents</h3>
						</a></li>
				</ul>
				<!--<br class="clear_break" />-->
			<%@ include file="/includes/footer.jsp" %>
			</div>
		</div>
		<div id="background1"></div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
