<cfoutput>

<p class="breadcrumbs">
	<a href="http://#CGI.SERVER_NAME#">Home</a> / 
	<cfif isdefined('additionalbc') and additionalbc neq ''>
	<a href="http://#CGI.SERVER_NAME#/#lcase(rereplace(application.apnhstate, ' ', '-', 'all'))#-nursing-home-abuse-lawyers.html"> #application.apnhstate# Nursing Homes</a>
	 / #additionalbc#
	<cfelse>
	#application.apnhstate# Nursing Homes
	</cfif>
</p>

</cfoutput>

