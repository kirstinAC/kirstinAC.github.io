
<li><a href="class_descriptions.jsp" class="class_descriptions">Class Descriptions</a></li>

<% if (isSignIn) { %>
	<li><a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesTokenUrl" /><jsp:getProperty name="resource" property="value" /><%= signInToken %>" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">Register for Classes</a></li>
<% } else { %>
	<li><div id="register_class_nav"><a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" onclick="javascript:window.open('class_descriptions_popup.jsp', 'wn_classdescription','width=460px,height=720px,toolbar=0,scrollbars=1,resizable=0,status=1,location=0,directories=0,menubar=0,screenY=100,screenX='+(window.screen.width - 480));" class="register_for_classes webadvisor">Register for Classes</a>
<% } %>

<li><a href="summerworkshops.jsp" class="summer_workshops">Summer Workshops</a></li>
<li><a href="familyworkshops.jsp" class="family_workshops">Family Workshops</a></li>
<li><a href="catalog.jsp" class="catalog">Catalog</a></li>