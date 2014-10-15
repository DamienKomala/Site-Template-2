<cfsilent>
<cfset hdrimg = "nh_" & RandRange(stnum, endnum, "SHA1PRNG") & ".jpg">
<cfif isDefined("nh_city") AND isDefined("nh_state")>
	<cfset homeData=application.nursinghome.getCityHomes(city="#rereplace(nh_city, '-', ' ','all')#",state="#rereplace(nh_state, '-', ' ','all')#")>
	<cfelse>
	<cfset cityData=application.nursinghome.getCityTotals(state="#rereplace(nh_state, '-', ' ','all')#")>
</cfif>
<cfset getspecialmeta.titletag = "#Replace(ReReplace(nh_city,"\b(\w)","\u\1","ALL"), '_',' ','ALL')# #application.apnhstate#: Comprehensive Nursing Home Directory  | Legal Assistance ">
<cfset getspecialmeta.metadesc = "Research #Replace(ReReplace(nh_city,"\b(\w)","\u\1","ALL"), '_',' ','ALL')#  #application.apnhstateabbr# nursing home ratings, rankings and legal advice.">
<cfset getspecialmeta.metaKW = "#Replace(ReReplace(nh_city,"\b(\w)","\u\1","ALL"), '_',' ','ALL')#  Nursing Homes, Abuse,neglect,attorney,lawyer">
<cfset statename=application.misc.getfullstatename(lcase(nh_state))>
</cfsilent>
<cfoutput>
	<cfinclude template="head.cfm">
	<body class="interior nursinghome">
	<cfinclude template="header.cfm">
	<div id="wrapper">
		<div class="container content">
			<div class="row-fluid"> 
				<cfif showsidebar eq 1>  
				<!---page is full screen--->
				<div class="span8">
					<div class="center-content"> 
						<cfelse> 
				<div class="span12">
					<div class="center-content"> 
				</cfif>
						<cfset additionalbc = 'Nursing Homes in <span class="capit">' & #Replace(nh_city, '_',' ','ALL')# & ',</span> <span class="capit">' & #statename# & '</span>'>
						<cfinclude template="breadcrumbsnh.cfm">
						<img src="http://#CGI.SERVER_NAME#/images/nhimages/#hdrimg#" class="img-polaroid" alt="#application.apnhstate# Nursing Homes" />
								<h1>Nursing Homes in <span class="capit">#Replace(nh_city, '_',' ','ALL')#,</span> <span class="capit">#statename#</span></h1>
						<section class="row-fluid">
							<div class="span12">
								<div class="widget">
									<div class="whead">
										<h4>Matching Results for <span class="capit">#Replace(nh_city, '_',' ','ALL')#,</span> <span class="capit">#statename#</span></h4>
										<div class="clear"></div>
									</div>
									<div id="dyn"> <a class="tOptions" title="Options"><img src="images/icons/options.png" alt="" /></a>
										<table cellpadding="0" cellspacing="0" border="0" class="dTable table-bordered table-striped" id="dynamic" width="100%">
											<thead>
												<tr>
													<cfif isDefined("cityData")>
														<th>City<span class="sorting" style="display: block;"></span></th>
														<th>Nursing Homes Found</th>
														<cfelse>
														<th>Nursing Home<span class="sorting" style="display: block;"></span></th>
														<th>Overall Rating</th>
													</cfif>
												</tr>
											</thead>
											<tbody>
												<cfif isDefined("cityData")>
													<cfloop query="cityData">
														<tr>
															<td><a href="http://#CGI.SERVER_NAME#/nursing-homes-#Replace(lcase(city),' ','_','ALL')#-#LCASE(state_abbr)#.html">#city# Nursing Homes</a></td>
															<td>#GroupCount#</td>
														</tr>
													</cfloop>
													<cfelseif isDefined("homeData")>
													<cfloop query="homeData">
														<tr>
															<td><a href="#LCASE('http://' & CGI.SERVER_NAME & '/' & Replace(nh_name,' ','-','ALL') & '-' & ReReplace(statename,' ','-','all') & '-' & provnum & '-nh-information.html')#">#nh_name#</a></td>
															<td>#application.misc.ratingsystem(val(rating))#</td>
														</tr>
													</cfloop>
												</cfif>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</section>
					</div>
					</div>
					<cfif showsidebar eq 1>
						<cfinclude template="NHsidebar.cfm">
					</cfif>
				</div>
				<div class="row-fluid">
					<div class="span12" id="back-top"><a href="##top" class="back-to-top">Back to Top</a></div>
				</div>
			</div>
		</div>
	</div>
	<cfinclude template="footer.cfm">
	
	</body>
	</html>
</cfoutput>