<cfif (isDefined("contentid")) AND (contentid EQ 9625)>
<cfset minsidebar = 1>
<cfelse>
<cfset minsidebar = 0>
</cfif>

<aside class="span4 sidebar" id="sidebar">
	<cfif minsidebar EQ 1 and Contentid EQ '9625'>
		<cfelse>
		<cfinclude template="caseevaluation.cfm">
	</cfif>
	<aside class="sidebar-content">
<cfif (minsidebar EQ 0) or (IsDefined('contentid') AND contentid EQ '9625')>	
	<cfinclude template="testimonials.cfm">
</cfif>
		<div class="logos">
			<a href="#" data-toggle="tooltip" class="tool-tip" data-placement="top" title="AV&reg; Preeminent&trade; (4.5-5.0)"><img src="/images/sidebar-logos/av-martindale-hubble.jpg" alt="AV Martindale Hubble Peer Review Rated"/></a>
			<a href="#" data-toggle="tooltip" class="tool-tip" data-placement="top" title="Selected for Best Lawyers in Personal Injury Litigation"><img src="/images/sidebar-logos/best-lawyers.jpg" alt="Best Lawyers of America"/></a>
			<a href="#" data-toggle="tooltip" class="tool-tip" data-placement="top" title="Top 1% of Trial Lawyers"><img src="/images/sidebar-logos/milliondollar-advocates.jpg" alt="Million Dollar Advocates"/></a>
			<a href="#" data-toggle="tooltip" class="tool-tip" data-placement="top" title="Second-Tier law firm Personal Injury 2014"><img src="/images/sidebar-logos/best-law-firms.jpg" alt="Best Law Firms"/></a>
			<a href="#" data-toggle="tooltip" class="tool-tip" data-placement="top" title="Pro-Bono Volunteer Lawyer"><img src="/images/sidebar-logos/afj.jpg" alt="Advocates for Justice"/></a>
			<a href="#" data-toggle="tooltip" class="tool-tip" data-placement="top" title="AVVO Rating 10.0 Superb"><img src="/images/sidebar-logos/avvo.jpg" alt="AV Martindale Hubble Peer Review Rated"/></a>
			<a href="#" data-toggle="tooltip" class="tool-tip" data-placement="top" title="Client Satisfaction Award - American Institue of Personal Injury Attorneys"><img src="/images/sidebar-logos/tenbest.jpg" alt="10 Best Lawyers 2014"/></a>
			<a href="#" data-toggle="tooltip" class="tool-tip" data-placement="top" title="Selected for North Carolina Super Lawyer 2013"><img src="/images/sidebar-logos/superlawyers.jpg" alt="SuperLawyers"/></a>
			<!---<a href="#" data-toggle="tooltip" class="tool-tip" data-placement="top" title="text_needed"><img src="/images/sidebar-logos/goldaward.jpg" alt="sidebar_logo"/></a>--->
		</div>
		<cfif (isDefined("contentid") AND contentid EQ application.exceptions['blgID']) OR isDefined("catid") OR isDefined("blogid") OR isDefined("date")>
			<!---		<cfinclude template="calendar.cfm">--->
			<cfinclude template="blogcategories.cfm">
			<cfelse>
			<!---<div class=""> <a href="/workers-compensation-attorney.html"><img src="/images/workers-comp-button.jpg" alt="Workers Comp Center" /></a> </div>--->
			<!---
			<cfif CGI.REMOTE_ADDR EQ "50.192.156.189">
				<br>
				<a href="/north-carolina-nursing-home-abuse-lawyers.html" class="btn btn-large btn-nursinghome">
					<strong>30 seconds is all it takes to see if your loved one is safe.</strong><br>
					<small>Review Ratings for all NC Nursing Homes</small>
				<!---<strong>RESEARCH ANY NURSING HOME IN North Carolina</strong><br>
					<em><small>View Detailed Reports,<br>
					Reviews and Submit Concerns</small></em>--->
				</a>
			</cfif>--->
			<cfif minsidebar EQ 0 and NOT Isdefined('attorneyid') > 
			<cfelseif isdefined('contentid') and contentID NEQ '9083'>
			<cfinclude template="settlements.cfm">
			</cfif>
			
			<cfif isDefined("contentid")  AND (contentID EQ application.exceptions["homeID"] OR contentID EQ application.exceptions["newsID"])>
				<cfelse>
				<cfif NOT IsDefined('attorneyid')>
				<cfinclude template="addlresources.cfm">
				</cfif>
			</cfif>
		</cfif>
		
		<!---BEGIN: In-House use only---> 
		<!---		<cfif cgi.REMOTE_HOST EQ '50.192.156.189'>
		<div class="box">
			<h3>Template stuff</h3>
			<ul>
				<li><a href="/styleguide.cfm">Style Guide</a></li>
				<li><a href="/video.cfm">Video Player</a></li>
				<li><a href="/template_testimonials.cfm">Testimonials Page Template</a></li>
			</ul>
		</div>
		</cfif>---> 
		<!---END: In-House use only---> 
	</aside>
</aside>
