<cfcomponent>
	<cffunction name="init" access="public" output="no">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="insPage" access="public" returntype="void">
		<cfargument name="myPage" type="string" required="yes">
		<cfargument name="ppc" type="boolean" required="yes">
		<cfset var qryInsPage="">
		<cfquery name="qryInsPage" datasource="#application.datasource1#">
			INSERT INTO tracker (tracker_page,tracker_website_id, tracker_sessionid, tracker_date, tracker_timein, tracker_ppc)
			VALUES(<cfqueryparam value="#arguments.myPage#" cfsqltype="cf_sql_varchar">,<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">, <cfqueryparam value="#session.sessionid#" cfsqltype="cf_sql_varchar">, convert(varchar(8), getdate(), 101), convert(varchar(8), getdate(), 108), <cfqueryparam value="#arguments.ppc#" cfsqltype="cf_sql_bit">)
		</cfquery>
	</cffunction>
	
	<cffunction name="updPage" access="public" returntype="void">
		<cfargument name="myPage" type="string" required="no">
		<cfargument name="convert" type="numeric" required="no">
		<cfset var qryUpdPage="">	
		<cfquery name="qryUpdPage" datasource="#application.datasource1#">
			DECLARE @trackerid int, @timein time, @timeout time, @duration time
			
			SET @trackerid=(SELECT MAX(tracker_id) FROM tracker WHERE tracker_sessionid = <cfqueryparam value="#session.sessionid#" cfsqltype="cf_sql_varchar">)
			SET @timein=(SELECT tracker_timein FROM tracker where tracker_id=@trackerid)

			UPDATE tracker 
			SET tracker_timeout=CONVERT(varchar(8), getdate(), 108)
			WHERE tracker_id=@trackerid

			SET @timeout=(SELECT tracker_timeout FROM tracker where tracker_id=@trackerid)
			SET @duration = (SELECT CONVERT(VARCHAR(8),DateAdd(SS,Datediff(ss,@timein, @timeout)%(60*60*24),0),108))

			UPDATE tracker 
			SET tracker_duration=@duration
				<cfif isDefined("arguments.convert") AND arguments.convert EQ 1>
					,tracker_convert=<cfqueryparam value="1" cfsqltype="cf_sql_bit">	
				</cfif>
			WHERE tracker_id=@trackerid
		</cfquery>
	</cffunction>
	
	<cffunction name="siteStats" access="public"  returntype="struct" output="no">
		<cfset var stats=StructNew()>
		<cfquery name="qrySiteStats" datasource="#application.datasource1#">
			SELECT tracker_page, tracker_duration
			FROM tracker
			WHERE tracker_sessionid=<cfqueryparam value="#session.sessionid#" cfsqltype="cf_sql_varchar">
				ORDER BY tracker_id ASC
		</cfquery>
		<cfquery name="qryStats2" datasource="#application.datasource1#">
			DECLARE @SiteTimeIn AS time,@siteTimeOut AS time
			SET @SiteTimeIn=(SELECT MIN(tracker_timein) FROM tracker WHERE tracker_sessionid=<cfqueryparam value="#session.sessionid#" cfsqltype="cf_sql_varchar">)
			SET @siteTimeOut=(SELECT MAX(tracker_timeout) FROM tracker WHERE tracker_sessionid=<cfqueryparam value="#session.sessionid#" cfsqltype="cf_sql_varchar">)
			
			SELECT 
				CASE 
				WHEN DATEDIFF(ss,@sitetimein,@sitetimeout)/3600 > 0 THEN
					CAST(DATEDIFF(ss,@sitetimein,@sitetimeout)/3600 AS varchar) + 'hour(s) '
				ELSE 
					''
				END + 
				CASE 
				WHEN DATEDIFF(ss,@sitetimein,@sitetimeout)/60%60 > 0 THEN
					CAST((DATEDIFF(ss,@sitetimein,@sitetimeout)/60%60) AS varchar) + ' minute(s) ' 
				ELSE
					''
				END + CAST(DATEDIFF(ss,@sitetimein,@sitetimeout)%60 AS varchar) + ' second(s)' AS TimeOnSite, 
			MIN(tracker_date) AS dateEntered,@SiteTimeIn AS TimeEntered
			FROM tracker
			WHERE tracker_sessionid=<cfqueryparam value="#session.sessionid#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfif qrystats2.timeentered NEQ "">
			<cfset tm=qryStats2.timeentered>
		<cfelse>
			<cfset tm="00:00:00.0000">
		</cfif>
		<cfset hr=listgetat(tm,1,":.")>
		<cfset min=Listgetat(tm,2,":.")>
		<cfset sec=ListGetAt(tm,3,":.")>
		<cfif hr GE 12>
			<cfif hr GT 12>
				<cfset hr=hr-12>
			</cfif>
			<cfset ampm = "PM">
		<cfelseif hr EQ "00">
			<cfset hr=12>
			<cfset ampm="AM">
		<cfelse>
			<cfif LEFT(hr,1) EQ 0>
				<cfset hr=RIGHT(hr,1)>
			</cfif>
			<cfset ampm = "AM">
		</cfif>
		
		<cfset stats.sitestats=qrySiteStats>
		<cfset stats.timeOnSite=qryStats2.TimeOnSite>
		<cfset stats.PageEnter = hr & ":" & min & ":" & sec & " " & ampm>	
		<cfreturn stats>
	</cffunction>
</cfcomponent>