<cfset arrBreadCrumbs=ArrayNew(2)>
<cffunction name="CollectBreadCrumbs" access="public" returntype="void" output="yes">
	<cfargument name="tbl" type="string" required="yes" default="c" />
	<cfargument name="itemID" type="numeric" required="yes" default="0" />
	<cfset var BREADCRUMBS = StructNew() />
	<cfquery name="qryBreadcrumbs" datasource="#application.datasource1#">
		<cfif tbl EQ "a">
			SELECT 'c' AS tbl, attorney_id AS itmID, attorney_parentid AS parID, attorney_pagename AS pagename, attorney_navbar AS display
			FROM attorney 
			WHERE attorney_id=<cfqueryparam value="#itemID#" cfsqltype="cf_sql_integer">
		<cfelseif tbl EQ "b">
			SELECT 'b' AS tbl, b.blogentries_id AS itmID,c.blogcategory_name AS catname, 'category/' + c.blogcategory_alias AS catAlias, c.blogcategory_id AS parID, 'www' + b.blogentries_alias + '.html' AS pagename, b.blogentries_title AS display
			FROM blogentries b
				LEFT OUTER JOIN blogcategory c 
					ON c.blogcategory_id=b.blogentries_category
			WHERE b.blogentries_id=<cfqueryparam value="#itemID#" cfsqltype="cf_sql_integer">
		<cfelseif tbl EQ "c">
			SELECT 'c' AS tbl, content_id AS itmID, content_parentid AS parID, content_pagename AS pagename, content_navbar AS display
			FROM content
			WHERE content_id=<cfqueryparam value="#itemID#" cfsqltype="cf_sql_integer">
		<cfelseif tbl EQ "t">
			SELECT 't' AS tbl, blogcategory_ID AS itmID, (SELECT content_id FROM content WHERE content_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer"> AND content_pagename = <cfqueryparam value="blog/" cfsqltype="cf_sql_varchar">) AS parID, 'blog/catid=' + CAST(blogcategory_ID AS varchar) AS pagename, blogcategory_name AS display
			FROM blogcategory
			WHERE blogcategory_id=<cfqueryparam value="#itemID#" cfsqltype="cf_sql_integer">
		</cfif>
	</cfquery>
	<cfset tmp=ArrayPrepend(arrBreadCrumbs[1], qryBreadcrumbs.display)>
	<cfset tmp=ArrayPrepend(arrBreadCrumbs[2], qryBreadcrumbs.pagename)>
	<cfif qryBreadCrumbs.tbl EQ "t">
		<cfset tmp=ArrayPrepend(arrBreadCrumbs[1], "Blog")>
		<cfset tmp=ArrayPrepend(arrBreadCrumbs[2], "blog/")>
	<cfelseif qryBreadCrumbs.parID NEQ 0 AND qryBreadCrumbs.parID NEQ '' AND qryBreadCrumbs.tbl NEQ "b">
		<cfset CollectBreadCrumbs(tbl=#qryBreadCrumbs.tbl#, itemID=#qryBreadCrumbs.parID#) />
	<cfelseif qryBreadCrumbs.tbl EQ "b">
		<cfset tmp=ArrayPrepend(arrBreadCrumbs[1], qryBreadcrumbs.catname)>
<!---		<cfset tmp=ArrayPrepend(arrBreadCrumbs[2], "blog/catid=#qryBreadcrumbs.parID#")>--->
		<cfset tmp=ArrayPrepend(arrBreadCrumbs[2], "blog/#qryBreadcrumbs.catAlias#.html")>
		<cfset tmp=ArrayPrepend(arrBreadCrumbs[1], "blog")>
		<cfset tmp=ArrayPrepend(arrBreadCrumbs[2], "blog/")>
	</cfif>
</cffunction>

<cfoutput>
<div class="breadcrumbs">

<!---<cfif isDefined("catid") AND catid NEQ "">
	<cfset CollectBreadCrumbs(tbl="t", itemID=#catid#) />--->
<cfif isDefined("category") AND category NEQ "">
	<cfquery name="getCatId" datasource="#application.datasource1#">
		SELECT blogcategory_id
		FROM blogcategory
		WHERE blogcategory_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
			AND blogcategory_alias=<cfqueryparam value="#LEFT(category,LEN(category)-5)#" cfsqltype="cf_sql_varchar">
	</cfquery>
	<cfset CollectBreadCrumbs(tbl="t", itemID=#getCatId.blogcategory_id#)/>
<cfelseif isDefined("date") AND date NEQ "">
		<cfset tmp=ArrayPrepend(arrBreadCrumbs[1], "Blog")>
		<cfset tmp=ArrayPrepend(arrBreadCrumbs[2], "blog/")>
		<cfset tmp=ArrayAppend(arrBreadCrumbs[1], DateFormat(LEFT(date,LEN(date)-5),"dd mmmm yyyy"))>
<cfelseif isDefined("contentid") AND contentid NEQ "">
	<cfset CollectBreadCrumbs(tbl="c", itemID=#contentid#) />
<cfelseif isDefined("attorneyid") AND attorneyid NEQ "">
	<cfset CollectBreadCrumbs(tbl="a", itemID=#attorneyid#) />
<cfelseif isDefined("blogid") AND blogid NEQ "">
	<cfset CollectBreadCrumbs(tbl="b", itemID=#blogid#) />
</cfif>

<a href="http://#CGI.SERVER_NAME#">Home</a> 
<cfloop index="x" from="1" to="#arrayLen(arrBreadCrumbs[1])#">
 / 
<cfif x LT arrayLen(arrBreadCrumbs[1])>
<a href="http://#CGI.SERVER_NAME#/#arrBreadCrumbs[2][x]#">#arrBreadCrumbs[1][x]#</a>
 <cfelse>
 	<cfif isDefined("contentid") AND contentid EQ 4123>
		Thank You
	<cfelse>
		 #arrBreadCrumbs[1][x]#
 	</cfif>
 </cfif>
</cfloop>
</div>
</cfoutput>
