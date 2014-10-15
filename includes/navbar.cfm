<cfquery name="par1" datasource="#application.datasource1#">
	SELECT content_id, content_pagename, content_navbar, content_navdescriptor
	FROM content 
	WHERE content_parentid=0
		AND content_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
		AND content_page_status=<cfqueryparam value="1" cfsqltype="cf_sql_integer">
		AND content_type_id IN (<cfqueryparam value="1,2" cfsqltype="cf_sql_varchar" list="yes">)
	ORDER BY content_navorder ASC
</cfquery>

<ul class="nav">
<cfoutput query="par1">
	<cfquery name="getKids" datasource="#application.datasource1#">
		SELECT content_id AS id, content_pagename AS pagename, content_navbar AS navbar, content_navdescriptor AS navdescriptor, content_navorder AS navorder
		FROM content
		WHERE content_parentid=<cfqueryparam value="#content_id#" cfsqltype="cf_sql_integer">
			AND content_page_status=<cfqueryparam value="1" cfsqltype="cf_sql_integer">
		UNION ALL
		SELECT attorney_id AS id, attorney_pagename AS pagename, attorney_navbar AS navbar, '' AS navdescriptor, attorney_navorder AS navorder
		FROM attorney
		WHERE attorney_parentid=<cfqueryparam value="#content_id#" cfsqltype="cf_sql_integer">
			AND attorney_page_status=<cfqueryparam value="1" cfsqltype="cf_sql_integer">
		<cfif content_id EQ 5306>
		ORDER BY navbar ASC
		<cfelse>
		ORDER BY navorder ASC
		</cfif>
	</cfquery>
	<cfset children=ValueList(getKids.id,"|")>
	<li class="<cfif (NOT isDefined('contentid') AND NOT isDefined('attorneyid') AND NOT isDefined('blogid') AND content_pagename EQ '/') OR (isDefined('contentid') AND contentid EQ #content_id#) OR (isDefined('contentid') AND ListContains(children,contentid,"|") OR isDefined("attorneyid") AND ListContains(children, attorneyid,"|"))> active</cfif><cfif getKids.recordcount GT 0 AND NOT listcontains("5408|5413",content_id,"|")> dropdown</cfif>">
		<a href="http://#CGI.SERVER_NAME#<cfif content_pagename NEQ "/">/#content_pagename#<cfelse>/</cfif>"<cfif content_pagename EQ "index.cfm" or content_pagename EQ "/"> class="home"<cfelseif getKids.recordcount GT 0 AND getKids.id NEQ 4239 AND NOT listcontains("5408|5413",content_id,"|")> class="dropdown-toggle" data-toggle="dropdown"</cfif>>#content_navbar#</a>
		<cfif getKids.recordcount GT 0 AND NOT listcontains("5408|5413",content_id,"|")>
			<ul class="dropdown-menu">
				<li><a href="http://#CGI.SERVER_NAME#/#content_pagename#">#content_navbar#</a></li>
				<cfloop index="x" from="1" to="#getKids.recordcount#">
				<li><a href="http://#CGI.SERVER_NAME#/#getKids.pagename[x]#">#getKids.navbar[x]#</a></li>
				</cfloop>
			</ul>
		</cfif>
	</li>
</cfoutput>
</ul>