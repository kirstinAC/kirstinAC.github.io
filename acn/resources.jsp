<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<%@ include file="/includes/bundles.jsp" %>
<%
 	String activeKey = request.getParameter("active"); 
 	activeKey = (activeKey != null && activeKey.length() > 0) ? activeKey : "false"; 
%>
<!DOCTYPE HTML>
<html>
<!--**************Head Tag Information**************-->
<head>
<title>Resources | ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$('#resources .inlineAccordionList').accordion( "option", "active", <%= activeKey %> );
	});
</script>

<body id="resources" >
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content row">

		<%@ include file="/includes/nav_register.jsp" %>

		<div id="centercol" class="col">

			<h1>Resources</h1>

			<ul id="inlinelist" class="inlineAccordionList">
				<li>
					<header>
						<h2 class="expandable">Advisement</h2>
					</header>
					<div>
						<p>An ArtCenter at Night counselor is available by appointment at South Campus to assist you in selecting ACN courses appropriate for your skills and goals. Advisement hours are by appointment, Monday through Thursday from 5:00 p.m. to 8:30 p.m. Call 626.396.2319 to make an appointment.</p>
						<p>Advisement by phone or email is also available. You may email questions along with three to five JPG or PDF files of your artwork to <a href="mailto:acn@artcenter.edu">acn@artcenter.edu</a>, or call 626.396.2319 and leave a message with your telephone number and the best time to reach you, and the counselor will return your call.</p>

						<h2>Digital Media courses:</h2>
						<p>If you have questions about your eligibility for ACN Digital Media courses or are trying to waive prerequisites for those courses, please email questions along with three to five Photoshop files of your artwork to <a href="mailto:acn@artcenter.edu">acn@artcenter.edu</a>. Photoshop files should include all layers or channels.</p>

						<h2>ArtCenter degree programs:</h2>
						<p>The admissions advisement staff is available during business hours at Hillside Campus to provide you with portfolio requirements and specific information regarding the bachelor's and master's degree programs. To schedule advisement appointments for these programs, call the Admissions office at 626.396.2373.</p>
					</div>
				</li>			
				<li>
					<header>
						<h2 class="expandable">Course Credit</h2>
					</header>
					<div>
						<p>College credit is awarded for completion of all ACN courses, with the exception of certain specialized noncredit workshops. The number of credits given is listed next to each course title. Inquires regarding the transferability of credits to another institution should be directed to that institution.</p>

						<h2>Transferable Courses</h2>
						<p>Some foundation courses offered at ACN parallel the content of those offered in ArtCenter’s full-time bachelor’s degree program. These courses are marked as transferable in the course description and are eligible for transfer to the College’s degree program with a grade of B or better. Students applying to the degree program may carry these credits with them, depending upon the major they are applying to and the transfer policy in effect at the time of admission. Students should select courses based on the appropriateness of the class to their chosen goals and not necessarily based on transferability.</p>

						<h2>For current ArtCenter degree program students only:</h2>
						<p>ACN course credits will NOT transfer towards your degree. Grades, however, will appear on ACN transcripts.</p>
					</div>
				</li>			
				<li>
					<header>
						<h2 class="expandable">Course Grades</h2>
					</header>
					<div>
						<p>ACN grades are posted on your ArtCenter student account. To access your grades, login to your account using your username and password, then go to “My Profile” and select “Grades.” Grades will be posted provided you have no outstanding account balances, unpaid bounced check fees, overdue library books or tool crib items, or unpaid parking tickets.</p>
						<p>
						<table>
						  <tbody>
							<tr>
								<td>A &emsp;</td>
								<td>4.00&emsp;&emsp;&emsp;</td>
								<td>C-&emsp;</td>
								<td>1.75</td>
							</tr>
							<tr>
								<td>A-&emsp;</td>
								<td>3.75&emsp;&emsp;&emsp;</td>
								<td>D+&emsp;</td>
								<td>1.50</td>
							</tr>
							<tr>
								<td>B+&emsp;</td>
								<td>3.50&emsp;&emsp;&emsp;</td>
								<td>D &emsp;</td>
								<td>1.00</td>
							</tr>
							<tr>
								<td>B &emsp;</td>
								<td>3.00&emsp;&emsp;&emsp;</td>
								<td>D-&emsp;</td>
								<td>0.75</td>
							</tr>
							<tr>
								<td>B-&emsp;</td>
								<td>2.75&emsp;&emsp;&emsp;</td>
								<td>F &emsp;</td>
								<td>0.00</td>
							</tr>
							<tr>
								<td>C+&emsp;</td>
								<td>2.50&emsp;&emsp;&emsp;</td>
								<td>N*&emsp;</td>
								<td>0.00</td>
							</tr>
							<tr>
								<td>C &emsp;</td>
								<td>2.00</td>
								<td></td>
								<td></td>
							</tr>
						  </tbody>
						</table>
						</p>
						
						<p>*Note: Students failing a course due to non-attendance will receive an “N” (Non-Attendance Failure) grade for the course. The N grade has the same GPA impact as an “F” grade, but specifically indicates that non-attendance was the cause of the failure. As is the case with F grades, students may retake a course in which they received an “N” to replace it in the cumulative GPA. The original N grade must still appear on the transcript, but it will be denoted with an asterisk (*) to show that it has been repeated in a subsequent term, and the GPA will be adjusted to reflect the repeated course’s grade.</p>
						<p>Note: ArtCenter at Night students are required to register and pay the full course tuition (and any required lab or materials fees) in order to retake a class.</p>
						<p>Please request a transcript through Enrollment Services to view grades for ACN courses taken prior to May 2007.</p>
					</div>
				</li>			
				<li>
					<header>
						<h2 class="expandable">Transcripts</h2>
					</header>
					<div>
						<p>Official transcripts may be requested from ArtCenter’s Enrollment Services office at Hillside Campus. Call 626.396.2314 for details. Transcript fees are as follows:
						</p>
						<p>
						<table>
						  <tbody>
							<tr>
								<td>Official:&emsp;</td>
								<td>$5 per copy</td>
							</tr>
							<tr>
								<td>Unofficial:&emsp;</td>
								<td>$2 per copy</td>
							</tr>
							<tr>
								<td>Rush:&emsp;</td>
								<td>$20 per copy</td>
							</tr>
							<tr>
								<td>Overnight:&emsp;</td>
								<td>$30 per copy</td>
							</tr>
						  </tbody>
						</table>
						</p>
						
						
					</div>
				</li>			
				<li>
					<header>
						<h2 class="expandable">Course Changes and Cancellations</h2>
					</header>
					<div>
						<p>ArtCenter reserves the right to cancel any course, limit course size, change times or locations or substitute instructors for those listed in the course schedule as necessary. Course cancellations will not be announced until the end of the registration period. You will receive a full refund if the College must cancel a class for which you have registered.</p>

						<h2>Course Adds and Drops</h2>
						<p>For 14-week courses, the last day to add a course to your schedule is the first Friday of the term. For shorter workshops that start after the first week of the term, registrations will be accepted as long as there are still seats available.</p>
						<p>If it is necessary to drop any or all of your courses, you must notify the Public Programs office online or in writing. Program changes may be submitted by fax, in person or online.</p>
						<p><span class="highlight"><strong>Online:</strong></span> Log in to your account using your ArtCenter username and password, then go to “My Registration” and “Course Adds and Drops.”</p>
						<p><span class="highlight"><strong>By fax:</strong></span> To drop a course, fax a signed note to 626.396.4219. It is your responsibility to follow up with the Public Programs office to ensure that we received your fax and that it is legible. Written or faxed requests to drop any or all of your courses must include the following information: <br />
						<br />
						Student’s full name<br />
						Student ID # and/or address<br />
						Name of the course(s) being dropped<br />
						A brief reason why course is being dropped<br />
						Submission date of the request<br />
						Student’s signature<br />
						</p>

						<p>For fall term, the last day to drop a course is October 27, 2017.</p>
						<p>See <a href="tuition.jsp?active=2#tuition_refunds">Refunds</a> for important dates and refund percentages.</p>
						<p>The effective date of the drop is the day the faxed, in person or online add/drop request is received, not the last day of your attendance in the course. Failure to drop a course officially will result in a grade of F for that course.</p>
						<p>If you decide to withdraw (or are dismissed) from a course, your tuition will be refunded according to the refund schedule. If you have not paid all tuition and fees, you may owe a balance to ArtCenter regardless of when you withdraw.</p>
					</div>
				</li>			

			</ul>
			

		</div><!--end center column-->

		<div id="rightcol" class="col">

			<!--empty for now-->

		</div><!--right column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>