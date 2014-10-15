<cfsilent>
<cfquery name="getowntype" datasource="#application.datasource1#">
    		select	OWNERSHIP from ProviderInfo with (nolock)
			group by OWNERSHIP
    </cfquery>
<cfset cityData=application.nursinghome.getCityTotals(state="#rereplace(application.apnhstate, '-', ' ','all')#")>
<!---	<cfinvoke component="assets.components.nursing-home" method="getCityTotals" returnvariable="cityData">
		<cfinvokeargument name="state" value="#rereplace(application.apnhstate, '-', ' ','all')#" />
	</cfinvoke>--->
<cfparam name="form.nh_state" default=#application.apnhstateabbr#>
<cfparam name="form.nh_beds" default="">
<cfparam name="form.nh_complaints" default="">
<cfparam name="form.nh_inhosp" default="">
<cfparam name="form.nh_rating" default="">
<cfparam name="form.nh_facname" default="">
<cfparam name="form.nh_ownership" default="">
<cfparam name="form.nh_city" default="">
<cfif isdefined('form.nh_state') and form.nh_state neq ''>
	<!---	<cfset NHqryresults=application.nursinghome.getSearchNH(nh_state"#application.apnhstateabbr#",nh_beds="#trim(form.nh_beds)#",nh_complaints="#trim(form.nh_complaints)#",nh_inhosp="#trim(form.nh_inhosp)#",nh_rating="#trim(form.nh_rating)#",nh_facname="#trim(form.nh_facname)#",nh_ownership="#trim(form.nh_ownership)#",nh_city="#trim(form.nh_city)#")>--->
	<cfinvoke component="assets.components.nursing-home" method="getSearchNH" returnvariable="NHqryresults">
	<cfinvokeargument name="nh_state" value="#application.apnhstateabbr#" />
	<cfinvokeargument name="nh_beds" value="#trim(form.nh_beds)#" />
	<cfinvokeargument name="nh_complaints" value="#trim(form.nh_complaints)#" />
	<cfinvokeargument name="nh_inhosp" value="#trim(form.nh_inhosp)#" />
	<cfinvokeargument name="nh_rating" value="#trim(form.nh_rating)#" />
	<cfinvokeargument name="nh_facname" value="#trim(form.nh_facname)#" />
	<cfinvokeargument name="nh_ownership" value="#trim(form.nh_ownership)#" />
	<cfinvokeargument name="nh_city" value="#trim(form.nh_city)#" />
	</cfinvoke>
