<cfcomponent>
	<cffunction name="init" access="public" output="no">
		<cfreturn this>
	</cffunction>

	<cffunction name="getStates" access="public" returntype="query" output="no">
		<cfquery name="qryStates" datasource="#application.datasource1#">
			SELECT state_information_id AS state_id, state_information_name AS state_name, state_information_abbr as state_abbr
			FROM state_information
			ORDER BY state_information_name
		</cfquery>
		<cfreturn qryStates>
	</cffunction>
	
	<cffunction name="makeProper" output="yes" returntype="string">
		<cfargument name="inpstring" type="string" required="yes">
		<cfargument name="inpstring2" type="string" required="no">
		<cfset var locname="">
		<cfloop index="x" from="1" to="#listlen(inpstring," ")#">
			<cfif locname NEQ "">
				<cfset locname=locname & " ">
			</cfif>
			<cfset locname=locname & UCASE(LEFT(ListGetAt(inpstring,x," "),1))>
			<cfif LEN(ListGetAt(inpstring,x," ")) GT 1>
				<cfset locname=locname & LCASE(RIGHT(ListGetAt(inpstring,x," "),LEN(ListGetAt(inpstring,x," "))-1))>
			</cfif>
		</cfloop>
		<cfif isDefined("inpstring2")>
			<cfquery name="getStateName" datasource="#application.datasource1#">
				SELECT TOP 1 StateFullName
				FROM zipcode_business
				WHERE State=<cfqueryparam value="#inpstring2#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset locname=locname & ", "& getStateName.StateFullName>
		</cfif>
		<cfreturn locname>
	</cffunction>
</cfcomponent>