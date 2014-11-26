

<cfif isDefined("contentid") AND contentid EQ application.exceptions["settlementID"]>
	<cfset settlements=application.pageData.getSettlements()>
</cfif>
<cfinclude template="includes/head.cfm">
<body class="interior">
<cfinclude template="includes/header.cfm">
<div id="wrapper">
	<div class="container content">
		<div class="row-fluid">
			<section class="span8">
				<div class="center-content">
				<!---<h1>404 - Page Not Found</h1><cfheader statuscode="410" statustext="File Gone"> <cfset inet_address = CreateObject("java", "java.net.InetAddress")> 
<cfset host_name = inet_address.getByName("#cgi.REMOTE_HOST#").getHostName()><cfif host_name NEQ '50-192-156-189-static.hfc.comcastbusiness.net'>
<cfset local.source= "Not Yet Categorized">
<cfif findnocase('msn',host_name)>
<cfset local.source = "MSN">
<cfelseif findnocase('google',host_name)>
<cfset local.source = "Google">
</cfif>
<cfif local.source NEQ 'Not Yet Categorized'>
<cfmail
		to = "tech@pmpmg.com,tdevaney@pmpmg.com"
		failto = "failto@attorneycontrolcenter.com"
		from = "tech@pmpmg.com"
		subject = "#local.source# - 404 Missing Page on #cgi.SERVER_NAME#"
		cc = ""
		type="html"
		server = "mail.attorneycontrolcenter.com" port="587"
		username = "leads"
		password = "coke18!!">
Offsite Host: #host_name# could not find this page: #cgi.QUERY_STRING#

		</cfmail></cfif></cfif>--->
					<img src="/assets/images/404-page-not-found.jpg" class="img-polaroid" alt="page not found"/> 
						<cfoutput>
							<cfinclude template="includes/sitemap.txt">
					</cfoutput>
				</div>
			</section>
			<cfinclude template="includes/sidebar.cfm">
		</div>
		<div class="row-fluid">
			<div class="span12" id="back-top"><a href="#top" class="back-to-top">Back to Top</a></div>
		</div>
	</div>
</div>

<cfinclude template="includes/footer.cfm">
</body>
</html>