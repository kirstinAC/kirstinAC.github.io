<%@ page import="java.util.*" %>
<jsp:useBean id="resource" scope="page" class="com.clientviews.pagecontrol.KidsResourcePageHelper"/>
<jsp:useBean id="signin" scope="page" class="com.clientviews.pagecontrol.KidsSignInPageHelper"/>
<% resource.setResourceSession(session); %>
<%@ include file="/includes/global.jsp" %>

