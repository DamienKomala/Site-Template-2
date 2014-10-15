<cfif fileexists("#session.parentdirectory#\sitemap.xml")>
	<cffile action="delete" file="#session.parentdirectory#\sitemap.xml">
</cfif>
<cfset lineBreak=Chr(13) & Chr(10)>
<cfset xmlstring="">
<cfquery name="qrySite" datasource="#application.datasource1#">
	SELECT 'c'+CAST(content_id AS varchar) ID, content_navorder navorder, content_page_status pagestatus, content_type_id type, 'c'+CAST(content_parentid AS varchar) parent, content_website_id website, CASE WHEN (content_pagename='') THEN '/' ELSE content_pagename END pagename, 'content' source, CASE WHEN (content_pagename='') THEN content_titletag ELSE content_title END title, content_date_altered AS altered_date
	FROM content
	WHERE content_website_id = <cfqueryparam value="#session.domainid#" cfsqltype="cf_sql_integer">
		AND content_page_status = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
		AND content_sitemap = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
	UNION
	SELECT 'a'+CAST(attorney_id AS varchar) ID, attorney_navorder navorder, attorney_page_status pagestatus, 2 type, 'c'+CAST(attorney_parentid AS varchar) parent, attorney_website_id website, attorney_pagename pagename, 'attorney' source, attorney_firstname + ' ' + attorney_lastname title, attorney_date_altered AS altered_date
	FROM attorney
	WHERE attorney_website_id = <cfqueryparam value="#session.domainid#" cfsqltype="cf_sql_integer">
		AND attorney_page_status = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
		AND attorney_sitemap = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
	ORDER BY parent,navorder
</cfquery>

<cfquery name="qryBlog" datasource="#application.datasource1#">
	SELECT 'b'+CAST(be.blogentries_id AS varchar) ID, 0 navorder, be.blogentries_released pagestatus, 4 type, 'b'+(SELECT CAST(content_id AS varchar) FROM content WHERE content_website_id=16 AND  content_pagename='blog/') parent, be.blogentries_websiteid website, 'blog/' + be.blogentries_alias+'.html' pagename, 'blogentries' source, be.blogentries_title title, be.blogentries_date_posted altered_date, bc.blogcategory_alias AS category
	FROM blogentries be
		LEFT OUTER JOIN blogcategory bc ON bc.blogcategory_id=be.blogentries_category
	WHERE blogentries_websiteid = <cfqueryparam value="#session.domainid#" cfsqltype="cf_sql_integer">
		AND blogentries_released = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
	ORDER BY title
</cfquery>

<cfquery name="blogCats" dbtype="query">
	SELECT DISTINCT category + '.html' AS pagename, MAX(altered_date) AS altered_date
	FROM qryBlog
	WHERE category IS NOT NULL
	GROUP BY category
	ORDER BY category
</cfquery>

<cfquery name="blogDates" dbtype="query">
	SELECT DISTINCT altered_date
	FROM qryBlog
	ORDER BY altered_date DESC
</cfquery>
<cfset dtList="">
<cfloop query="blogDates">
	<cfif NOT ListContains(dtList,DATEFORMAT(altered_date,"M-D-YYYY"),"|")>
		<cfset dtList=ListAppend(dtList,DATEFORMAT(altered_date,"M-D-YYYY"),"|")>
	</cfif>
</cfloop>
<cfset calList="">
<cfset calList2="">
<cfloop query="blogDates">
	<cfif NOT ListContains(calList,DATEFORMAT(altered_date,"M-YYYY"),"|")>
		<cfset calList=ListAppend(calList,DATEFORMAT(altered_date,"M-YYYY"),"|")>
		<cfset calList2=ListAppend(calList2,altered_date,"|")>
	</cfif>
</cfloop>

<cfsetting enablecfoutputonly="true" showdebugoutput="false">
<cfprocessingdirective pageencoding="utf-8">
<cfoutput>
<cfset xmlstring='<?xml version="1.0" encoding="UTF-8"?>' & lineBreak>
<cfset xmlstring=xmlstring & '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' & lineBreak>
<cfset xmlstring=xmlstring & '	<url>' & lineBreak>
<cfset xmlstring=xmlstring & '		<loc>http://#CGI.SERVER_NAME#/</loc>' & lineBreak>
<cfset xmlstring=xmlstring & '		<lastmod>#DATEFORMAT(now(),"YYYY-MM-DD")#</lastmod>' & lineBreak>
<cfset xmlstring=xmlstring & '		<changefreq>daily</changefreq>' & lineBreak>
<cfset xmlstring=xmlstring & '		<priority>1</priority>' & lineBreak>
<cfset xmlstring=xmlstring & '	</url>' & lineBreak>
	<cfloop query="qrySite">
