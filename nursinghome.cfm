<cfoutput>
	<cfparam name="nhpage" default="1"><!--- includes first page by default--->
	<cfparam name="showsidebar" default="1"> <!---show sidebar by default--->
	
	<cfset stnum = 1>
	<cfset endnum = 5>
	
	<cfif nhpage eq 4 or nhpage eq 2>
		<cfset showsidebar = 0>
	</cfif>

	<cfif nhpage eq 1>
		<cfinclude template="includes/nursing-home-finder.cfm">
	<cfelseif nhpage eq 2>
		<cfinclude template="includes/nursing-home-info.cfm">
	<cfelseif nhpage eq 3>
		<cfinclude template="includes/nursing-home.cfm">
	<cfelseif nhpage eq 4>
		<cfinclude template="includes/nursing-home-search.cfm">
	<cfelse>
		---
	</cfif>
</cfoutput>


