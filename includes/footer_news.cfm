<cfif not isDefined("footernews")>
<cfset footernews=application.pageData.getFooterNews(numrecs=3, chopped=125)>
</cfif>
<div class="span5">
	<h3>News</h3>
	<cfoutput query="footernews">
		<p><strong>#title#</strong><br />
			#body#...<br />
			<a href="http://#CGI.SERVER_NAME#/blog/#pagename#">Read more...</a></p>
	</cfoutput>  
</div>
