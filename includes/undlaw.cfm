<cfif contentid EQ application.exceptions['understandID']>
	<cfset News=application.pageData.getNews(nid="#application.exceptions['understandID']#")>
<cfelseif contentid EQ application.exceptions['truckaccID']>
	<cfset News=application.pageData.getNews(nid="#application.exceptions['truckaccID']#")>
</cfif>
<cfquery name="reordernews" dbtype="query">
	SELECT * 
	FROM news
	WHERE news_byline_display=<cfqueryparam value="1" cfsqltype="cf_sql_bit">
	ORDER BY news_byline_date desc
</cfquery>
<cfif News.recordcount GT 0>
	<cfoutput query="reordernews">
		<h3><a href="http://#CGI.SERVER_NAME#/#content_pagename#">#news_byline_title#</a></h3>
		<div class="headline_area">By #news_byline_by# on #DateFormat(news_byline_date, "long")#</div>
	</cfoutput>
</cfif>
