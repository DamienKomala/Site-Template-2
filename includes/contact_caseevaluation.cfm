<cfset showForm = true>

<hr>
<h3>Fill out this form for a FREE, Case Evaluation</h3>
<div id="contact-form" class="">
	<cfform name="Contact" id="Contact" action="http://#CGI.SERVER_NAME#/contactsend.cfm" method="post" preservedata="yes">
		<fieldset>
			<div class="row-fluid">
				<div class="span6 infield-label">
					<cfinput tabindex="1" name="leadFirstName" id="leadFirstName" type="text" maxlength="50" class="input-large color-input span12" required="yes" message="First Name is required." placeholder="First Name" title="First Name" />
				</div>
				<div class="span6 infield-label">
					<cfinput tabindex="2" name="leadLastName" id="leadLastName" type="text" maxlength="50" class="input-large color-input span12" required="yes" message="Last Name is required." placeholder="Last Name" title="Last Name" />
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6 infield-label">
					<cfinput tabindex="3" name="leadEmail" id="leadEmail" type="text" maxlength="254" class="input-large color-input span12" required="yes" message="A Valid email address is required." validate="email" validateat="onSubmit" placeholder="Email" title="Email" />
				</div>
				<div class="span6 infield-label">
					<cfinput tabindex="4" name="leadPhone" id="leadPhone" type="text" maxlength="12" class="input-large color-input span12" required="yes" message="A valid phone number is required." validate="telephone" validateat="onsubmit" placeholder="Phone" title="Phone" />
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6 infield-label">
					<cfinput tabindex="5" name="leadZip" id="leadZip" type="text" maxlength="5" class="input-large color-input span12" required="yes" message="A valid zipcode is required." validate="zipcode" validateat="onsubmit" placeholder="Zip" title="Zip" />
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12 infield-label">
					<cftextarea tabindex="6" name="leadContent" id="leadContent" rows="3" class="input-large color-input span12" required="yes"  message="Details are required." placeholder="Details" />
				</div>
			</div>
			<div class="row-fluid"> 
				<!--- Check Project HoneyPot --->
				<cfset stCheck=application.HoneyPot.honeypotcheck(ip='#CGI.REMOTE_ADDR#')>
				<cfif isDefined("stCheck") AND (stCheck.type GTE 4 AND stCheck.type LTE 7)>
					<!--- Send 404 message --->
					<cfheader statuscode="404" statustext="Not Found">
					404 Not Found
					<cfabort>
				</cfif>
			</div>
			<div class="row-fluid">
				<div class="text-center">
					<cfif isDefined("session.mailsent") AND session.mailsent EQ 1>
						<cfinput name="submit" type="submit" value="Get Help Now" tabindex="8"  id="casesubmit"  class="btn btn-red btn-primary btn-large" disabled />
						<cfelse>
						<cfinput name="submit" type="submit" value="Get Help Now" tabindex="8"  id="casesubmit"  class="btn btn-red btn-primary btn-large"  />
					</cfif>
				</div>
			</div>
		</fieldset>
	</cfform>
</div>
