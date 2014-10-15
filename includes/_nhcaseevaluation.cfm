<cfset showForm = true>
<cfparam name="form.leadFirstName" default="">
<cfparam name="form.leadLastName" default="">
<cfparam name="form.leadEmail" default="">
<cfparam name="form.leadPhone" default="">
<cfparam name="form.leadZip" default="">
<cfparam name="form.leadContent" default="">
<cfparam name="captchaerror" default=0>
<cfparam name="captcha" default="">
<cfparam name="captchaHash" default="">
<cfparam name="nouplink" default="0">
<cfset captcha=#captcha1#>
<cfset captchaHash = hash(LCASE(captcha))>
<div class="form-title">
	<cfoutput>
		<!---<h3>FREE Case Evaluation</h3>--->
		<p>If you or a loved one is a resident of #trim(nhData.data.facName)# in #nhData.data.city#, #application.apnhstateabbr# and would like a free case evaluation of your situation, please complete the form below and our Nursing Home Abuse Attorneys will review it shortly. </p>
	</cfoutput>
</div>
<div class="sidebar-free-consultation">
	<!-- start: Contact Form -->
	<div id="contact-form" class="">
		<cfform name="Contact" id="Contact" action="" method="post" preservedata="yes">
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
					<div class="span6"></div>
				</div>
				<div class="row-fluid">
					<div class="span12 infield-label">
						<cftextarea tabindex="6" name="leadContent" id="leadContent" rows="4" class="input-large color-input span12" required="yes"  message="Details are required." placeholder="Details" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<label>Please Enter the 4 Digial number displayed below:</label>
					</div>
				</div>
				<div class="row-fluid">
					<cfinput type="text" class="span3 color-input" tabindex="7" name="captcha" id="captcha" maxlength="4" required="yes" message="Please enter the code displayed." />
					<div class="span3"><cfoutput>#captcha#</cfoutput></div>
					<input name="captchaHash" id="captchaHash" type="hidden" value="<cfoutput>#captchahash#</cfoutput>" />
				</div>
				<div class="row-fluid">
					<div class="actions">
						<cfif isDefined("session.mailsent") AND session.mailsent EQ 1>
							<cfinput name="submit" type="submit" value="GET HELP NOW" tabindex="8"  id="submit"  class="btn btn-red btn-primary btn-large span12" disabled />
						<cfelse>
							<cfinput name="submit" type="submit" value="GET HELP NOW" tabindex="8"  id="submit"  class="btn btn-red btn-primary btn-large span12"  />
						</cfif>
					</div>
				</div>
			</fieldset>
		</cfform>
	</div>
</div>
<!-- end: Contact Form -->

<cfif isDefined("captchaerror") AND captchaerror EQ 0 AND isDefined("form.captchahash") AND  form.captchahash EQ hash(form.captcha)>
	<cfset leadtracking="Refering Site: <br /> " & session.google & " <br /> Route: <br /> " & session.page>
	<script language="javascript">
		document.forms["Contact"].action="http://<cfoutput>#CGI.SERVER_NAME#</cfoutput>/contactsend.cfm";
		document.getElementById("submit").click();
	</script>
	<cfelseif isDefined("captchaerror") AND captchaerror EQ 1>
	<script language="javascript">
		alert("The code you entered did not match the displayed code.\r\nPlease re-enter the code.");
	</script>
</cfif>
<script language="javascript">
	function setMaxLen(tb, len){
		document.getElementById('leadContent').value=document.getElementById('leadContent').value.substring(0,len)
	}
</script>