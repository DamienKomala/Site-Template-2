<cfcomponent>
	<cffunction name="init" access="public" output="no">
		<cfreturn this>
	</cffunction>

	<cffunction name="getblogDate" access="public" output="no" returntype="query">
		<cfargument name="date" type="string" required="yes">
		<cfset var getCalItems="">
		<cfset var mo=ListGetAt(date,1,"-")>
		<cfset var dy=ListGetAt(date,2,"-")>
		<cfset var yr=ListGetAt(date,3,"-")>
		<cfquery name="getCalItems" datasource="#application.datasource1#">
			SELECT TOP 1 blogcalendartags_h1 AS h1Tag, blogcalendartags_metadescription AS metadesc,  blogcalendartags_metakeywords AS metaKW, blogcalendartags_titletag AS titletag,
			'blog/lawyer-blog-#date#.html' AS canonical
			FROM blogcalendartags
			WHERE blogcalendartags_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND blogcalendartags_month=<cfqueryparam  value="#mo#" cfsqltype="cf_sql_integer">
				AND blogcalendartags_day=<cfqueryparam value="#dy#" cfsqltype="cf_sql_integer">
				AND blogcalendartags_year=<cfqueryparam  value="#yr#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn getCalItems>
	</cffunction>

	<cffunction name="getMinDate" access="public" output="no" returntype="query">
		<cfset var qryMinCal="">
		<cfquery name="qryMinCal" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,5,0)#">
			SELECT DATEPART(YEAR,MIN(blogentries_date_posted)) AS firstyear,DATEPART(MONTH,MIN(blogentries_date_posted)) AS firstmonth
			FROM blogentries
			WHERE blogentries_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn qryMinCal>  
	</cffunction>

	<cffunction name="getblogCalendarDate" access="public" output="no" returntype="query">
		<cfargument name="caldt" type="string" required="yes">
		<cfset var getCalItems="">
		<cfset var mo=ListGetAt(caldt,1,"-")>
		<cfset var yr=ListGetAt(caldt,2,"-")>
		<cfquery name="getCalItems" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,2,0)#">
			SELECT TOP 1 blogcalendartags_h1 AS h1Tag, blogcalendartags_metadescription AS metadesc,  blogcalendartags_metakeywords AS metaKW, blogcalendartags_titletag AS titletag,
			'blog/attorney-blog-calendar-#caldt#.html' AS canonical
			FROM blogcalendartags
			WHERE blogcalendartags_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND blogcalendartags_month=<cfqueryparam  value="#mo#" cfsqltype="cf_sql_integer">
				AND blogcalendartags_day IS NULL
				AND blogcalendartags_year=<cfqueryparam  value="#yr#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn getCalItems>
	</cffunction>

	<cffunction name="getBlogCategory"  access="public" output="no" returntype="query">
		<cfargument name="category" type="string" required="yes">
		<cfset var qryCalItems="">
		<cfquery name="qryCalItems" datasource="#application.datasource1#">
			SELECT	blogcategory_name AS catname, 
					REPLACE(COALESCE(blogcategory_title + ' Blog', blogcategory_name + ' Blog'),'{category_name}',blogcategory_name) AS h1Tag, 
					REPLACE(blogcategory_metadescription,'{category_name}',blogcategory_name) AS metadesc, 
					blogcategory_metakeywords AS metaKW, 
					CASE
						WHEN blogcategory_titletag is NULL OR blogcategory_titletag = '' THEN
							blogcategory_name + ' | Blog | ' + c.client_name
						ELSE
							REPLACE(blogcategory_titletag,'{category_name}',blogcategory_name)
						END AS titletag, 
					'blog/category/#arguments.category#.html' AS canonical
			FROM blogcategory
				LEFT OUTER JOIN website w
					ON w.website_id=blogcategory_websiteid
				LEFT OUTER JOIN client c
					ON c.client_id=w.website_client_id
			WHERE blogcategory_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND blogcategory_alias=<cfqueryparam value="#arguments.category#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn qryCalItems>
	</cffunction>
	
	<cffunction name="getBlogDays" access="public" output="no" returntype="array">
		<cfargument name="calmonth" type="numeric" required="yes">
		<cfargument name="calyear" type="numeric" required="yes">
		<cfset var qryblogdates="">
		<cfquery name="qryblogdates" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,5,0)#">
			SELECT DATEPART(day,blogentries_date_posted) AS day
			FROM blogentries
			WHERE DATEPART(month,blogentries_date_posted)=<cfqueryparam value="#calmonth#" cfsqltype="cf_sql_integer">
				AND DATEPART(year, blogentries_date_posted)=<cfqueryparam value="#calyear#" cfsqltype="cf_sql_integer">
				AND blogentries_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND blogentries_page_status=<cfqueryparam value="1" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfset dt=ListToArray(QuotedValueList(qryblogdates.day))>
		<cfreturn dt>
	</cffunction>
</cfcomponent>