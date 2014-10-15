<cfif isDefined("catid")>
	<cfset siteBlogs=application.pageData.getBlogs(category="#catid#")>
<cfelseif isDefined("date")>
	<cfset siteBlogs=application.pageData.getBlogs(date="#date#")>
<cfelseif isDefined("caldt")>
	<cfset siteBlogs=application.pageData.getBlogs(caldt="#caldt#")>
<cfelse>	
	<cfset siteBlogs=application.pageData.getBlogs()>
</cfif>


<cfif isDefined("blogid")>
	<cfoutput query="pageInfo">
			<p><small class="meta-data">Posted<cfif LEFT(siteBlogs.author, 3) NEQ " On "> By </cfif>#siteBlogs.author# on #DATEFORMAT(dateposted,"long")# in <a href="http://#CGI.SERVER_NAME#/blog/category/#blogcategory_alias#.html">#category#</a></small></p>
		#REPLACE(body, "{server_name}", CGI.SERVER_NAME, "ALL")#
	</cfoutput>

<cfelse>
	<cfif siteBlogs.recordcount EQ 0 AND (isDefined("calMonth") AND isDefined("calYear"))>
		No Blog Entries found for <cfoutput>#MonthAsString(calMonth)# #calYear#</cfoutput>
	<cfelseif siteBlogs.recordcount EQ 0>
		No Blog Entries found for your selection.
	<cfelse>
		<cfoutput query="siteBlogs">
			<h2 class="meta-data"><a href="http://#CGI.SERVER_NAME#/blog/#blogentries_alias#.html">#blogentries_title#</a></h2>
			<p><small class="meta-data">Posted<cfif left(author,3) NEQ "On "> By</cfif> #author# on #DATEFORMAT(dateposted,"long")# in <a href="http://#CGI.SERVER_NAME#/blog/category/#catAlias#.html">#category#</a></small></p>
			<p>#disp#...<a href="http://#CGI.SERVER_NAME#/blog/#blogentries_alias#.html">Read More</a></p>
			<hr />
		</cfoutput>
	</cfif>
</cfif>
