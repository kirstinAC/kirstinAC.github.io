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
<title>Tuition | ACN | ArtCenter at Night</title>
<%@ include file="/includes/metatag.jsp" %>
<%@ include file="/includes/head.jsp" %>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$('#tuition .inlineAccordionList').accordion( "option", "active", <%= activeKey %> );
	});
</script>

<body id="tuition" >
<%@ include file="/includes/header.jsp" %>

<div id="wrapper">
	<%@ include file="/includes/calendar_header.jsp" %>

	<div class="main_content row">

		<%@ include file="/includes/nav_register.jsp" %>

		<div id="centercol" class="col">

			<h1>Tuition</h1>

			<p>Your completed registration form and full payment are required to hold your place in a course. Studio course tuition is $415 per credit unit, with the exception of select foundation studio courses denoted as “transferable.” Transferable studio courses range from $320 to $415 per credit unit and offer the potential to transfer to one of ArtCenter’s full-time degree programs. Humanities and Sciences courses are $240 per credit unit. The cost of non-credit workshops and special course offerings varies. Please see individual course descriptions for fee information.</p>
			
			<p>Though we strive to keep course tuition as low as possible, ACN must occasionally increase its course tuition to adjust for increases in operational costs. We will notify enrolled ACN students of tuition increases as early as possible.</p>

			<p>Federal and state financial aid programs are not applicable to ACN tuition.</p>

			<p>Tuition and fees are due in full at the time of registration. Any unpaid tuition and fees as a result of returned checks, account holds, dismissal, etc., are due immediately.</p>

			<p>Once the term begins, a non-refundable late registration fee <b>of $50 per course will be charged</b>. Note: This does not apply to shorter workshops or for courses that begin later in the term. </p>

			<p>A $20 fee will be charged for any returned checks.</p>

			<ul id="inlinelist" class="inlineAccordionList">
				<li>
					<header>
						<h2 class="expandable">Discounts</h2>
					</header>
					<div>
						<p>ACN is pleased to offer discounts to ArtCenter alumni, teachers and individuals age 62 and older. We also offer professional development discounts on a selection of courses for K-12 art teachers and art providers.</p>
						<p>Prior to submitting online registrations: To qualify for a discount, please complete the Discount Verification Form and submit it to the ACN/Public Programs office along with the required documentation. Online registration forms submitted prior to this verification process will be processed at the non-discounted course tuition rate. Alumni and seniors only need to submit this form once; teachers and K-12 art teachers and art providers must submit this form every term.</p>
						<p>Please note: Discounts do not apply to lab fees or late fees, which must be paid in full at the time of registration.</p>
						<p>Indicate the discount you are applying for on the Discount Verification Form (select one):</p>

						<h4>ArtCenter College of Design Alumni Discount</h4>
						<p>ArtCenter offers its degree-earned alumni a 50% tuition discount on ACN courses. Please indicate your major and year of graduation on the form.</p>

						<h4>Senior Discounts</h4>
						<p>A 25% tuition discount is available to individuals age 62 and older, with identification (driver’s license or other official documentation) that indicates date of birth.</p>

						<h4>Teacher Discounts</h4>
						<p>A 25% tuition discount is available to practicing full-time teachers. Teachers must provide proof of employment, such as a letter from your school district or principal verifying your current teaching status. We must receive proof of employment before we can process your registration or approve this discount.</p>

						<h4>K-12 Art Teachers and Arts Providers:</h4>
						<p>Professional Development Discount: Special 50% Discount. Expand your art teaching capabilities to include disciplines such as graphic design, product and transportation design, photography, Web design, and more. Challenge your students to think creatively and critically while introducing them to possible careers in the visual arts and design. ACN is pleased to support K-12 art teachers and arts providers by offering the following introductory courses at 50 percent off regular tuition. Please provide proof of employment such as a letter from your school district, principal or supervisor, verifying your current employment status as a K-12 art teacher or arts provider. We must receive proof of employment each term before we can process your registration or approve this discount.</p>
						<p>
						<table>
						  <tbody>
							<tr>
								<td>ACN-007&emsp;</td>
								<td>Design 360</td>
							<tr>
								<td>ACN-009&emsp;</td>
								<td>Introduction to Figure Drawing</td>
							<tr>
								<td>ACN-116W&emsp;</td>
								<td>Basics of Painting: Still life</td>
							<tr>
								<td>ACN-115W&emsp;</td>
								<td>Basics of Painting: Figure</td>
							<tr>
								<td>ACN-020&emsp;</td>
								<td>Introduction to Painting</td>
							<tr>
								<td>ACN-030&emsp;</td>
								<td>Introduction to Graphic Design</td>
							<tr>
								<td>ACN-040&emsp;</td>
								<td>Introduction to Advertising</td>
							<tr>
								<td>ACN-256&emsp;</td>
								<td>Introduction to Package Design</td>
							<tr>
								<td>ACN-142&emsp;</td>
								<td>Basics of Digital Photography</td>
							<tr>
								<td>ACN-151&emsp;</td>
								<td>Introduction to Filmmaking</td>
							<tr>
								<td>ACN-224&emsp;</td>
								<td>Illustration Techniques and Concepts</td>
							<tr>
								<td>ACN-101&emsp;</td>
								<td>Digital Design 1</td>
							<tr>
								<td>ACN-190&emsp;</td>
								<td>Web Fundamentals</td>
							<tr>
								<td>ACN-191&emsp;</td>
								<td>Web Fundamentals: Online</td>
							<tr>
								<td>ACN-200&emsp;</td>
								<td>Introduction to Interaction Design</td>      
							<tr>
								<td>ACN-086&emsp;</td>
								<td>Product Design: Basics</td>
							<tr>
								<td>ACN-087&emsp;</td>
								<td>Product Design: Process</td>
							<tr>
								<td>ACN-050&emsp;</td>
								<td>Introduction to Product and Transportation Design</td>
							<tr>
								<td>ACN-038&emsp;</td>
								<td>Introduction to Communication Sketching</td>
							<tr>
								<td>ACN-060&emsp;</td>
								<td>Introduction to Environmental Design</td>
							<tr>
								<td>ACN-045&emsp;</td>
								<td>Introduction to Entertainment Design</td>
						  </tbody>
						</table>
						</p>
						<p>Note: This discount does not apply to lab fees or late fees, which must be paid in full at the time of registration.</p>
					</div>
				</li>			

				<li>
					<header>
						<h2 class="expandable">Discount Verification Form [PDF]</h2>
					</header>
					<div>
						<p><a href="pdf/acn_discount_verification_form.pdf" target="_blank">Download the form.</a><br />All discount requests are subject to verification. Sorry, but we cannot hold space in ACN courses until your discount has been verified and we receive your registration form and tuition payment.</p>
					</div>
				</li>			

				<li>
					<header>
						<h2 id="tuition_refunds" class="expandable">Refunds</h2>
					</header>
					<div>
						<p>Tuition refunds are based on the date your online or signed written program change request is received in the Public Programs office. Program changes may be submitted by fax, in person or online. You will need your ArtCenter student username and password in order to use the online drop process.</p>
						<p>Please note: we cannot process faxed or in-person add/drop requests on Saturdays, Sundays or campus holidays when the Public Programs office is closed.</p>
						<p>If you drop a course before the first day of the term, you will receive a full refund. Late fees are not refundable. Refunds are mailed to students usually within six weeks after the start of the semester or of the announcement of a canceled class.</p>

						<p>The refund schedule is as follows:</p>

						<h2>Refund Calendar </h2>
                        
                        
                        				  <p><table>
						  <tbody>
							<tr>
								<td colspan="2"><span class="highlight">Fall 2017 10–14-week courses</span></td>
							</tr>
							<tr>
								<td width="209">Before September 8, 2017</td>
								<td width="157">100%</td>
							</tr>
							<tr>
								<td>September 11-September 22</td>
								<td>80%</td>
							</tr>
							<tr>
								<td>September 25-September 29</td>
								<td>60%</td>
							</tr>
							<tr>
								<td>October 2-October 6</td>
								<td>40%</td>
							</tr>
							<tr>
								<td>October 9-October 13</td>
								<td>20%</td>
							</tr>
							<tr>
								<td>October 16-October 27</td>
								<td>0%</td>
							</tr>
							<tr>
								<td>October 27</td>
								<td>Last day to drop a course</td>
							</tr>
					    </tbody>
					  </table></p>
                        
                        
					  <p><table>
						  <tbody>
							<tr>
								<td colspan="2"><span class="highlight">Spring 2018 10–14-week courses</span></td>
							</tr>
							<tr>
								<td width="209">Before January 12, 2017</td>
								<td width="157">100%</td>
							</tr>
							<tr>
								<td>January 15-January 26</td>
								<td>80%</td>
							</tr>
							<tr>
								<td>January 29-February 2</td>
								<td>60%</td>
							</tr>
							<tr>
								<td>February 5-February 9</td>
								<td>40%</td>
							</tr>
							<tr>
								<td>Febuary 12-February 16</td>
								<td>20%</td>
							</tr>
							<tr>
								<td>February 19-March 2</td>
								<td>0%</td>
							</tr>
							<tr>
								<td>March 2</td>
								<td>Last day to drop a course</td>
							</tr>
					    </tbody>
					  </table></p>
                      
                      
                      <p><table>
						  <tbody>
							<tr>
								<td colspan="2"><span class="highlight">Summer 2018 10–14-week courses</span></td>
							</tr>
							<tr>
								<td width="209">Before May 11, 2018</td>
								<td width="157">100%</td>
							</tr>
							<tr>
								<td>May 14-May 25</td>
								<td>80%</td>
							</tr>
							<tr>
								<td>May 28-June 1</td>
								<td>60%</td>
							</tr>
							<tr>
								<td>June 4-June 8</td>
								<td>40%</td>
							</tr>
							<tr>
								<td>June 11-June 15</td>
								<td>20%</td>
							</tr>
							<tr>
								<td>June 18-June 29</td>
								<td>0%</td>
							</tr>
							<tr>
								<td>June 29</td>
								<td>Last day to drop a course</td>
							</tr>
					    </tbody>
					  </table></p></div>
                        
                        
						
					  <p>For shorter courses, if you drop a course before the first day of the course, you will receive a refund. The refund policy for shorter courses is as follows:</p>
						<p>
						<table>
						  <tbody>
							<tr>
								<td colspan="2"><span class="highlight">Four- to Seven-week courses</span></td>
							</tr>
							<tr>
								<td width="249">Before class begins (one day)&emsp;</td>
								<td width="49">100%</td>
							</tr>
							<tr>
								<td>One to seven days after class starts&emsp;</td>
								<td>80%</td>
							</tr>
							<tr>
								<td>Eight to 14 days after class starts&emsp;</td>
								<td>20%</td>
							</tr>
							<tr>
								<td>Fifteen to 21 days after class starts&emsp;</td>
								<td>0%</td>
							</tr>
						  </tbody>
						</table>
						</p>
						
						<p>
						<table>
						  <tbody>
							<tr>
								<td colspan="2"><span class="highlight">One- to Seven-day courses</span></td>
							</tr>
							<tr>
								<td width="247">Before class begins (one day)&emsp;&emsp;&emsp;&emsp;</td>
								<td width="48">100%</td>
							</tr>
							<tr>
								<td>After class begins&emsp;</td>
								<td>0%</td>
							</tr>
						  </tbody>
						</table>
						</p>

						<p>If you are enrolled in a shorter workshop or a course that begins after the first week of classes, please consult the Public Programs office for the refund schedule.</p>
						<p>Failure to drop a class officially can result in a grade of F for that course. Tuition and fees are due in full at the time or registration. Any unpaid tuition and fees as a result of returned checks, account holds, etc. are due immediately. If you decide to withdraw (or are dismissed from classes) your tuition will be refunded according to the refund schedule above.</p>
						<p>If you have not paid all tuition and fees, you may owe a balance to ArtCenter regardless of when you withdraw during the term.</p>
					</div>
				</li>			
			</ul>
			
		</div><!--end center column-->

		<div id="rightcol" class="col">

			<h1>What is the 1098-T Tuition Payments Statement?</h1>
			<p>Colleges and universities are required to issue a 1098-T Tuition Payments Statement for the purpose of determining a student’s eligibility for the Hope and Lifetime Learning education tax credits. If you would like to receive a 1098-T tuition statement, you must provide your Social Security Number when you register for courses. Your statement will be provided to you online, via your ArtCenter Student Account.</p>

			<p>Please consult an accountant to determine whether it is appropriate for you to file the 1098-T statement with your taxes. For more information, visit the <a href="http://www.irs.gov" target="_new">IRS’ website</a>.</p>

			<h3 class="download">

				<% if (isSignIn) { %>
					<a class="fancybox" data-fancybox-type="iframe" href="includes/webadvisor.jsp?wa=My1098tConsentUrl">1098 Electronic Consent form</a>
				<% } else { %>
					<a href="#" id="tuition1098ConsenttLink">1098 Electronic Consent form</a>
				<% } %>

			</h3>

			<h3 class="download">
				
				<% if (isSignIn) { %>
					<a class="fancybox" data-fancybox-type="iframe" href="includes/webadvisor.jsp?wa=My1098tUrl">Current 1098-T form</a>
				<% } else { %>
					<a href="#" id="tuition1098tLink">Current 1098-T form</a>
				<% } %>

			</h3>

		</div><!--right column-->

	</div><!--main content-->

</div><!--end wrapper-->

<%@ include file="/includes/footer.jsp" %>

</body>
</html>
