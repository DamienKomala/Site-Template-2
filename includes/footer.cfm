<cfset StructDelete(session,"pgfooter")>
<cfif NOT isDefined("session.pgfooter")>
<cfsavecontent variable="session.pgfooter">
<div class="container">
	<div class="bottom-logo-section">
		<div class="row-fluid">
			<div class="span6">
				<div class="footer-logo"><a href="/"><img src="/images/footer-logo.png" alt="Mike Lewis" /></a></div>
			</div>
			<div class="span6 pull-right">
				<p class="phone">Call Us Toll Free <br>
				<a href="tel:18662991769">866-299-1769</a></p>
				<cfinclude template="social-media.cfm">
			</div>
		</div>
	</div>
</div>
<footer>
	<div class="container">
		<div  class="footer-top">
			<div class="row-fluid">
				<div class="span3">
					<h3>Office Locations</h3>
					<h4>Winston-Salem Office</h4>
					<p>285 Executive Park Boulevard<br>
						Winston Salem, North Carolina 27103</p>
					<p>Toll Free #: <a href="tel:18662991769">866-299-1769</a><br>
						Winston-Salem #: <a href="tel:3367657777">336 765-7777</a><br>
						Fax #: 336-659-1750</p>
					<h4>Greensboro Office</h4>
					<p>204 Muirs Chapel Road<br>
						Greensboro, North Carolina 27410</p>
					<p>Toll Free #: <a href="tel:18662991769">866-299-1769</a><br>
						Greensboro #: <a href="tel:3368511000">336-851-1000</a><br>
						Fax #: 336-659-1750</p>
				</div>
				<cfinclude template="footer_news.cfm">
				<cfinclude template="ftr_quickconnect.cfm">
			</div>
		</div>
	</div>
</footer>
<div class="container">
	<div id="copyright">
		<div class="row-fluid">
			<div class="span8">
				<p class="copy">&copy; <cfoutput>#YEAR(now())#</cfoutput> Mike Lewis Attorneys - Website Designed and Optimized by
					<cfif CGI.SCRIPT_NAME EQ "/index.cfm">
						PMP Marketing Group
						<cfelse>
						PMP Marketing Group
					</cfif>
				</p>
			</div>
			<div class="span4">
				<p class="text-right"><a href="/privacy-policy.html">Privacy Policy</a></p>
			</div>
		</div>
	</div>
</div>
</cfsavecontent>
</cfif>
<cfoutput>#session.pgfooter#</cfoutput>
<!---Common Modal Contact form for case evaluations--->
<div id="CaseEvaluationModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="CaseEvaluationModal" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3 id="myModalLabel">Contact Us</h3>
	</div>
	<div class="modal-body">
		<cfinclude template="/includes/modal-form.cfm">
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal">Close</button>
	</div>
</div>

<!-- Google Code for Remarketing Tag --> 
<!--------------------------------------------------
Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. See more information and instructions on how to setup the tag on: http://google.com/ads/remarketingsetup
--------------------------------------------------->
<cfif isDefined("contentid") AND isDefined('application.exceptions["thanksID"]') AND contentid EQ application.exceptions["thanksID"]>
</cfif>

