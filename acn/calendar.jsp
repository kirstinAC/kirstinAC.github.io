<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>Calendar | ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<body id="calendar" class="calendar">
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content row">

		<%@ include file="/includes/nav_explore.jsp" %>

		<div id="centercol" class="col">

		<h1>Calendar</h1>

		<ul id="inlinelist" class="inlineAccordionList">     	
			<li>
				<header>
					<h2 class="expandable">Fall 2017</h2>
				</header>
				<div>
					<h4 class="calheader">FALL REGISTRATION PERIOD</h4>
					<p class="calinfo">August 14 - September 8</p>
					<h4 class="calheader">SCHOLARSHIP DEADLINE</h4>
					<p class="calinfo">August 17</p>
					<h4 class="calheader">LABOR DAY - campus closed</h4>
					<p class="calinfo">September 4</p>
					<h4 class="calheader">FALL CLASSES BEGIN</h4>
					<p class="calinfo">September 11</p>
					<h4 class="calheader">LATE REGISTRATION STARTS<br/>(Additional $50 per course late fee applies)</h4>
					<p class="calinfo">September 11</p>
					<h4 class="calheader">LAST DAY TO ADD A CLASS</h4>
					<p class="calinfo">September 15</p>
					<h4 class="calheader">LAST DAY TO DROP A CLASS</h4>
					<p class="calinfo">October 27</p>
					<h4 class="calheader">VETERANS DAY - campus closed</h4>
                    <p class="calinfo">November 10                    </p>
                    <h4 class="calheader">THANKSGIVING DAY - campus closed</h4>
                    <p class="calinfo">November 23 - November 26                    </p>
                    <h4 class="calheader">SPRING REGISTRATION BEGINS</h4>
                    <p class="calinfo">November 27</p>
                    <h4 class="calheader">FALL EXPERIENCE ACN</h4>
                    <p class="calinfo">December 11, 12 + 13</p>
					<h4 class="calheader">FALL CLASSES END</h4>
					<p class="calinfo">December 16</p>
					<h4 class="calheader">SPRING CLASSES BEGIN</h4>
					<p class="calinfo">January 16, 2018</p>
				</div>
				<div>				</div>
			</li>	
			<li>
			<header>
				<h2 class="expandable">Spring 2018</h2>
			</header>
			<div>
				<h4 class="calheader">SPRING REGISTRATION PERIOD</h4>
				<p class="calinfo">November 27 - January 12</p>
				<h4 class="calheader">SCHOLARSHIP DEADLINE</h4>
				<p class="calinfo">November 30</p>
				<h4 class="calheader">WINTER BREAK - campus closed</h4>
				<p class="calinfo">December 22 - January 2</p>
				<h4 class="calheader">MARTIN LUTHER KING, JR. - campus closed</h4>
				<p class="calinfo">January 15</p>
				<h4 class="calheader">SPRING CLASSES BEGIN</h4>
				<p class="calinfo">January 16</p>
				<h4 class="calheader">LATE REGISTRATION STARTS<br/>(Additional $50 per course late fee applies)</h4>
				<p class="calinfo">January 16</p>
				<h4 class="calheader">LAST DAY TO ADD A CLASS</h4>
				<p class="calinfo">January 19</p>
				<h4 class="calheader">PRESIDENTS' DAY - Classes Meet as Scheduled</h4>
				<p class="calinfo">February 19</p>
                <h4 class="calheader">LAST DAY TO DROP A CLASS</h4>
				<p class="calinfo">March 2</p>
				<h4 class="calheader">SUMMER REGISTRATION BEGINS</h4>
                <p class="calinfo">April 9                    </p>
                <h4 class="calheader">SPRING EXPERIENCE ACN</h4>
                <p class="calinfo">APRIL 16, 17 + 18</p>
                <h4 class="calheader">SPRING CLASSES END</h4>
                <p class="calinfo">April 21</p>
                <h4 class="calheader">SUMMER CLASSES BEGIN</h4>
                <p class="calinfo">May 14</p>
				</div>
				<div></div>
            </li>
            <li>			
            	<header>
					<h2 class="expandable">Summer 2018</h2>
				</header>
				<div>
					<h4 class="calheader">SUMMER REGISTRATION PERIOD</h4>
					<p class="calinfo">April 9 -May 11</p>
					<h4 class="calheader">SCHOLARSHIP DEADLINE</h4>
					<p class="calinfo">April 12</p>
					<h4 class="calheader">SUMMER CLASSES BEGIN</h4>
					<p class="calinfo">May 14</p>
					<h4 class="calheader">LATE REGISTRATION STARTS<br/>(Additional $50 per course late fee applies)</h4>
					<p class="calinfo">May 14</p>
					<h4 class="calheader">LAST DAY TO ADD A CLASS</h4>
					<p class="calinfo">May 18</p>
					<h4 class="calheader">MEMORIAL DAY - Classes Meet as Scheduled</h4>
					<p class="calinfo">May 28</p>
                    <h4 class="calheader">LAST DAY TO DROP A CLASS</h4>
					<p class="calinfo">June 29</p>
					<h4 class="calheader">INDEPENDENCE DAY - campus closed</h4>
					<p class="calinfo">July 4</p>
					<h4 class="calheader">FALL REGISTRATION BEGINS</h4>
                    <p class="calinfo">August 13</p>
                    <h4 class="calheader">SUMMER EXPERIENCE ACN</h4>
                    <p class="calinfo">August 13, 14 + 15</p>
                    <h4 class="calheader">SUMMER CLASSES END</h4>
                    <p class="calinfo">August 18</p>
                    <h4 class="calheader">FALL CLASSES BEGIN</h4>
                    <p class="calinfo">September 10</p>
	
				</div>
				<div></div>
            </li>
		</ul>

		</div><!--end center column-->

		<div id="rightcol" class="col">

			<div class="col sidemenu">

				<h2>Current Dates</h2>

				<div class="featuredate">
				<h3>11.27</h3>
				<p class="event">SPRING REGISTRATION BEGINS</p>
				<p class="italic"></p>
				</div>

				<div class="featuredate">
				<h3>12.11 - 12.13</h3>
				<p class="event">EXPERIENCE ACN</p>
				<p class="italic"></p>
				</div>

				<div class="featuredate lastdate">
				<h3>01.16</h3>
				<p class="event">SPRING CLASSES BEGIN</p>
				<p class="italic"></p>
				</div>


			</div><!--end sidemenu right-->

		</div><!-- end right column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>
