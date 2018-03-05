<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_SummerIntensives" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="summer_intensives" class="classes <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">	
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>
	
	<ul id="subnav">
		<%@ include file="/includes/nav_classes.jsp" %>
	</ul>

	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_SummerIntensives" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="content_wrapper">
		<div id="content">

			<h3>Summer Intensives<br>July 9 - August 3, 2018</h3> 
			<p>ArtCenter for Teens introduces a four-week intensive summer program for students seeking a rigorous in-depth experience in a chosen area of concentration. In addition to studio classes, weekly guest speakers (practicing artists and designers) will share their stories and career paths. Lectures about art and design will familiarize students with design history, cultural icons and design trends. The program will conclude with a final exhibition and celebration of student work open to friends, family and educators.</p> 
			<p>Classes meet weekdays at the South Campus from 9:00 am to 4:30 pm.</p> 
			<p><b>Areas of concentration:</b></p>
			<ul>
				<li>Graphic Design/Advertising</li>
				<li>Entertainment Design</li>
				<li>Industrial Design (Product &amp; Transportation Design)</li>
			</ul> 
			<p><b>Tuition:</b> $1,700.00</p> 
			<p>For information about travel to Los Angeles and ArtCenter and accommodations, visit <a href="travel.jsp">Travel Info</a>.</p> 
			<p>Please refer to <a href="policies.jsp">refund policy</a> for important deadlines.</p> <br> 
			<p><b><u>CLASS DESCRIPTIONS</u></b></p> 
			<p><b>BRANDCAMP</b><br> For students seeking an in-depth exposure to the advertising and graphic design industry, learn how to develop strong concepts that are the platform for a brand, while engaging in real-world design methodologies that empower you to execute your concepts to a high level of finish. You will develop your own strategic, graphic brand identity and a cross-media, integrated advertising campaign. </p> 
			<p>This unique, dynamic and fun learning environment offers you a diverse blend of creative and strategic thinking, exposure to design process and theory, presentation techniques, critiques and discussions. There will also be industry field trips and guest speakers from prominent ad agencies and design firms.</p> 
			<p>In addition to creating a strong portfolio piece and having an opportunity to acquire the skill set used in the industry, build your proficiency in concept development, research ability, design execution, presentation and collaboration. Estimated cost of materials: $50.00</p><br> 
			<p><b>ENTERTAINMENT DESIGN </b><br> Whether it's the production of a movie, animation, video game or theme park, entertainment concept design serves as an integral part in the creative process. Concept designers intrigue audiences by realizing immersive, impactful and often times never-before-seen visuals to life. It not only requires great imagination but also an understanding of how things are built and of how to communicate these ideas to the people who will build these new worlds. </p> 
			<p>Students will be introduced to Entertainment Design by learning all aspects of the design process, which includes designing and illustrating characters, environments, vehicles and props that the world has never seen before. Learn how to communicate through compelling drawings and expand your understanding of how things are built in 3-D. </p> 
			<p>Presentation skills will be emphasized. A laptop, Photoshop, and drawing tablet are recommended. Estimated cost of materials: $60.00</p><br> 
			<p><b>INDUSTRIAL DESIGN </b>(Product &amp; Transportation Design)<br> Have you ever wondered how an iPhone reaches the store shelves from an initial napkin sketch? Are you constantly amazed at how all of the parts of your dream car work so well together in three dimensions? Behind each of these creations lies the field of Industrial Design, the crossroads of form (shape), human factors (ergonomics) and an understanding of engineering/manufacturing.</p> 
			<p>Students will be introduced to Industrial Design through an intensive immersion into all aspects of the design process through lectures, in-class sketching, model-making and in-depth critique sessions. Presentation skills will be emphasized. Cross-disciplinary activities with the Graphics/Advertising and Entertainment students will enhance your experience by simulating working in a design consultancy.</p> 
			<p>A camera (point and shoot, DSLR, or a quality cellphone) will be required for documentation and composition exercises. A laptop or an iPad/tablet is recommended for research and presentations in class. Estimated cost of materials: $70.00</p><br>		

		</div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>
