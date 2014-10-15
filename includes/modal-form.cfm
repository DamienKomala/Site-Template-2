<cfset showForm = true>
<div class="form-title">
	<div class="free-banner">Free</div>
	<cfif isDefined("pageInfo.caseReview") AND pageInfo.caseReview NEQ "">
		<cfoutput>
			<h3>#pageInfo.caseReview#</h3>
		</cfoutput>
		<cfelse>
		<h3>FREE Case Evaluation</h3>
	</cfif>
	<p>
		<cfif isDefined("pageInfo.calltoaction") AND pageInfo.calltoaction NEQ "">
			<cfoutput>#pageInfo.calltoaction#</cfoutput>
			<cfelse>
			Fill out this form for a FREE, Case Evaluation
		</cfif>
	</p>
</div>
<div class="sidebar-free-consultation"> 
	<!-- start: Contact Form -->
	<div id="modal-contact-form" class="">
		<cfform name="Contact" id="ModalContact" action="" method="post" preservedata="yes">
			<fieldset>
				<div class="row-fluid">
					<div class="span6 infield-label">
						<cfinput tabindex="1" name="leadFirstName" id="modalFirstName" type="text" maxlength="50" class="input-large color-input span12" required="yes" message="First Name is required." placeholder="First Name" title="First Name" />
					</div>
					<div class="span6 infield-label">
						<cfinput tabindex="2" name="leadLastName" id="modalLastName" type="text" maxlength="50" class="input-large color-input span12" required="yes" message="Last Name is required." placeholder="Last Name" title="Last Name" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6 infield-label">
						<cfinput tabindex="3" name="leadEmail" id="modalEmail" type="text" maxlength="254" class="input-large color-input span12" required="yes" message="A Valid email address is required." validate="email" validateat="onSubmit" placeholder="Email" title="Email" />
					</div>
					<div class="span6 infield-label">
						<cfinput tabindex="4" name="leadPhone" id="modalPhone" type="text" maxlength="12" class="input-large color-input span12" required="yes" message="A valid phone number is required." validate="telephone" validateat="onsubmit" placeholder="Phone" title="Phone" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6 infield-label">
						<cfinput tabindex="5" name="leadZip" id="modalZip" type="text" maxlength="5" class="input-large color-input span12" required="yes" message="A valid zipcode is required." validate="zipcode" validateat="onsubmit" placeholder="Zip" title="Zip" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12 infield-label">
						<cftextarea tabindex="6" name="leadContent" id="modalContent" rows="3" class="input-large color-input span12" required="yes"  message="Details are required." placeholder="Details" />
					</div>
				</div>
				<div class="row-fluid"> 
					<!--- Check Project HoneyPot --->
					<cfset stCheck=application.HoneyPot.honeypotcheck(ip='#CGI.REMOTE_ADDR#')>
					<cfif isDefined("stCheck") AND (stCheck.type GTE 4 AND stCheck.type LTE 7)>
						<cfheader statuscode="404" statustext="Not Found">
						404 Not Found
						<cfabort>
					</cfif>
				</div>
				<div class="row-fluid">
					<div class="actions">
						<cfif isDefined("session.mailsent") AND session.mailsent EQ 1>
							<cfinput name="submit" type="submit" value="GET HELP NOW" tabindex="8"  id="Modalcasesubmit"  class="btn btn-red btn-primary btn-large span12" disabled />
							<cfelse>
							<cfinput name="submit" type="submit" value="GET HELP NOW" tabindex="8"  id="Modalcasesubmit"  class="btn btn-red btn-primary btn-large span12"  />
						</cfif>
					</div>
				</div>
			</fieldset>
		</cfform>
	</div>
</div>
<cfif isDefined("form.submit") AND form.submit EQ "Get Help Now">
	<cfset leadtracking="Refering Site: <br /> " & session.google & " <br /> Route: <br /> " & session.page>
	<script language="javascript">
		document.forms["ModalContact"].action="http://<cfoutput>#CGI.SERVER_NAME#</cfoutput>/contactsend.cfm";
		document.getElementById("Modalcasesubmit").click();
	</script>
</cfif>
