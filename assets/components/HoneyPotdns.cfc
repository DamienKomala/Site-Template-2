<cfcomponent displayname="DNS functions">
	<cffunction name="init" access="public" output="no">
		<cfreturn this>
	</cffunction>

	<cffunction name="honeypotcheck" returntype="struct" hint="Check Project HoneyPot http:BL" output="yes">
		<cfargument name="ip" required="yes" type="string">
		<cfset var aVal = "">
		<cfset var hpkey = "jmlionjeyhmm">
		<cfset var stRet = structNew()>
	
		<cfif session.honeypotresult EQ "new">
			<cfinvoke method="newVisitorCheck" returnvariable="result">
				<cfinvokeargument name="ip" value="#arguments.ip#">
			</cfinvoke>
		<cfelse>
			<cfset result ="existing">
		</cfif>
		<cfif result eq "new">
			<!--- Get the different IP values --->
			<cfset aVal = listToArray(gethostaddress(ReplaceNoCase("#hpkey#.#reverseip(arguments.ip)#.dnsbl.httpbl.org"," ","","ALL")),".")>
	
			<cfif aVal[1] eq "IP-Address not known"><!--- jb: added evaluation of array for good addresses --->
			<!--- set a value indicating ok address --->
				<cfset stRet = {type=99}>
				<cfquery name="iQry" datasource="#application.datasource1#">
					INSERT INTO visitor VALUES
					(<cfqueryparam value="#arguments.ip#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
					<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">)
				</cfquery>
			<cfelse>
				<!--- there was a match so set the return values --->
				<cfset stRet.days = aVal[2]>
				<cfset stRet.threat = aVal[3]>
				<cfset stRet.type = aVal[4]>
	
				<!--- Get the HP info message ie: threat level --->
				<cfswitch expression="#aVal[4]#">
					<cfcase value="0">
						<cfset stRet.message = "Search Engine (0)">
					</cfcase>
					<cfcase value="1">
						<cfset stRet.message = "Suspicious (1)">
					</cfcase>
					<cfcase value="2">
						<cfset stRet.message = "Harvester (2)">
					</cfcase>
					<cfcase value="3">
						<cfset stRet.message = "Suspicious & Harvester (1+2)">
					</cfcase>
					<cfcase value="4">
						<cfset stRet.message = "Comment Spammer (4)">
					</cfcase>
					<cfcase value="5">
						<cfset stRet.message = "Suspicious & Comment Spammer (1+4)">
					</cfcase>
					<cfcase value="6">
						<cfset stRet.message = "Harvester & Comment Spammer (2+4)">
					</cfcase>
					<cfcase value="7">
						<cfset stRet.message = "Suspicious & Harvester & Comment Spammer (1+2+4)">
					</cfcase>
				</cfswitch>
			</cfif>
		<cfelse>
			<!--- good address  --->
			<cfset stRet = {type=99}>
		</cfif>
		<cfreturn stRet>
	 </cffunction>

	<cffunction name="gethostaddress" returntype="string" hint="I do the dns lookup against the http:bl servers">
		<cfargument name="host" required="Yes" type="string" />
		<cfset var obj = "">
		<cftry><!--- jb: added error handling as error is thrown if host lookup has no match in http:BL ie: it's not been reported as a problem --->
			<!--- Init class --->
			<cfset obj = CreateObject("java", "java.net.InetAddress")>
			<cfset result =  obj.getByName(host).getHostAddress() >
			<cfcatch type="any">
				<!--- an "error" in this case is an unknown address, which means it is not reported to http:BL --->
				<cfset result="IP-Address not known">
			</cfcatch>
		</cftry>
		<!--- Return result --->
		<cfreturn result>
	</cffunction>
	
	<cffunction name="reverseip" returntype="string" hint=" I return IP in reverse format as required by http:BL api" >
		<cfargument name="ip" required="Yes" type="string" />
		<cfset var aIp = listToArray(arguments.ip,".")>
		<!--- Return IP reversed --->
		<cfreturn aIp[4] & "." & aIp[3] & "." & aIp[2] & "." & aIp[1]>
	</cffunction>
	
	<cffunction name="newVisitorCheck" returntype="string">
		<cfargument name="ip" required="yes" type="string">
		<cfset var vQry = "">
	
		<cfquery name="vQry" datasource="#application.datasource1#">
			SELECT visitor_ip_addr FROM visitor
			WHERE visitor_ip_addr = <cfqueryparam value="#arguments.ip#" cfsqltype="cf_sql_varchar">
				AND visitor_website_id = <cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
		</cfquery>
	
		 <cfif vQry.recordcount eq 0><!--- then it's a new visitor  --->
			<cfset result = "new">
		 <cfelse>
			<cfset result ="existing">
			<cfset session.honeypotresult="existing">
		 </cfif>
		<cfreturn result>
	</cffunction>
</cfcomponent>