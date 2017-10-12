		<div id="topnav">

			<nav id="mainnav">

				<!--**************mobile main nav header**************-->
				<div id="mblnav"></div>

				<%@ include file="/includes/nav_social.jsp" %>

				<ul id="navlist">

					<li><%@ include file="/includes/search_mobile_link.jsp" %></la>

					<li class="homelink"><a href="index.jsp">Home</a></li>

					<li><a href="whatis.jsp" class="aboutlink">About Us</a>

						<ul>
							<li><a href="whatis.jsp">What is ACN?</a></li>
					        <li><a href="publicprograms.jsp">Public Programs</a></li>
							<li><a href="artcenter.jsp">ArtCenter</a></li>
							<li><a href="donors.jsp">Scholarship Donors</a></li>
							<li><a href="partners.jsp">Partners</a></li>
							<li><a href="events.jsp">Events</a></li>
							<li><a href="http://www.artcenter.edu/accd/giving/donation.jsp" target="_blank" class="last">Support ACN</a></li>
						</ul>

					</li>
					<li><a href="portfolio.jsp" class="explorelink">Explore</a>

						<ul>
							<li><a href="portfolio.jsp">Portfolio Prep</a></li>
					        <li><a href="courses.jsp">Course Descriptions</a></li>
							<li><a href="faculty.jsp">Faculty</a></li>
                            <li><a href="class.jsp">Featured Class</a></li>
							<li><a href="featured-faculty.jsp">Featured Faculty</a></li>
							<li><a href="gallery.jsp">Gallery</a></li>
							<li><a href="catalog.jsp">Catalog</a></li>
							<li><a href="calendar.jsp" class="last">Calendar</a></li>
						</ul>

					</li>
					<li><a href="howto.jsp" class="registerlink">Register</a>

						<ul>
							<li>
								<%@ include file="/includes/register_now.jsp" %>
							</li>
					        <li><a href="howto.jsp">How to Register</a></li>
					        <li><a href="pdf/acn_regform.pdf" target="_blank" class="regform">Registration Form (PDF)</a></li>
					        <li><a href="resources.jsp">Resources</a></li>
							<li><a href="tuition.jsp">Tuition</a></li>
							<li><a href="scholarships.jsp" class="last">Scholarships</a></li>
						</ul>

					</li>
					<li><a href="accommodations.jsp" class="needlink">Need to Know</a>

						<ul>
							<li><a href="accommodations.jsp">Accommodations</a></li>
					        <li><a href="studentid.jsp">Student I.D. Cards</a></li>
							<li><a href="parking.jsp">Parking</a></li>
							<li><a href="campus.jsp">Campus Facilities</a></li>
							<li><a href="policies.jsp">Policies & Procedures</a></li>
							<li><a href="pdf/acn_student_guide.pdf" target="_blank" class="regform">ACN Student Guide (PDF)</a></li>
							<li><a href="faq.jsp">FAQ</a></li>
							<li><a href="support.jsp" class="last">Student Support Services</a></li>
						</ul>

					</li>
					<li class="navhide"><a href="#">My Account</a>

						<ul>
						<%  if (isSignIn) { %>
							<li>
								<a class="fancybox" data-fancybox-type="iframe" href="includes/webadvisor.jsp?wa=MyScheduleUrl">My Schedule</a>
							</li>
					        <li>
								<a class="fancybox" data-fancybox-type="iframe" href="includes/webadvisor.jsp?wa=AddDropClassesUrl">Add/Drop Classes</a>
					        </li>
							<li>
								<a class="fancybox" data-fancybox-type="iframe" href="includes/webadvisor.jsp?wa=AccountSummaryUrl">Account Summary</a>
							</li>
							<li>
								<a class="fancybox" data-fancybox-type="iframe" href="includes/webadvisor.jsp?wa=MyGradesUrl">My Grades</a>
							</li>
							<li>
								<a class="fancybox" data-fancybox-type="iframe" href="includes/webadvisor.jsp?wa=MyTranscriptsUrl">My Transcript</a>
							</li>
							<li>
								<a class="fancybox" data-fancybox-type="iframe" href="includes/webadvisor.jsp?wa=My1098tUrl">My 1098-T</a>
							</li>
					        <li>
								<a class="fancybox" data-fancybox-type="iframe" href="includes/webadvisor.jsp?wa=MyContactInfoUrl">My Contact Info</a>
					        </li>
					        <li>
								<a href="#" onclick="javascript: window.open('http://www.artcenter.edu/changepassword', '_new','width=640,height=640,location=yes,scrollbars=yes,status=yes,resizable=yes');" class="last">My Password</a>
					        </li>
						<% } else { %>	
							<li>
								<a href="#" id="myscheduleLink">My Schedule</a>
							</li>
					        <li>
					        	<a href="#" id="adddropclassLink">Add/Drop Classes</a>
					        </li>
							<li>
								<a href="#" id="accountsummaryLink">Account Summary</a>
							</li>
							<li>
								<a href="#" id="mygradesLink">My Grades</a>
							</li>
							<li>
								<a href="#" id="mytranscriptLink">My Transcript</a>
							</li>
							<li>
								<a href="#" id="my1098tLink">My 1098-T</a>
							</li>
					        <li>
					        	<a href="#" id="mycontactinfoLink">My Contact Info</a>
					        </li>
					        <li>
					        	<a href="#" onclick="javascript: window.open('http://www.artcenter.edu/changepassword', '_new','width=640,height=640,location=yes,scrollbars=yes,status=yes,resizable=yes');" class="last">My Password</a>
					        </li>
						<% }  %>	
						</ul>

					</li>
					<li><a href="contact.jsp" class="contactlink">Contact Us</a>

						<ul>
							<li><a href="contact.jsp">Contact Info</a></li>
							<li><a href="directions.jsp" class="last">Directions</a></li>
						</ul>

					</li>
				</ul>

				<%@ include file="/includes/signin_link.jsp" %>

				<%@ include file="/includes/search_link.jsp" %>


			</nav>

		</div><!--end topnav-->


