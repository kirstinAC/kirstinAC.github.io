<%@ page import="java.util.*" %>
<jsp:useBean id="resource" scope="page" class="com.clientviews.pagecontrol.TeensResourcePageHelper"/>
<jsp:useBean id="signin" scope="page" class="com.clientviews.pagecontrol.TeensSignInPageHelper"/>
<% resource.setResourceSession(session); %>
<%@ include file="/includes/global.jsp" %>

