<div id="header">
		<p id="language">
			<a href="/teens/SetLocale.do?l=en_US" class="english">English</a> / <a href="/teens/SetLocale.do?l=es_ES" class="spanish">Español</a>		
		</p>
		<ul id="nav">
			<li class="primary"><a href="mission.jsp" class="about primary">
				<jsp:setProperty name="resource" property="key" value="TopNavAboutUs" /><jsp:getProperty name="resource" property="value" /></a>
				<ul id="about">
					<%@ include file="/includes/nav_about.jsp" %>
				</ul>
			</li>
			<li class="primary"><a href="classdescriptions.jsp"  class="classes primary">
				<jsp:setProperty name="resource" property="key" value="TopNavClasses" /><jsp:getProperty name="resource" property="value" /></a>
				<ul>
					<%@ include file="/includes/nav_classes.jsp" %>
				</ul>
			</li>
			<li class="primary"><a href="register.jsp" class="register primary">
				<jsp:setProperty name="resource" property="key" value="TopNavMoreInfo" /><jsp:getProperty name="resource" property="value" /></a>
				<ul>
					<%@ include file="/includes/nav_register.jsp" %>
				</ul>
			</li>
			<li class="primary"><a href="gallery.jsp" class="gallery primary">
				<jsp:setProperty name="resource" property="key" value="TopNavGallery" /><jsp:getProperty name="resource" property="value" /></a>
				<ul>
					<li>&nbsp;</li>
				</ul>
			</li>
			<li class="primary">
			<% if (isUs) { %>	
				<div id="my_account_nav">
					<% if (isSignIn) { %>			
						<a href="/teens/includes/webadvisor.jsp?wa=AccountSummaryUrl" class="account primary webadvisor"><jsp:setProperty name="resource" property="key" value="TopNavMyAccount" /><jsp:getProperty name="resource" property="value" /></a>
					<% } else { %>
						<a href="javascript:void(AccountSummaryUrl);" id="my_account_link" class="account primary"><jsp:setProperty name="resource" property="key" value="TopNavMyAccount" /><jsp:getProperty name="resource" property="value" /></a>
					<% } %>				
				</div>
				<ul>
					<%@ include file="/includes/nav_my_account.jsp" %>
				</ul>
			<% } else { %>				
				<a href="myaccount.jsp" class="account primary"><jsp:setProperty name="resource" property="key" value="TopNavMyAccount" /><jsp:getProperty name="resource" property="value" /></a>
				<ul>
					<li>&nbsp;</li>
				</ul>
			<% } %>				
			</li>
			<li class="primary"><a href="donate.jsp" class="donate primary"><jsp:setProperty name="resource" property="key" value="TopNavDonate" /><jsp:getProperty name="resource" property="value" /> <span class="now"><jsp:setProperty name="resource" property="key" value="TopNavNow" /><jsp:getProperty name="resource" property="value" /></span></a>
				<ul>
					<li>&nbsp;</li>
				</ul>
			</li>
			<li class="primary"><a href="contact.jsp" class="contact primary"><jsp:setProperty name="resource" property="key" value="TopNavContactUs" /><jsp:getProperty name="resource" property="value" /></a>
				<ul>
					<%@ include file="/includes/nav_contact.jsp" %>
				</ul>
			</li>
		</ul>
	</div>