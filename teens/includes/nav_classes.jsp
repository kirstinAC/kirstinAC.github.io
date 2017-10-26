<li><a href="classdescriptions.jsp" class="class_descriptions">
		<jsp:setProperty name="resource" property="key" value="ClassesNavBrowseClasses" /><jsp:getProperty name="resource" property="value" />
	</a>
</li>

<% 	if (isUs) {
		if (isSignIn) { %>
			<li><a href="/teens/includes/webadvisor.jsp?wa=SearchForClassesTokenUrl" onclick="<%= cpopup %>" class="search_for_classes webadvisor"><jsp:setProperty name="resource" property="key" value="ClassesNavRegisterForClasses" /><jsp:getProperty name="resource" property="value" /></a></li>
		<% } else { %>
			<li><div id="register_class_nav"><a href="<jsp:setProperty name="resource" property="key" value="WebAdvisorUrl" /><jsp:getProperty name="resource" property="value" /><jsp:setProperty name="resource" property="key" value="SearchForClassesUrl" /><jsp:getProperty name="resource" property="value" />" id="register_class_link" onclick="<%= cpopup %>" class="search_for_classes webadvisor"><jsp:setProperty name="resource" property="key" value="ClassesNavRegisterForClasses" /><jsp:getProperty name="resource" property="value" /></a></div></li>
		<% } %>
<% 	} else { %>
		<li><a href="myaccount.jsp" class="search_for_classes">
				<jsp:setProperty name="resource" property="key" value="ClassesNavRegisterForClasses" /><jsp:getProperty name="resource" property="value" />
			</a>
		</li>
<% 	} %>

<li><a href="summerworkshops.jsp" class="summer_workshops">
		<jsp:setProperty name="resource" property="key" value="ClassesNavSummerWorkshop" /><jsp:getProperty name="resource" property="value" />
	</a>
</li>
<li><a href="summerintensives.jsp" class="summer_intensives">
		<jsp:setProperty name="resource" property="key" value="ClassesNavSummerIntensives" /><jsp:getProperty name="resource" property="value" />
	</a>
</li>
<li><a href="catalog.jsp" class="catalog">
		<jsp:setProperty name="resource" property="key" value="ClassesNavCatalog" /><jsp:getProperty name="resource" property="value" />
	</a>
</li>


