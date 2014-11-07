<div class="span4">
	<h3>Quick Connect</h3>
	<div id="quick-connect">
		<cfform name="ftrContact" id="ftrContact" action="contactleadcheck.cfm" method="post" preservedata="yes">
			<fieldset>
				<div class="row-fluid">
					<div class="span6 infield-label">
						<cfinput tabindex="8" name="leadFirstName" id="contactFirstName" type="text" maxlength="50" class="input-large color-input span12" required="yes" message="First Name is required." placeholder="First Name" title="First Name" />
					</div>
					<div class="span6 infield-label">
						<cfinput tabindex="9" name="leadLastName" id="contactLastName" type="text" maxlength="50" class="input-large color-input span12" required="yes" message="Last Name is required." placeholder="Last Name" title="Last Name" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6 infield-label">
						<cfinput tabindex="10" name="leadEmail" id="contactEmail" type="text" maxlength="254" class="input-large color-input span12" required="yes" message="A Valid email address is required." validate="email" validateat="onSubmit" placeholder="Email" title="Email" />
					</div>
					<div class="span6 infield-label">
						<cfinput tabindex="11" name="leadPhone" id="contactPhone" type="text" maxlength="12" class="input-large color-input span12" required="yes" message="A valid phone number is required." validate="regex" pattern="^\(?(\d{3})\)?[- ._]?(\d{3})[- ._]?(\d{4})$" validateat="onsubmit" placeholder="Phone" title="Phone" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6 infield-label">
						<cfinput tabindex="12" name="leadZip" id="contactZip" type="text" maxlength="5" class="input-large color-input span12" required="yes" message="A valid zipcode is required." validate="zipcode" validateat="onsubmit" placeholder="Zip" title="Zip" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12 infield-label">
						<cftextarea tabindex="13" name="leadContent" id="contactContent" rows="3" class="input-large color-input span12" required="yes"  message="Details are required." validate="regex" pattern="[A-Za-z0-9]+" placeholder="Details" />
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
						<cfif isDefined("session.mailsent") and session.mailsent eq 1>
							<cfinput name="submit" type="submit" value="Contact Us" tabindex="14"  id="submit"  class="btn btn-red btn-primary btn-large span12" disabled  />						
						<cfelse>
							<cfinput name="submit" type="submit" value="Contact Us" tabindex="14"  id="submit"  class="btn btn-red btn-primary btn-large span12"  />
						</cfif>
					</div>
				</div>
			</fieldset>
		</cfform>
	</div>
</div>
