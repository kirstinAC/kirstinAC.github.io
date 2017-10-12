<%	if (isSignIn) { %>
		<a class="fancybox" data-fancybox-type="iframe" href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesTokenUrl" /><jsp:getProperty name="resource" property="value" /><%= signInToken %>" onclick="<%= cpopup %>">Register Now</a>
<%	} else { %>
		<a class="fancybox" data-fancybox-type="iframe" href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" id="register_class_link" onclick="<%= cpopup %>">Register Now</a>
<%	} %>
