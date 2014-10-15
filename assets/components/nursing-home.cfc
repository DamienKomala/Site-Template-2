<cfcomponent>
	<cffunction name="init" access="public" output="no">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getCityTotals" access="public" returntype="query" output="no">
		<cfargument name="state" type="string" required="yes">
		<cfquery name="qryNursingHomeCities" datasource="#application.datasource1#">
			SELECT pi.state AS state_abbr, LTRIM(dbo.ToProperCase(pi.city)) AS city, s.state_information_name AS state_name, COUNT(*) GroupCount, COUNT(*) OVER () AS TotalRecords
			FROM ProviderInfo pi
				LEFT OUTER JOIN state_information s ON s.state_information_abbr=pi.state
			WHERE s.state_information_name=<cfqueryparam value="#state#" cfsqltype="cf_sql_varchar">
			GROUP BY pi.CITY, pi.STATE, s.state_information_name
			ORDER BY pi.state, pi.city
		</cfquery>
		<cfreturn qryNursingHomeCities>
	</cffunction>
	
	<cffunction name="getCityHomes" access="public" returntype="query" output="no">
		<cfargument name="city" type="string" required="yes">
		<cfargument name="state" type="string" required="yes">
		<cfquery name="qryLocalNursingHomes" datasource="#application.datasource1#">
			SELECT 	provnum, LTRIM(dbo.ToProperCase(provname)) AS nh_name, overall_rating AS rating, state
			FROM ProviderInfo pi
			WHERE pi.CITY=<cfqueryparam value="#city#" cfsqltype="cf_sql_varchar">
				AND pi.STATE=<cfqueryparam value="#state#" cfsqltype="cf_sql_varchar">
			ORDER BY pi.provname
		</cfquery>
		<cfreturn qryLocalNursingHomes>
	</cffunction>
	
	<cffunction name="getNHData" access="public" returntype="struct" output="no">
		<cfargument name="nh_id" type="string" required="yes">
		<cfset var NHData=StructNew()>
		<cfquery name="qryNHData" datasource="#application.datasource1#">
			SELECT dbo.ToProperCase(replace(pi.PROVNAME,'.','')) AS facName, dbo.ToProperCase(pi.address) AS address, LTRIM(dbo.ToProperCase(pi.city)) AS city, s.state_information_name, pi.ZIP, 
			pi.BEDCERT,pi.RESTOT,pi.CERTIFICATION AS provider_type, pi.OWNERSHIP AS ownership_type,
			pi.INHOSP AS in_a_hospital, pi.PARTICIPATION_DATE AS dt_first_approved, (SELECT top 1 dbo.ToProperCase(first_name) FROM Ownership WHERE PROVNUM=<cfqueryparam value="#nh_id#" cfsqltype="cf_sql_varchar">) AS fname, 
			(SELECT top 1 dbo.ToProperCase(last_name) FROM Ownership WHERE PROVNUM=<cfqueryparam value="#nh_id#" cfsqltype="cf_sql_varchar">) AS lname,(SELECT TOP 1 dbo.ToProperCase(Role_desc) FROM Ownership WHERE PROVNUM=<cfqueryparam value="#nh_id#" cfsqltype="cf_sql_varchar">) AS RoleDesc,
			pi.overall_rating, pi.quality_rating,pi.staffing_rating,pi.RN_staffing_rating, pi.survey_rating, pi.cmplnt_cnt AS num_complaints, pi.TOT_PENLTY_CNT AS num_penalties,
			pi.FINE_CNT AS num_fines, pi.FINE_TOT AS fines_amt, pi.resfamcouncil, pi.CCRC_FACIL AS cont_care_ret_comm,pi.SFF AS spec_focus_fac, pi.CYCLE_1_SURVEY_DATE as date1, pi.CYCLE_2_SURVEY_DATE as date2, pi.CYCLE_3_SURVEY_DATE as date3
			FROM ProviderInfo pi
				LEFT OUTER JOIN state_information s ON s.state_information_abbr=pi.state
			WHERE pi.provnum=<cfqueryparam value="#nh_id#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfquery name="qryNHdeficiency" datasource="#application.datasource1#">
			SELECT d.survey_date_output AS date, d.tag_desc, ds.deficiency_scope_name AS scope_name, ds.deficiency_scope_description AS scope_desc
			FROM deficiencies d
				LEFT OUTER JOIN Deficiency_Scope ds ON ds.deficiency_scope_code=d.scope
			WHERE provnum=<cfqueryparam value="#nh_id#" cfsqltype="cf_sql_varchar">
			ORDER BY date desc
		</cfquery>
        
        <cfquery name="qryNHdeficiencydts" datasource="#application.datasource1#">
			SELECT 	max(d.survey_date_output) as enddt, min(d.survey_date_output) as startdt
			FROM 	deficiencies d 
			WHERE 	provnum=<cfqueryparam value="#nh_id#" cfsqltype="cf_sql_varchar">
		</cfquery>
        
		<cfset NHData.data=qryNHData>
		<cfset NHData.deficiency=qryNHdeficiency>
        <cfset NHData.deficiencydts=qryNHdeficiencydts>
		<cfreturn NHData>
	</cffunction>
	
	<cffunction name="getSearchNH" access="public" returntype="query" output="no">
	
		<cfargument name="nh_state" type="string" required="yes">
		<cfargument name="nh_beds" type="string" required="no">
		<cfargument name="nh_complaints" type="string" required="no">
		<cfargument name="nh_inhosp" type="string" required="no">
		<cfargument name="nh_rating" type="string" required="no">
		<cfargument name="nh_facname" type="string" required="no">
        <cfargument name="nh_ownership" type="string" required="no">
        <cfargument name="nh_city" type="string" required="no">

		
		<cfquery name="qryNHsrch" datasource="#application.datasource1#">
		SELECT		provnum, LTRIM(dbo.ToProperCase(provname)) AS nh_name,  LTRIM(dbo.ToProperCase(pi.city)) + ', '+ pi.state as Location, pi.state, pi.overall_rating AS rating,
			pi.cmplnt_cnt AS num_complaints, pi.BEDCERT as num_beds, pi.INHOSP AS in_a_hospital

			FROM ProviderInfo pi
				LEFT OUTER JOIN state_information s ON s.state_information_abbr=pi.state
			WHERE pi.state = <cfqueryparam value="#arguments.nh_state#" cfsqltype="cf_sql_varchar">
			<cfif isdefined('arguments.nh_beds') and arguments.nh_beds neq ''>
				<cfif arguments.nh_beds eq '40'>
					<cfset startspan = 0>
					and	 pi.BEDCERT BETWEEN #startspan# and #arguments.nh_beds#
				<cfelseif arguments.nh_beds eq '240+'>
					and	 pi.BEDCERT >= #left(arguments.nh_beds,3)#
				<cfelse>
					<cfset startspan = arguments.nh_beds-39>
					and	 pi.BEDCERT BETWEEN #startspan# and #arguments.nh_beds#
				</cfif>
			</cfif>
		<cfif isdefined('arguments.nh_complaints') and arguments.nh_complaints neq ''>
				<cfif arguments.nh_complaints eq '10'>
					and	 pi.cmplnt_cnt BETWEEN 2 and 10
				<cfelseif arguments.nh_complaints eq '11+'>
					and	 pi.cmplnt_cnt >= #left(arguments.nh_complaints,2)#
				<cfelse>
					and	 pi.cmplnt_cnt = #arguments.nh_complaints#
				</cfif>
				and	pi.cmplnt_cnt = <cfqueryparam value="#arguments.nh_complaints#" cfsqltype="cf_sql_varchar">
			</cfif>
			<cfif isdefined('arguments.nh_inhosp') and arguments.nh_inhosp neq ''>
				<cfif arguments.nh_inhosp eq 0>
					and	pi.INHOSP = 'NO'
				<cfelseif arguments.nh_inhosp eq 1>
					and	pi.INHOSP = 'YES'
				</cfif>
			</cfif>
            <cfif isdefined('arguments.nh_ownership') and arguments.nh_ownership neq ''>
            	and	pi.ownership = <cfqueryparam value="#arguments.nh_ownership#" cfsqltype="cf_sql_varchar">
            </cfif>
            <cfif isdefined('arguments.nh_city') and arguments.nh_city neq ''>
            	and	pi.city = <cfqueryparam value="#arguments.nh_city#" cfsqltype="cf_sql_varchar">
            </cfif>
			<cfif isdefined('arguments.nh_rating') and arguments.nh_rating neq ''>
				and	pi.overall_rating = <cfqueryparam value="#arguments.nh_rating#" cfsqltype="cf_sql_varchar">
			</cfif>
			<cfif isdefined('arguments.nh_facname') and arguments.nh_facname neq ''>
				and	pi.provname LIKE '%#arguments.nh_facname#%'
			</cfif>
		</cfquery>
		
		<cfreturn qryNHsrch>
	</cffunction>
    
	<cffunction name="topdeficient" access="public" returntype="query" output="no">
		<cfargument name="stateabbr" required="yes" type="string">
		
		<cfset var topdef = "">
		<cfset var gettopdefnh = "">
					
         <cfquery name="gettopdefnh" datasource="#application.datasource1#">
         	SELECT 	top 10 count(d.provnum) as defcount, d.provnum, dbo.ToProperCase(replace(d.PROVNAME,'.','')) as providername
			FROM 	deficiencies d
				LEFT OUTER JOIN Deficiency_Scope ds ON ds.deficiency_scope_code=d.scope
			WHERE 	d.provnum in (SELECT	distinct provnum FROM ProviderInfo pi WHERE pi.STATE = <cfqueryparam value="#arguments.stateabbr#" cfsqltype="cf_sql_varchar">)
			group by d.provnum, d.provname
			order by defcount desc
         </cfquery>
		
		<cfreturn gettopdefnh>
	</cffunction>  
    
    <cffunction name="topeficient" access="public" returntype="query" output="no">
		<cfargument name="stateabbr" required="yes" type="string">
		
		<cfset var topdef = "">
		<cfset var gettopefnh = "">
					
         <cfquery name="gettopefnh" datasource="#application.datasource1#">
         	SELECT 	top 10 count(d.provnum) as defcount, d.provnum,  dbo.ToProperCase(replace(d.PROVNAME,'.','')) as providername
			FROM 	deficiencies d
				LEFT OUTER JOIN Deficiency_Scope ds ON ds.deficiency_scope_code=d.scope
			WHERE 	d.provnum in (SELECT	distinct provnum FROM ProviderInfo pi WHERE pi.STATE = <cfqueryparam value="#arguments.stateabbr#" cfsqltype="cf_sql_varchar">)
			group by d.provnum, d.provname
			order by defcount asc
         </cfquery>
		
		<cfreturn gettopefnh>
	</cffunction> 
    
    	
	
</cfcomponent>