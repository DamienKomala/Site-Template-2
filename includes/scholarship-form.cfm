<div class="scholarshipform">
	<div class="post-header">
		<h2>2015 Scholarship Application Form</h2>
	</div>
	<cfif Not IsDefined('url.appstatus')>
		<cfform class="" id="commentForm2" method="post" action="" enctype="multipart/form-data">
			<h4>Applicant Registration</h4>
			<div class="row-fluid">
				<div class="span6">
					<label for="name">First Name</label>
					<cfinput type="text" name="fname" id="fname" maxlength="80" required="true" message="Please enter your First Name">
				</div>
				<div class="span6">
					<label for="name">Last Name</label>
					<cfinput type="text" name="lname" id="lname" maxlength="80" required="true" message="Please enter your Last Name">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<label for="dob">Date of Birth</label>
					<cfinput type="text" name="dob" id="dob" maxlength="80" required="true" message="Please enter your Month, Day, and Year of Birth">
				</div>
			</div>
			<hr>
			<h4>Contact Information</h4>
			<div class="row-fluid">
				<div class="span6">
					<label for="address">Street Address</label>
					<cfinput type="text" name="address" id="address" maxlength="255" required="true" message=" Required">
				</div>
				<div class="span6">
					<label for="zip">Zip Code</label>
					<cfinput type="text" name="zip" id="zip" maxlength="5" required="true" message="Please enter a valid zipcode.">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<label for="subject">Phone Number</label>
					<cfinput type="text" name="phone" id="phone" maxlength="12" required="true" message="Please enter a valid phone number ex. 817-920-9000" validate="telephone">
				</div>
				<div class="span6">
					<label for="email">Email</label>
					<cfinput type="text" name="email" id="email" maxlength="100"  required="true"  message="Please enter a valid email address (name@domain.com)" validate="email">
				</div>
			</div>
			<p>Are you a Legal Citizen of the United States or authorized to attend school in the United States? *</p>
			<p>
				<cfinput type="radio" name="citizen" value="Yes" checked="yes">
				Yes<br>
				<cfinput type="radio" name="citizen" value="No" >
				No</p>
			<hr>
			<h4>Academic Information</h4>
			<div class="row-fluid">
				<div class="span6">
					<label for="highschool">Name of Tarrant County High School</label>
					<cfquery name="gethighschoolsbycounty" datasource="pmpmg">
						SELECT TOP 1000 [Name]
						FROM [pmpmg].[dbo].[scholarship_highschool]
						where name like '%H S,%'
						order by name asc
					</cfquery>
					<cfselect name="HighSchool" id="HighSchool" required="yes"  message="Select Your High School from the List Below"> <cfoutput query="gethighschoolsbycounty">
						<option value="#gethighschoolsbycounty.name#">#gethighschoolsbycounty.name#</option>
					</cfoutput> </cfselect>
				</div>
				<div class="span6">
					<label for="gpa">Current GPA</label>
					<cfselect name="gpa" id="gpa" required="yes"  message="Tell Us How You Found This Scholarship"> <cfoutput>
						<cfloop from="4.0" to="2.1" step="-.1" index="i">
							<option value="#i#">#i#</option>
						</cfloop>
					</cfoutput> </cfselect>
				</div>
			</div>
			<label for="subject">Intended Undergraduate School Name *</label>
			<cfinput type="text" name="undergrad" id="undergrad" maxlength="255" >
			<label for="subject">Projected High School Graduation Date Month/Year: *</label>
			<cfselect name="HSGradMonth" id="HSGradMonth" required="yes"  message="What Month will you be graduating High School?"> <cfoutput>
				<cfloop from="1" to="12" step="1" index="i">
					<option value="#i#">#i#</option>
				</cfloop>
			</cfoutput> </cfselect>
			<cfselect name="HSGradYear" id="HSGradYear" required="yes"  message="What Year will you be graduating High School?"> <cfoutput>
				<cfloop from="2015" to="2020" step="1" index="i">
					<option value="#i#">#i#</option>
				</cfloop>
			</cfoutput> </cfselect>
			<hr>
			<h4>Transcript</h4>
			<label for="subject">Upload your unofficial transcript(s) in one file: *</label>
			<p>
				<cfinput type="file" name="transcript" id="transcript" required="yes" accept="application/pdf" message="Please browse to a valid PDF file of your transcript." >
			</p>
			<p>Transcripts must be in .PDF format. (<a href="http://convertonlinefree.com/"  target="Converter">Click here</a> to Convert .doc/docx to .PDF)</p>
			<hr>
			<h4>The 2015 Essay</h4>
			<p><strong>Topic</strong>: A group of enemy soldiers is arrested for firing into an unarmed crowd in Downtown Philadelphia, unfortunately killing some US Citizens. There is overwhelming evidence and dangerous public outrage against the soldiers, whom were jailed. They have public defenders assigned by the court. </p>
			<p><strong>Objective: </strong>Based on your personal life experience, discuss whether, as a future lawyer who is not associated with the incident, you would choose to either not represent or represent these enemy soldiers and why you made that decision.  Please remember these enemy soldiers have legal representation under constitutional law already... </p>
			<p>
				<label for="subject">Upload your essay: * </label>
				<cfinput type="file" name="essay" >
			</p>
			<p>Essays must be between 500 and 1400 words and uploaded in .PDF format.</p>
			<hr>
			<h4>Expenses</h4>
			<p>Please list your anticipated education expenses in one year:</p>
			<div class="row-fluid">
				<div class="span6">
					<label for="tuitionexpense">Tuition</label>
					<div class="input-prepend input-append"> <span class="add-on">$</span>
						<cfinput class="span2" id="tuitionexpense" name="tuitionexpense" type="text" required="yes" validate="integer" message=" Required">
						<span class="add-on">.00</span> </div>
				</div>
				<div class="span6">
					<label for="admisionexpense">Admission Fees</label>
					<div class="input-prepend input-append"> <span class="add-on">$</span>
						<cfinput class="span2" id="admissionexpense" name="admissionexpense" type="text" required="yes" validate="integer" message=" Required">
						<span class="add-on">.00</span> </div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<label for="exam-fees">Exam Fees</label>
					<div class="input-prepend input-append"> <span class="add-on">$</span>
						<cfinput class="span2" id="examfees" name="examfees" type="text" required="yes" validate="integer" message=" Required">
						<span class="add-on">.00</span> </div>
				</div>
				<div class="span6">
					<label for="booksexpense">Books</label>
					<div class="input-prepend input-append"> <span class="add-on">$</span>
						<cfinput class="span2" id="booksexpense" name="booksexpense" type="text" required="yes" validate="integer" message=" Required">
						<span class="add-on">.00</span> </div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<label for="unfiromexpense">Uniform Costs</label>
					<div class="input-prepend input-append"> <span class="add-on">$</span>
						<cfinput class="span2" id="unfiromexpense" name="unfiromexpense" type="text" required="yes" validate="integer" message=" Required">
						<span class="add-on">.00</span> </div>
				</div>
				<div class="span6">
					<label for="transportationexpense">Transportation</label>
					<div class="input-prepend input-append"> <span class="add-on">$</span>
						<cfinput class="span2" id="transportationexpense" name="transportationexpense" type="text" required="yes" validate="integer" message=" Required">
						<span class="add-on">.00</span> </div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<label for="unfiromexpense">Food Costs</label>
					<div class="input-prepend input-append"> <span class="add-on">$</span>
						<cfinput class="span2" id="foodexpense" name="foodexpense" type="text" required="yes" validate="integer" message=" Required">
						<span class="add-on">.00</span> </div>
				</div>
				<div class="span6">
					<label for="expense-other">Other (please specify)</label>
					<div class="input-prepend input-append"> <span class="add-on">$</span>
						<cfinput class="span2" id="expenseother" name="expenseother" type="text" required="yes" validate="integer" message=" Required">
						<span class="add-on">.00</span> </div>
				</div>
			</div>
			<hr>
			<h4>Research</h4>
			<div class="row-fluid">
				<div class="span6">
					<label for="how-did-you-find">How did you find this scholarship?</label>
					<cfselect name="howdidyoufind" id="howdidyoufind" required="yes"  message="Tell Us How You Found This Scholarship">
					<option value=""></option>
					<option value="Guidance">Guidance Counselor</option>
					<option value="OtherSchool">Other School Official</option>
					<option value="Firm">From the Firm</option>
					<option value="Friend">Friend/Family</option>
					<option value="SchoolWeb">School Website</option>
					<option value="Google">Google</option>
					<option value="Yahoo">Yahoo</option>
					<option value="Bing">Bing</option>
					<option value="OtherOnlineSource">Another Online Source</option>
					</cfselect>
				</div>
				<div class="span6" align="center">
					<label for="howmany"># of Scholarships Applied For?</label>
					<cfselect name="NumScholarships" id="NumScholarships" required="yes"  message="How Many Scholarships have you applied for?"> <cfoutput>
						<cfloop from="0" to="12" step="1" index="i">
							<option value="#i#">#i#</option>
						</cfloop>
					</cfoutput> </cfselect>
				</div>
			</div>
			<cfset stCheck=application.HoneyPot.honeypotcheck(ip='#CGI.REMOTE_ADDR#')>
			<!--- Don't display the personal information --->
			<cfif isDefined("stCheck") AND (stCheck.type GTE 4 AND stCheck.type LTE 7)>
				<!--- Send 404 message --->
				<cfheader statuscode="404" statustext="Not Found">
				404 Not Found
				<cfabort>
			</cfif>
			<div class="text-center">
				<h4>Disclaimer</h4>
				<p>I, (name) certify that I am the individual responsible for completing this form and the materials that I have attached are accurate, complete and true.</p>
				<label for="subject">Type full name: *</label>
				<cfinput type="text" name="fullname" id="fullname" maxlength="255" >
				<br>
				<cfif isDefined("session.mailsent") AND session.mailsent EQ 1>
					<cfinput name="submit" type="submit" value="Form Submitted" tabindex="7"  id="submit"  class="submit btn btn-success btn-large" disabled />
					<cfelse>
					<cfinput name="submit" type="submit" value="Submit Scholarship Application" tabindex="7"  id="submit"  class="submit btn btn-success btn-large"  />
				</cfif>
			</div>
			<!-- data submit status -->
		</cfform>
		<cfelse>
		<p>Your Form Has Been Successfully Submitted.</p>
	</cfif>
</div>
