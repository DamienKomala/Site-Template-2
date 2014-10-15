<div class="span4">
	<h3>Quick Connect</h3>
	<div id="quick-connect">
		<cfform name="ftrContact" id="ftrContact" action="contactsend.cfm" method="post" preservedata="yes">
			<fieldset>
				<div class="row-fluid">
					<div class="span6 infield-label">
						<cfinput tabindex="9" name="leadFirstName" id="contactFirstName" type="text" maxlength="50" class="input-large color-input span12" required="yes" message="First Name is required." placeholder="First Name" title="First Name" />
					</div>
					<div class="span6 infield-label">
						<cfinput tabindex="10" name="leadLastName" id="contactLastName" type="text" maxlength="50" class="input-large color-input span12" required="yes" message="Last Name is required." placeholder="Last Name" title="Last Name" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6 infield-label">
						<cfinput tabindex="11" name="leadEmail" id="contactEmail" type="text" maxlength="254" class="input-large color-input span12" required="yes" message="A Valid email address is required." validate="email" validateat="onSubmit" placeholder="Email" title="Email" />
					</div>
					<div class="span6 infield-label">
						<cfinput tabindex="12" name="leadPhone" id="contactPhone" type="text" maxlength="12" class="input-large color-input span12" required="yes" message="A valid phone number is required." validate="telephone" validateat="onsubmit" placeholder="Phone" title="Phone" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6 infield-label">
						<cfinput tabindex="13" name="leadZip" id="contactZip" type="text" maxlength="5" class="input-large color-input span12" required="yes" message="A valid zipcode is required." validate="zipcode" validateat="onsubmit" placeholder="Zip" title="Zip" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12 infield-label">
						<cftextarea tabindex="14" name="leadContent" id="contactContent" rows="3" class="input-large color-input span12" required="yes"  message="Details are required." placeholder="Details" />
					</div>
				</div>
				<div class="row-fluid">
					<!--- Check Project HoneyPot --->
						<cfset stCheck=application.HoneyPot.honeypotcheck(ip='#CGI.REMOTE_ADDR#')>
<!---					<cfinvoke returnvariable="stCheck" method="honeypotcheck" component="assets.components.HoneyPotdns">
						<cfinvokeargument name="ip" value="#cgi.remote_addr#" />
<!---						<cfinvokeargument name="ip" value="66.117.9.99" />--->
					</cfinvoke>--->
					<!--- Don't display the personal information --->
					<cfif isDefined("stCheck") AND (stCheck.type GTE 4 AND stCheck.type LTE 7)>
						  <!--- Send 404 message --->
					  	<cfheader statuscode="404" statustext="Not Found">
					  	404 Not Found
					  	<cfabort>
					</cfif>
				</div>
				<div class="row-fluid">
					<div class="actions">
						<cfinput name="submit" type="submit" value="Contact Us" tabindex="16"  id="submit"  class="btn btn-red btn-primary btn-large span12"  />
					</div>
				</div>
			</fieldset>
		</cfform>
	</div>
</div>