<cfset xmlstring=xmlstring & '	<url>' & lineBreak>
<cfset xmlstring=xmlstring & '		<loc>http://#CGI.SERVER_NAME#/#pagename#</loc>' & lineBreak>
<cfset xmlstring=xmlstring & '    	<lastmod>#DATEFORMAT(altered_date,"YYYY-MM-DD")#</lastmod>' & lineBreak>
<cfset xmlstring=xmlstring & '    	<changefreq>daily</changefreq>' & lineBreak>
<cfset xmlstring=xmlstring & '    	<priority>0.5</priority>' & lineBreak>
<cfset xmlstring=xmlstring & '	</url>' & lineBreak>
	<cfif pagename EQ "blog/">
	<cfloop query="qryBlog">
<cfset xmlstring=xmlstring & '	<url>' & lineBreak>
<cfset xmlstring=xmlstring & '		<loc>http://#CGI.SERVER_NAME#/#pagename#</loc>' & lineBreak>
<cfset xmlstring=xmlstring & '    	<lastmod>#DATEFORMAT(altered_date,"YYYY-MM-DD")#</lastmod>' & lineBreak>
<cfset xmlstring=xmlstring & '    	<changefreq>daily</changefreq>' & lineBreak>
<cfset xmlstring=xmlstring & '    	<priority>0.5</priority>' & lineBreak>
<cfset xmlstring=xmlstring & '	</url>' & lineBreak>
	</cfloop>
	<cfloop index="x" from="1" to="#listLen(dtList,'|')#">
<cfset xmlstring=xmlstring & '	<url>' & lineBreak>
<cfset xmlstring=xmlstring & '		<loc>http://#CGI.SERVER_NAME#/lawyer-blog-#ListGetAt(dtList,x,"|")#.html</loc>' & lineBreak>
<cfset xmlstring=xmlstring & '		<lastmod>#DateFormat(ListGetAt(dtList,x,"|"),"YYYY-MM-DD")#</lastmod>' & lineBreak>
<cfset xmlstring=xmlstring & '		<changefreq>daily</changefreq>' & lineBreak>
<cfset xmlstring=xmlstring & '		<priority>0.5</priority>' & lineBreak>
<cfset xmlstring=xmlstring & '	</url>' & lineBreak>
	</cfloop>
	<cfloop index="x" from="1" to="#listLen(calList,'|')#">
<cfset xmlstring=xmlstring & '	<url>' & lineBreak>
<cfset xmlstring=xmlstring & '		<loc>http://#CGI.SERVER_NAME#/blog/calendar/#ListGetAt(calList,x,"|")#.html</loc>' & lineBreak>
<cfset xmlstring=xmlstring & '		<lastmod>#DateFormat(ListGetAt(calList2,x,"|"),"YYYY-MM-DD")#</lastmod>' & lineBreak>
<cfset xmlstring=xmlstring & '		<changefreq>daily</changefreq>' & lineBreak>
<cfset xmlstring=xmlstring & '		<priority>0.5</priority>' & lineBreak>
<cfset xmlstring=xmlstring & '	</url>' & lineBreak>
	</cfloop>
	<cfloop query="blogCats">
<cfset xmlstring=xmlstring & '	<url>' & lineBreak>
<cfset xmlstring=xmlstring & '		<loc>http://#CGI.SERVER_NAME#/blog/category/#pagename#</loc>' & lineBreak>
<cfset xmlstring=xmlstring & '    	<lastmod>#DATEFORMAT(altered_date,"YYYY-MM-DD")#</lastmod>' & lineBreak>
<cfset xmlstring=xmlstring & '    	<changefreq>daily</changefreq>' & lineBreak>
<cfset xmlstring=xmlstring & '    	<priority>0.5</priority>' & lineBreak>
<cfset xmlstring=xmlstring & '	</url>' & lineBreak>
	</cfloop>
	</cfif>
	</cfloop>
<cfset xmlstring=xmlstring & '</urlset>' & lineBreak>
</cfoutput>

<cffile action="write" file="#session.parentdirectory#\sitemap.xml" output="#xmlstring#">