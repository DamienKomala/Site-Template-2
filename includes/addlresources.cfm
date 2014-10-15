<cfset resources=application.pageData.getResources()>
<cfif resources.recordcount GT 0>
	<div class="box">
		<cfif isDefined("resources.pagetitle") and resources.pagetitle NEQ "">
		<h3><cfoutput>#resources.pagetitle#</cfoutput></h3>
		<cfelse>
		<h3>Additional Resources</h3>
		</cfif>
		<ul>
			<cfoutput query="resources">
				<cfif name NEQ "">
					<cfif pagename EQ "/">
					<li><a href="http://#CGI.SERVER_NAME#">#name#</a></li>
					<cfelse>
					<li><a href="http://#CGI.SERVER_NAME#/#pagename#">#name#</a></li>
					</cfif>
				</cfif>
			</cfoutput>
		</ul>
	</div>
</cfif>