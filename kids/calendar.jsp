<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_Calendar" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForKids" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="calendar" class="about">
<div id="background">
	<div id="wrapper">
		<%@ include file="/includes/header.jsp" %>
		<div id="content_bg">
			<%@ include file="/includes/nav.jsp" %>
			<div id="content_wrapper">
				<h1><jsp:setProperty name="resource" property="key" value="PageTitle_Calendar" /><jsp:getProperty name="resource" property="value" /></h1>
				<ul class="subnav">
					<%@ include file="/includes/nav_about.jsp" %>
				</ul>
				<div id="content">
				<ul class="calendar_list">
					<li class="first">
						<article class="m_spring">
						<h2>Spring  2018</h2>
							<dt>January 29</dt>
							<dd>Registration Period</dd>

							<dt>February 1</dt>
							<dd><strong>Deadline to apply for scholarships</strong></dd>

							<dt>February 25</dt>
							<dd><strong>Classes begin</strong></dd>

							<dt>April 1</dt>
							<dd>Holiday - No Classes</dd>								
							
							
							<dt>April 15</dt>
							<dd>Classes end</dd>
                            
                            <dt>April 15 3:30pm</dt>
							<dd>Open House</dd>  
						</article>	
					</li>	
					<li class="">
						<article class="m_fall">
						<h2>Summer 2018</h2>
							<dt>May 29</dt>
							<dd>Registration opens</dd>

							<dt>May 31</dt>
							<dd><strong>Deadline to apply for scholarships</strong></dd>

							<dt>June 24</dt>
							<dd><strong>Classes begin</strong></dd>
                            
                            <dt>June 25 - August 10</dt>
							<dd><strong>Summer Workshops</strong></dd>

							<dt>August 12</dt>
							<dd>Classes end</dd>

							<dt>August 12 3:30pm</dt>
							<dd>Open House</dd>
						</article>
					</li>				
					<li class="last">
						<article class="m_fall">
						<h2>Fall  2018</h2>
							<dt>September 24</dt>
							<dd>Registration Period</dd>

							<dt>September 27</dt>
							<dd><strong>Deadline to apply for scholarships</strong></dd>

							<dt>October 21</dt>
							<dd><strong>Classes begin</strong></dd>

							<dt>November 25</dt>
							<dd>Holiday - No Classes</dd>

							<dt>December 9</dt>
							<dd>Classes end</dd>

                            <dt>December 9 3:30pm</dt>
							<dd>Open House</dd>
						</article>
					</li>
				</ul>
				</div>
				<br class="clear_break" />
			</div>
		</div><div id="background1"></div>
		
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
