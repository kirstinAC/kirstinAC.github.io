<%@ page import="java.util.*" %>
<jsp:useBean id="resource" scope="page" class="com.clientviews.pagecontrol.AcnResourcePageHelper"/>
<jsp:useBean id="signin" scope="page" class="com.clientviews.pagecontrol.AcnSignInPageHelper"/>
<% resource.setResourceSession(session); %>
<%@ include file="/includes/global.jsp" %>