</cfif>
<cfset getspecialmeta.titletag = "#application.apnhstate# Nursing Home Abuse Lawyers | Ratings | Directory">
<cfset getspecialmeta.metadesc = "Nursing home directory with ratings for all of #application.apnhstate#. Learn what #application.apnhstateabbr# considers Nursing Home Abuse, View Ratings and ask Questions.">
<cfset getspecialmeta.metaKW = "Nursing Home Abuse,nursing home ratings, neglect,attorney,lawyer">
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
						<cfset additionalbc = "Search Nursing Homes - " & application.apnhstate>
						<cfinclude template="breadcrumbsnh.cfm">
						<h1>Search Nursing Homes - #application.apnhstate#</h1>
							<cfform method="post" action="http://#CGI.SERVER_NAME#/nursing-home-search.html" name="nh_search" id="nh_search" class="">
							<div class="row-fluid">
								<div class="span3">
									<label>Name(Optional)</label>
									<cfinput type="text" name="nh_facname" id="nh_facname" value="#form.nh_facname#" placeholder="Facility Name..." />
								</div>
								<div class="span3">
									<label>City</label>
									<cfselect name="nh_city" id="nh_city" >
									<option value="">Any</option>
									<cfloop query="cityData">
										<option value="#cityData.city#" <cfif form.nh_city eq cityData.city>selected</cfif>>#cityData.city#</option>
									</cfloop>
									</cfselect>
								</div>
								<div class="span3">
									<label>Certified Beds</label>
									<cfselect name="nh_beds" id="nh_beds">
									<option value="">Any</option>
									<option value="40" <cfif form.nh_beds eq 40>selected</cfif>>0 - 40</option>
									<option value="80" <cfif form.nh_beds eq 80>selected</cfif>>41 - 80</option>
									<option value="120" <cfif form.nh_beds eq 120>selected</cfif>>81 - 120</option>
									<option value="160" <cfif form.nh_beds eq 160>selected</cfif>>121 - 160</option>
									<option value="200" <cfif form.nh_beds eq 200>selected</cfif>>161 - 200</option>
									<option value="240" <cfif form.nh_beds eq 240>selected</cfif>>201 - 240</option>
									<option value="240+" <cfif form.nh_beds eq "240+">selected</cfif>>241+</option>
									</cfselect>
								</div>
								<div class="span3">
									<label>Overall Rating</label>
									<cfselect name="nh_rating" id="nh_rating">
									<option value="">Any</option>
									<option value="1" <cfif form.nh_rating eq 0>selected</cfif>>1 Star</option>
									<option value="2" <cfif form.nh_rating eq 2>selected</cfif>>2 Stars</option>
									<option value="3" <cfif form.nh_rating eq 3>selected</cfif>>3 Stars</option>
									<option value="4" <cfif form.nh_rating eq 4>selected</cfif>>4 Stars</option>
									<option value="5" <cfif form.nh_rating eq 5>selected</cfif>>5 Stars</option>
									</cfselect>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span3">
									<label>Complaints</label>
									<cfselect name="nh_complaints" id="nh_complaints">
									<option value="">Any</option>
									<option value="0" <cfif form.nh_complaints eq 0>selected</cfif>>0</option>
									<option value="1" <cfif form.nh_complaints eq 1>selected</cfif>>1</option>
									<option value="10" <cfif form.nh_complaints eq 10>selected</cfif>>2-10</option>
									<option value="11+" <cfif form.nh_complaints eq "11+">selected</cfif>>11+</option>
									</cfselect>
								</div>
								<div class="span3">
									<label>Ownership Type?</label>
									<cfselect name="nh_ownership" id="nh_ownership">
									<option value="">Any</option>
									<cfloop query="getowntype">
										<option value="#getowntype.ownership#" <cfif form.nh_ownership eq getowntype.ownership>selected</cfif>>#trim(getowntype.ownership)#</option>
									</cfloop>
									</cfselect>
								</div>
							</div>
							<div class="row-fluid">
									<div class="span3">
										<cfinput type="button" name="btn_find_home" value="Find Nursing Home" class="btn" onclick="submit();">
									</div>
								</div>
							</cfform>
						<div class="wrapper">
							<div class="widget">
								<div class="whead">
									<h6>Matching Results: #NHqryresults.recordcount# records</h6>
									<div class="clear"></div>
								</div>
								<div id="dyn"> <a class="tOptions" title="Options"><img src="http://#CGI.SERVER_NAME#/images/icons/options.png" alt="" /></a>
									<table cellpadding="0" cellspacing="0" border="0" class="dTable table-bordered table-striped" id="dynamic" width="100%">
										<thead>
											<tr>
												<th>Elder Care Facility<span class="sorting" style="display: block;"></span></th>
												<th>Location<span class="sorting" style="display: block;"></span></th>
												<th>Beds<span class="sorting" style="display: block;"></span></th>
												<th>Complaints<span class="sorting" style="display: block;"></span></th>
												<th>Overall Rating<span class="sorting" style="display: block;"></span></th>
											</tr>
										</thead>
										<tbody>
											<cfloop query="NHqryresults">
												<tr>
													<td><a href="http://#CGI.SERVER_NAME#/#Replace(LCase(nh_name),' ','-','ALL')#-#ReReplace(LCase(application.misc.getfullstatename(nh_state)),' ','-','all')#-#provnum#-nh-information.html">#nh_name#</a></td>
													<td>#Location#</td>
													<td class="center">#num_beds#</td>
													<td class="center">#num_complaints#</td>
													<td class="center">#application.misc.ratingsystem(val(rating))#</td>
												</tr>
											</cfloop>
										</tbody>
									</table>
								</div>
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