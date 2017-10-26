<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/resources.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/includes/metatag.jsp" %>
<title><jsp:setProperty name="resource" property="key" value="PageTitle_AccountRegister" /><jsp:getProperty name="resource" property="value" /> | <jsp:setProperty name="resource" property="key" value="PageTitle_ArtCenterForTeens" /><jsp:getProperty name="resource" property="value" /></title>
<%@ include file="/includes/head.jsp" %>
</head>
<body id="myaccount" class="account <jsp:setProperty name="resource" property="key" value="BodyClass" /><jsp:getProperty name="resource" property="value" />">
<div id="wrapper">	
	<%@ include file="/includes/header.jsp" %>
	<%@ include file="/includes/sidebar.jsp" %>
	<%@ include file="/includes/buttons_home.jsp" %>

	<div id="headline">
		<h1><jsp:setProperty name="resource" property="key" value="PageTitle_AccountRegister" /><jsp:getProperty name="resource" property="value" /></h1>
	</div>
	<div id="content_wrapper">
		<div id="content">
			<h2><jsp:setProperty name="resource" property="key" value="TopNavMyAccount" /><jsp:getProperty name="resource" property="value" /> / <jsp:setProperty name="resource" property="key" value="ClassesNavRegisterForClasses" /><jsp:getProperty name="resource" property="value" /></h2>

			<p>La versión española de este sitio es sólo para ofrecer información general. Todas las clases de ArtCenter for Teens se imparten en Inglés, y los estudiantes deben tener una comprensión adecuada de éste idioma antes de matricularse.</p>
			<p>Para pagar en línea por una clase, utiliza la versión de la página web en Inglés, accesible pulsando "ENGLISH" en la esquina superior izquierda de esta página. A continuación, selecciona "REGISTER FOR CLASSES" para elegir tu clase.</p>
			<br/>
			<h3>The Spanish version of this website is to be used for general information only. All ArtCenter for Teens classes are taught in English, and students should have adequate understanding of English before enrolling.</h3>
			<h3>To pay for a class online, you must use the English version of the website, accesible by clicking "ENGLISH" in the upper left corner of this page. Then select "REGISTER FOR CLASSES" to choose your class.</h3>
		</div>
	</div>
</div>
<%@ include file="/includes/foot.jsp" %>
</body>
</html>