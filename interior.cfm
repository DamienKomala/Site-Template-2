
<cfif isDefined("contentid") AND contentid EQ application.exceptions["settlementID"]>
	<cfset settlements=application.pageData.getSettlements()>
</cfif>
<cfinclude template="includes/head.cfm">
<body class="interior">
<cfinclude template="includes/header.cfm">
<cfoutput>
<cfif (isdefined("contentid") AND isDefined('application.exceptions["workcompID"]') AND contentid EQ application.exceptions["workcompID"]) OR (isDefined("pageinfo.parentid") AND isDefined('application.exceptions["workcompID"]') AND pageinfo.parentid EQ application.exceptions["workcompID"])>
	<div class="container workers-comp">
		<div class="row-fluid">
			<div class="span12">
				<p><a href="/workers-compensation-attorney.html" data-toggle="tooltip"  data-placement="bottom" title="North Carolina Workers Compensation Center">North Carolina Workers' Compensation Center</a></p>
			</div>
		</div>
	</div>
</cfif>
<div id="wrapper">
	<div class="container content">
		<div class="row-fluid">
			<section class="span8">
				<div class="center-content">
					<cfif isDefined("contentid")>
						<cfif isDefined("category")>
							#application.misc.getBreadCrumbs(contentid=val(contentid))#
							<h1>#getCalItems.catname# Blog Posts</h1>
						<cfelseif isDefined("date")>
							#application.misc.getBreadCrumbs(contentid=val(contentid))#
							<h1>#MonthAsString(calMonth)# #calDay#, #calYear# Posts</h1>
						<cfelseif isDefined("caldt")>
							#application.misc.getBreadCrumbs(contentid=val(contentid))#
							<h1>#MonthAsString(calMonth)# #calYear# Blog Archives</h1>
						<cfelse>
							#application.misc.getBreadCrumbs(contentid=val(contentid))#
							<h1>#pageinfo..title#</h1>
						</cfif>
					<cfelseif isDefined("blogid")>
						#application.misc.getBreadCrumbs(blogid=val(blogid))#
						<cfif isDefined("getCalItems") AND getCalItems.recordcount GT 0>
							<h1>#getCalItems.h1Tag#</h1>
						<cfelse>
							<h1>#pageinfo..title#</h1>
						</cfif>
						<cfinclude template="includes/blog.cfm">
					<cfelseif isDefined("attorneyid")>
						#application.misc.getBreadCrumbs(attorneyid=val(attorneyid))#
						<h1>#pageinfo..title#</h1>
						<cfinclude template="includes/attorney.cfm">
					</cfif>
					<cfif isDefined("contentid") AND isDefined('application.exceptions["resultsID"]') AND contentid EQ application.exceptions["resultsID"]>
						#Replace(pageinfo.body1,'{server_name}',CGI.SERVER_NAME,'ALL')#
						<cfinclude template="includes/results.cfm">
					<cfelseif isDefined("attorneyid")>
						
					<cfelseif (isDefined("contentid") AND isDefined('application.exceptions["blgID"]') AND contentid EQ application.exceptions["blgID"])>
						#Replace(pageinfo.body1,'{server_name}',CGI.SERVER_NAME,'ALL')#
						<cfinclude template="includes/blog.cfm">
					<cfelseif isDefined("blogid")>
					<cfelseif isDefined("contentid") AND isDefined('application.exceptions["contactID"]') AND contentid EQ application.exceptions["contactID"]>
						#Replace(pageinfo.body1, '{server_name}',CGI.SERVER_NAME, 'ALL')#
						<cfinclude template="includes/contact_caseevaluation.cfm">
						<cfif isDefined("pageinfo.body2") AND pageinfo..body2 NEQ "">
							#Replace(pageinfo.body2, '{server_name}',CGI.SERVER_NAME, 'ALL')#
						</cfif>
					<cfelseif isDefined("contentid") AND isDefined('application.exceptions["newsID"]') AND contentid EQ application.exceptions["newsID"]>
						#Replace(pageinfo.body1,'{server_name}',CGI.SERVER_NAME,'ALL')#
						<cfset News=application.pageData.getNews()>
						<cfif News.recordcount GT 0>
							<h2>Daily North Carolina News</h2>	
							<ul>
								<cfloop query="News">
									<li><h4><a href="http://#CGI.SERVER_NAME#/#content_pagename#">#content_title#</a></h4>#DATEFORMAT(news_byline_date,"LONG")#</li>
								</cfloop>
							</ul>
						</cfif>
						<h2>The Lewis Family Highlighted News</h2>
						#Replace(pageinfo.body2,'{server_name}',CGI.SERVER_NAME,'ALL')#
						-----
						<cfinclude template="includes/xmlfeed.cfm">
					<cfelseif isDefined("contentid") AND contentid EQ application.exceptions["unsubID"]>
						<cfinclude template="../commonfiles/includes/unsub2.cfm">						
					<cfelse>
						#Replace(pageinfo.body1, '{server_name}',CGI.SERVER_NAME, 'ALL')#
						<cfif isDefined("pageinfo.body2") AND pageinfo..body2 NEQ "">
							#Replace(pageinfo.body2, '{server_name}',CGI.SERVER_NAME, 'ALL')#
						</cfif>
					</cfif>
<!---					<cfinclude template="includes/socialite.cfm">--->
				</div>
			</section>
			<cfinclude template="includes/sidebar.cfm">
		</div>
		<div class="row-fluid">
			<div class="span12" id="back-top"><a href="##top" class="back-to-top">Back to Top</a></div>
		</div>
	</div>
</div>
</cfoutput>
<cfinclude template="includes/footer.cfm">
</body>
</html>