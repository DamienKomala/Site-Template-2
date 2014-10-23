<cfheader statuscode="404" statustext="File Not Found">

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
				<!---<h1>404 - Page Not Found</h1>--->
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