<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_Calendar" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="calendar" class="about <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">

<div id="wrapper">	
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>
	
	<ul id="subnav">
		<%@ include file="/includes/nav_about.jsp" %>
	</ul>

	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_Calendar" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="content_wrapper">
		<div id="content">
			
			<article class="m_spring">
			<h3 class="expandNextContainer">Spring 2018</h3>
			<div>
				<div class="panel">
					<p><span class="day">8</span> <span class="month">Jan</span></p>
					<h3>Registration Period</h3>
					<em>Registration Period:<br/>Jan 8 &#8211; Feb 2</em>
				</div>
				<div class="panel">
					<p><span class="day">11</span> <span class="month">Jan</span></p>
					<h3>Deadline to Apply for Scholarship</h3>
				</div>
				<div class="panel">
					<p><span class="day">3</span> <span class="month">Feb</span></p>
					<h3>Classes begin</h3>
					<em>Late Registration</em>
				</div>
                <div class="panel">
					<p><span class="day">9</span> <span class="month">Mar</span></p>
					<h3>Last Day to Drop Classes</h3>
				</div>
				<div class="panel">
					<p><span class="day">31</span> <span class="month">Mar</span></p>
					<h3>Holiday</h3>
					<em>No Classes</em>
				</div>	
				<div class="panel">
					<p><span class="day">14</span> <span class="month">Apr</span></p>
					<h3>Classes End</h3>
					<em>Open House</em>
				</div>			
			</div>
			</article>
			<br class="clear_break" />		
            <article class="m_summer">
			<h3 class="expandNextContainer">Summer 2018</h3>
			<div>
				<div class="panel">
					<p><span class="day">2</span> <span class="month">Apr</span></p>
					<h3>Registration Opens</h3>
					<em>Registration Period:<br/>Apr 2 &#8211; June 1</em>
				</div>     
				<div class="panel">
					<p><span class="day">5</span> <span class="month">Apr</span></p>
					<h3>Deadline to Apply for Scholarship</h3>
				</div>
				<div class="panel">
					<p><span class="day">2</span> <span class="month">June</span></p>
					<h3>Classes begin</h3>
					<em>Late Registration</em>
				</div>
				<div class="panel">
					<p><span class="day">25</span> <span class="month">June</span></p>
					<h3>Summer Workshops Begin</h3>
					<em>June 25 - August 10</em>
				</div>
				<div class="panel">
					<p><span class="day">6</span> <span class="month">July</span></p>
					<h3>Last Day to Drop Classes</h3>
				</div>
				<div class="panel">
					<p><span class="day">11</span> <span class="month">Aug</span></p>
					<h3>Classes End</h3>
					<em>Open House</em>
				</div>			
			</div>
			</article>
		
			<br class="clear_break" />		
			<article class="m_fall">
			<h3 class="expandNextContainer">Fall 2018</h3>
			<div>
				<div class="panel">
					<p><span class="day">27</span> <span class="month">Aug</span></p>
					<h3>Registration Opens</h3>
					<em>Registration Period:<br/>Aug 27 &#8211; Sept 28</em>
				</div>
				<div class="panel">
					<p><span class="day">30</span> <span class="month">Aug</span></p>
					<h3>Deadline to Apply for Scholarship</h3>
				</div>
				<div class="panel">
					<p><span class="day">29</span> <span class="month">Sept</span></p>
					<h3>Classes begin</h3>
					<em>Late Registration</em>
				</div>
   				<div class="panel">
					<p><span class="day">2</span> <span class="month">Nov</span></p>
					<h3>Last Day to Drop Classes</h3>
				</div>
				<div class="panel">
					<p><span class="day">24</span> <span class="month">Nov</span></p>
					<h3>Holiday</h3>
					<em>No Classes</em>
				</div>	
                
				<div class="panel">
					<p><span class="day">8</span> <span class="month">Dec</span></p>
					<h3>Classes End</h3>
					<em>Open House</em>
				</div>			
			</div>
			</article>        

		</div>
	</div>
</div>









<%@ include file="/includes/foot.jsp" %>
</body>
</html>



