<cfcomponent>
	<cffunction name="init" access="public" output="no">
		<cfreturn this>
	</cffunction>

	<cffunction name="getWebInfo" access="public" returntype="query" output="no">
		<cfset var getDomain="">
		<cfquery name="getdomain" datasource="#application.datasource1#">
			SELECT website_id, w.website_realname, w.website_directory, w.website_analytics_id, c.client_name, w.website_phone_number AS phone_number, w.officeviewonly, w.website_debug,
			w.website_google_metatag
			FROM website w
			LEFT OUTER JOIN client c
				ON w.website_client_id = c.client_id
			WHERE website_id = <cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn getDomain>
	</cffunction>

	<cffunction name="getContentPage" access="public" returntype="query" output="no">
		<cfargument name="contentid" type="numeric" required="yes">
		<cfset var qryContentPage=""> 
		<cfquery name="qryContentPage" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,1,0)#">
			EXEC spContentPage @contentid=<cfqueryparam value="#contentid#" cfsqltype="cf_sql_integer">, @domainid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn qryContentPage>
	</cffunction>
	
	<cffunction name="getAttyPage" access="public" returntype="query" output="no">
		<cfargument name="attyid" type="numeric" required="yes">
		<cfset var qryAttyPage="">
		<cfquery name="qryAttyPage" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,1,0)#">
			EXEC usp_AttorneyPage <cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">, <cfqueryparam value="#attorneyid#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn qryAttyPage>
	</cffunction>
	
	<cffunction name="getBlogPage" access="public" returntype="query" output="no">
		<cfargument name="blogid" type="numeric" required="yes">
		<cfset var qryBlogPage="">
		<cfquery name="qryBlogPage" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,1,0)#">
			EXEC usp_BlogPage @domainid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">, @blogid=<cfqueryparam value="#blogid#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn qryBlogPage>
	</cffunction>

	<cffunction name="getBlogTypes" access="public" returntype="query" output="no">
		<cfset var qryBlogTypes="">
			<cfquery name="qryBlogTypes" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,2,0)#">
				SELECT blogcategory_id, blogcategory_name, blogcategory_alias, blogcategory_title, count(be.blogentries_id) AS blogcount
				FROM blogcategory
					LEFT OUTER JOIN blogentries be
						ON be.blogentries_category=blogcategory_id
				WHERE blogcategory_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				GROUP BY be.blogentries_category, blogcategory_id, blogcategory_name, blogcategory_alias, blogcategory_title
				HAVING count(be.blogentries_id) > 0
				ORDER BY blogcategory_name ASC
			</cfquery>
			<cfreturn qryBlogTypes>
	</cffunction>
	
	<cffunction name="getTopBlogs" access="public" returntype="query">
		<cfargument name="category" type="numeric" required="no">
		<cfquery name="qryTopBlogs" datasource="#application.datasource1#">
			SELECT TOP 10 be.blogentries_id, be.blogentries_title, be.blogentries_body, be.blogentries_alias, bc.blogcategory_id AS catid, bc.blogcategory_name AS category, bu.blogusers_name AS author, be.blogentries_date_posted AS dateposted
			FROM blogentries be
				LEFT OUTER JOIN blogcategory bc 
					ON bc.blogcategory_id=be.blogentries_category
				LEFT OUTER JOIN blogusers bu 
					ON bu.blogusers_id=be.blogentries_postedby
			WHERE be.blogentries_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				<cfif isDefined("category") AND category NEQ "">
				AND be.blogentries_category=<cfqueryparam value="#category#" cfsqltype="cf_sql_integer">
				</cfif>
				and be.blogentries_page_status = <cfqueryparam value="1" cfsqltype="cf_sql_bit">
			ORDER BY be.blogentries_date_posted DESC		
		</cfquery>
		<cfreturn qryTopBlogs>
	</cffunction>

	<cffunction name="getBlogs" access="public" returntype="query">
		<cfargument name="category" type="any" required="no">
		<cfargument name="date" type="string" required="no">
		<cfargument name="caldt" type="string" required="no">

		<cfquery name="qryBlogs" datasource="#application.datasource1#" >
			<cfif isDefined("category") AND category NEQ "">
				EXEC usp_Blog_LP_Entries default,100,default,default,<cfqueryparam value="#REPLACE(category,'.html','')#" cfsqltype="cf_sql_varchar">
			<cfelseif isDefined("date") AND date NEQ "">
				EXEC usp_Blog_LP_Entries default,100,<cfqueryparam value="#REPLACE(date,'.html','')#" cfsqltype="cf_sql_date">,default,default
			<cfelseif isDefined("caldt") AND caldt NEQ "">
				EXEC usp_Blog_LP_Entries default,100,default,<cfqueryparam value="#REPLACE(caldt,'.html','')#" cfsqltype="cf_sql_varchar">,default
			<cfelse>
				EXEC usp_Blog_LP_Entries default,100,default,default,default			
			</cfif>
		</cfquery>
		<cfreturn qryBlogs>
	</cffunction>
	
	<cffunction name="getResources" access="public" returntype="query" output="yes">
		<cfargument name="orderby" type="string" required="no">
		<cfset var qryResources="">
		<cfquery name="qryResources" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,1,0)#">
			<cfif isDefined("contentid") AND (contentid NEQ "")>
				EXEC usp_getResources @contentid=<cfqueryparam value="#contentid#" cfsqltype="cf_sql_integer">, @domainid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">, @practareapage=<cfqueryparam value="'north-carolina-personal-injury-attorneys.html'" cfsqltype="cf_sql_varchar">,@pagetitle=<cfqueryparam value="Further Information" cfsqltype="cf_sql_varchar"><cfif isDefined("arguments.orderby")>, @orderby=<cfqueryparam value="'#arguments.orderby#'" cfsqltype="cf_sql_varchar"></cfif>
			<cfelseif NOT isDefined("contentid") AND NOT isDefined("attorneyid")>
				EXEC usp_getResources @contentid=<cfqueryparam value="0" cfsqltype="cf_sql_integer">, @domainid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">, @practareapage=<cfqueryparam value="'north-carolina-personal-injury-attorneys.html'" cfsqltype="cf_sql_varchar">,@pagetitle=<cfqueryparam value="Further Information" cfsqltype="cf_sql_varchar"><cfif isDefined("arguments.orderby")>, @orderby=<cfqueryparam value="#arguments.orderby#" cfsqltype="cf_sql_varchar"></cfif>
			<cfelse>
				SELECT attorney_id AS id, attorney_firstname + ' ' + attorney_lastname AS name, attorney_pagename AS pagename
				FROM attorney
				WHERE attorney_website_ID=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
					AND attorney_page_status=<cfqueryparam value="1" cfsqltype="cf_sql_integer">
				ORDER BY attorney_navbar
			</cfif>
		</cfquery>
		<cfreturn qryResources>
	</cffunction>

	<cffunction name="getSettlements" access="public" returntype="query">
		<cfset var qrySettlements="">
		<cfquery name="qrySettlements" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,5,0)#">
			SELECT settlement_id, settlement_amt, settlement_header,settlement_text, dbo.udf_StripHTML(settlement_text,200) AS sidebar_settlement_text
			FROM settlement
			WHERE settlement_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
			ORDER BY settlement_amt DESC
		</cfquery>
		<cfreturn qrySettlements>
	</cffunction>

	<cffunction name="getAllPractAreas" access="public" returntype="query">
		<cfargument name="domainid" type="numeric" required="yes">
		<cfargument name="parentid" type="numeric" required="yes">
		<cfquery name="qryPractAreas" datasource="#application.datasource1#">
			SELECT content_id, content_pagename, content_navbar
			FROM content
			WHERE content_website_id=<cfqueryparam value="#domainid#" cfsqltype="cf_sql_integer">
				AND content_parentid=<cfqueryparam value="#parentid#" cfsqltype="cf_sql_integer">
			UNION ALL
			SELECT content_id , content_pagename, content_navbar
			FROM content 
			WHERE content_parentid IN (SELECT content_id
			FROM content
			WHERE content_website_id=<cfqueryparam value="#domainid#" cfsqltype="cf_sql_integer">
				AND content_parentid=<cfqueryparam value="#parentid#" cfsqltype="cf_sql_integer">)
			ORDER BY content_navbar ASC
		</cfquery>
		<cfreturn qryPractAreas>	
	</cffunction>

	<cffunction name="getTopPractAreas" access="public" returntype="query">
		<cfargument name="parentid" type="numeric" required="yes">
		<cfquery name="qryTopPractAreas" datasource="#application.datasource1#">
			SELECT content_id, content_pagename, content_navbar, content_navdescriptor
			FROM content
			WHERE content_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND content_parentid=<cfqueryparam value="#parentid#" cfsqltype="cf_sql_integer">
			ORDER BY content_navdescriptor ASC
		</cfquery>
		<cfreturn qryTopPractAreas>	
	</cffunction>

	
	<cffunction name="truncateData" access="public" returntype="string">
		<cfargument name="paraStr" type="string" required="yes">
		<cfargument name="GetLen" type="numeric" required="yes">
		<cfset thisText=REReplace(paraStr,'<[^>]*>','','all')>
		<cfset thisText=LEFT(thisText,GetLen)>
		<cfif (LEN(thistext) GT GetLen) AND (right(thisText, 1) NEQ " ")>
			<cfloop index="x" from="#GetLen+1#" to="#LEN(paraStr)#">
				<cfif MID(paraStr,x,1) NEQ " ">
					<cfset thisText=thisText & MID(paraStr,x,1)>
				<cfelse>
					<cfbreak>
				</cfif>
			</cfloop>
		</cfif>
		<cfreturn thisText>
	</cffunction>
	
	<cffunction name="getFAQs" access="public" output="yes">
		<cfset var qryFAQs="">
		<cfquery name="qryFAQs" datasource="#application.datasource1#">
			SELECT content_pagename,  content_title, content_navbar
			FROM content
			WHERE content_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND content_parentid=(SELECT content_id
										FROM content
										WHERE content_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
											AND content_pagename=<cfqueryparam value="faqs.html" cfsqltype="cf_sql_varchar">)
			ORDER BY content_navbar ASC
		</cfquery>
		<cfreturn qryFAQs>
	</cffunction>

	<cffunction name="getNews" access="public" returntype="query">
		<cfargument name="nid" type="numeric" default="#application.exceptions['newsID']#" required="no">
		<cfquery name="qryNews" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,5,0)#">
			SELECT content_pagename, content_title, content_navbar, news_byline_title, news_byline_by, news_byline_date, news_byline_display
			FROM content
				LEFT OUTER JOIN news_byline 
					ON content_id=news_byline_content_id
			WHERE content_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND content_parentid=<cfqueryparam value="#nid#" cfsqltype="cf_sql_varchar">
				AND news_byline_display=<cfqueryparam value="1" cfsqltype="cf_sql_integer">
				AND content_id != <cfqueryparam value="#application.exceptions['ssiID']#" cfsqltype="cf_sql_integer">

			ORDER BY news_byline_date DESC
		</cfquery>
		<cfreturn qryNews>
	</cffunction>
	
	<cffunction name="getFooterNews" access="public" returntype="query">
		<cfargument name="numrecs" type="numeric" required="no" default="3">
		<cfargument name="chopped" type="numeric" required="no" default="125">
		<cfset var qryFooterNews="">
		<cfquery name="qryFooterNews" datasource="#application.datasource1#">
			SELECT TOP #numrecs# be.blogentries_title AS title, dbo.udf_stripHTML(be.blogentries_body, #chopped#) AS body, be.blogentries_alias + '.html' AS pagename, bc.blogcategory_thumbnail AS pic
			FROM blogentries be
			LEFT OUTER JOIN blogcategory bc
				ON bc.blogcategory_id=be.blogentries_category
			WHERE be.blogentries_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND be.blogentries_page_status=<cfqueryparam value="1" cfsqltype="cf_sql_integer">
			ORDER BY be.blogentries_date_posted DESC
		</cfquery>
		<cfreturn qryFooterNews>
	</cffunction>
</cfcomponent>

