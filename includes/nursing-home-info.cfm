<cfif not isdefined('nh_id')>
	<cfabort>
</cfif>
<cfsilent>
<cfset nhData=application.nursinghome.getNHData(#nh_id#)>
<cfset getspecialmeta.titletag = "#nhData.data.facName#, #ReReplace(nhData.data.city,"\b(\w)","\u\1","ALL")# #application.apnhstateabbr#: Nursing Home Reviews, Ratings and Free Legal Advice">
<cfset getspecialmeta.metadesc = "Find information on the #nhData.data.facName# Nursing Home in #application.apnhstate#. Ask legal questions for free!">
<cfset getspecialmeta.metaKW = "#application.apnhstate# Nursing Home Abuse Lawyers,neglect,attorney,lawyer">
</cfsilent>
<cfoutput>
	<cfinclude template="head.cfm">
	<body class="interior nursinghome">
	<cfinclude template="header.cfm">
	<div id="wrapper">
		<div class="container content">
			<div class="row-fluid"> 
				<cfif showsidebar eq 1>  
				<div class="span8">
					<div class="center-content"> 
				<cfelse> 
				<div class="span12">
					<div class="center-content"> 
				</cfif>
						<cfset citybc = '<a href="http://#CGI.SERVER_NAME#/nursing-homes-' & Replace(lcase(nhData.data.city),' ','_','ALL') & '-' & LCASE(application.apnhstateabbr) & '.html">' & Replace(nhData.data.city,'_',' ','ALL') & ' Nursing Homes</a>'>
						<cfset additionalbc = citybc & " / " & nhData.data.facName>
						<cfinclude template="breadcrumbsnh.cfm">
						<h1>#nhData.data.facName# Nursing Home - #nhData.data.city#, #application.apnhstate#</h1>
						<section class="row-fluid">
							<div class="span8">
								<cfinclude template="nh_general_info.cfm">
							</div>
							<div class="span4">
								<cfset nhaddress = nhData.data.address & "," & nhData.data.city & ", " & nhData.data.state_information_name & " " & nhData.data.zip>
								<cfset nhtitle = trim(nhData.data.facName)>
								<cfinclude template="map.cfm">
							</div>
						</section>
						<script>
						jQuery(function ($) {
							$("a").tooltip()
						});
					</script>
						<div class="row-fluid">
							<div class="span12">
								<div class="span4 boxnh">
									<h3><b>#nhData.data.facName# Complaints</b></h3>
									<div class="row-fluid">
										<div class="span9">Number of Complaints</div>
										<div class="span3">#nhData.data.num_complaints#</div>
									</div>
									<div class="row-fluid">
										<div class="span9">Number of Penalties</div>
										<div class="span3">#nhData.data.num_penalties#</div>
									</div>
									<div class="row-fluid">
										<div class="span9">Number of Fines</div>
										<div class="span3">#nhData.data.num_fines#</div>
									</div>
									<div class="row-fluid">
										<div class="span9">Amount of Fines</div>
										<div class="span3">#NumberFormat(nhData.data.fines_amt,"_$___.__")#</div>
									</div>
								</div>
								<div class="span4 boxnh">
									<h3><b>#nhData.data.facName# Ratings</b></h3>
									<div class="row-fluid">
										<div class="span9"><a class="ratingTooltip" href="##" data-toggle="tooltip" data-placement="right" title="Health inspection ratings are based on the three most recent comprehensive (annual) inspections, and inspections due to complaints in the last three years. More emphasis is placed on recent inspections.">Health Rating</a></div>
										<div class="span3">#application.misc.ratingsystem(nhData.data.survey_rating)#</div>
									</div>
									<div class="row-fluid">
										<div class="span9" ><a class="ratingTooltip" href="##" data-toggle="tooltip" data-placement="right" title="'Quality Measures' ratings are derived from clinical data reported by the nursing home">QM Rating</a></div>
										<div class="span3">#application.misc.ratingsystem(nhData.data.quality_rating)#</div>
									</div>
									<div class="row-fluid">
										<div class="span9"><a class="ratingTooltip" href="##" data-toggle="tooltip" data-placement="right" title="Total staffing includes RNs, LPNs, LVNs and CNAs. Staffing data are submitted by the facility.">Staffing Rating</a></div>
										<div class="span3"> #application.misc.ratingsystem(nhData.data.staffing_rating)# </div>
									</div>
									<div class="row-fluid">
										<div class="span9"><a class="ratingTooltip" href="##" data-toggle="tooltip" data-placement="right" title="Registered Nurse (RN) hours per resident day. Staffing data are submitted by the facility.">RN Staffing Rating</a></div>
										<div class="span3">#application.misc.ratingsystem(nhData.data.RN_staffing_rating)#</div>
									</div>
									<div class="row-fluid">
										<div class="span9"><strong>Overall Rating</strong></div>
										<div class="span3">#application.misc.ratingsystem(nhData.data.overall_rating)#</div>
									</div>
								</div>
								<div class="span4 boxnh">
									<h3><b>Additional Information on #nhData.data.facName#</b></h3>
									<div class="row-fluid">
										<div class="span9">Resident or Family Counseling?</div>
										<div class="span3">#nhData.data.resfamcouncil#</div>
									</div>
									<div class="row-fluid">
										<div class="span9">Continuing Care Retirement Community?</div>
										<div class="span3">
											<cfif nhData.data.cont_care_ret_comm EQ "Y">
												Yes
												<cfelse>
												No
											</cfif>
										</div>
									</div>
									<br />
									<div class="row-fluid">
										<div class="span9">Special Focus Facility?</div>
										<div class="span3">
											<cfif nhData.data.spec_focus_fac EQ "Y">
												Yes
												<cfelse>
												No
											</cfif>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="wrapper">
								<div class="widget">
									<div class="whead" style="padding-left:12px;">
										<h4>#nhData.data.facName# - #application.apnhstateabbr# Nursing Home Deficiencies: Reported from #dateformat(nhData.deficiencydts.startdt, 'mm/dd/yyyy')# to #dateformat(nhData.deficiencydts.enddt, 'mm/dd/yyyy')#</h4>
										<div class="clear"></div>
									</div>
									<div id="dyn"> <a class="tOptions" title="Options"><img src="images/icons/options.png" alt="" /></a>
										<table cellpadding="0" cellspacing="0" border="0" class="dTable table-bordered table-striped" id="dynamic">
											<thead>
												<tr>
													<th>Survey Date</th>
													<th>Nursing Home Failed To or Did Not Provide:</th>
													<th>Scope</th>
													<th>Severity</th>
												</tr>
											</thead>
											<tbody>
												<cfloop query="nhData.deficiency">
													<tr>
														<td class="sortCol">#dateformat(nhData.deficiency.date,'mm/dd/yyyy')#</td>
														<td>#nhData.deficiency.tag_desc#</td>
														<td class=#trim(lcase(nhData.deficiency.scope_name))#>#nhData.deficiency.scope_name#</td>
														<td class="center">#nhData.deficiency.scope_desc#</td>
													</tr>
												</cfloop>
											</tbody>
										</table>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12" id="back-top"><a href="##top" class="back-to-top">Back to Top</a></div>
					</div>
				</div>
				<cfif showsidebar eq 1>
					<cfinclude template="NHsidebar.cfm">
				</cfif>
			</div>
		</div>
	</div>
	<cfinclude template="footer.cfm">
	
	<!---Claim Modal--->
	<div id="fileClaim" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="fileClaim" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 id="myModalLabel">Have a Complaint? </h3>
		</div>
		<div class="modal-body">
			<cfset nouplink = 1>
			<cfinclude template="nhcaseevaluation.cfm">
		</div>
	</div>
	</body>
	</html>
</cfoutput>
<!---	<span class="span12">&nbsp;</span>
    <div class="span12">--->
<!---<div id="disqus_thread"></div>
<script type="text/javascript">
            /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
            var disqus_shortname = 'belllaw'; // required: replace example with your forum shortname
    
            /* * * DON'T EDIT BELOW THIS LINE * * */
            (function() {
                var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
            })();
        </script>
<noscript>
Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a>
</noscript>
<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
<!---    </div>
</div>--->--->

<!---</section>--->

