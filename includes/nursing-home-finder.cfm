<cfsilent>
<cfset states=application.general.getstates()>
<cfset hdrimg = "nh_" & RandRange(stnum, endnum, "SHA1PRNG") & ".jpg">
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
				<cfinclude template="breadcrumbsnh.cfm">
						<h1>#application.apnhstate# Nursing Home Directory<br>
							Reviews, Rankings and Free Legal Advice</h1>
						<!---Top Section--->
						<section class="row-fluid">
							<div class="span12"> <img src="http://#CGI.SERVER_NAME#/images/nhimages/#hdrimg#" class="img-polaroid" alt="#application.apnhstate# Nursing Homes" /> </div>
						</section>
						<section class="row-fluid">
							<div class="box_srch">
								<div class="">
									<h3>STEP 1: Locate a #application.apnhstate# Nursing Home</h3>
									<span class="whiteText">Enter the name of a nursing home below to find ratings, reviews as well as free legal advice.</span><br>
								</div>
								<cfform method="post" action="http://#CGI.SERVER_NAME#/nursing-home-search.html" name="nh_searchmini" id="nh_searchmini" class="form-search" >
									<div class="form-inline">
										<cfinput type="hidden" name="nh_state" value=#application.apnhstateabbr#>
										<cfinput type="text" name="nh_facname" id="nh_facname" placeholder="Enter a #application.apnhstate# facility name to search for..." class="span9" required="yes" message="Please enter a Facitilty Name to search for."/>
										&nbsp;
										<cfinput type="submit" name="btn_find_home" value="Find Nursing Homes" class="btn span3">
									</div>
								</cfform>
								<p><span class="whiteText">Note: You can enter the start of a facility name and it will return matching results. <br>
										<em>(eg: Searching for sister will return the Sisterhood nursing home in #application.apnhstateabbr#)</em></span></p>
							</div>
						</section>
						<section class="row-fluid">
							<cfset nh_state = application.apnhstate>
							<div class="span12">
								<p>For most families, the choice to put a loved one in a nursing home isn't easily made. When the decision has been made, however, the challenge is just beginning.</p>
								<p>Finding the right nursing home facility for your loved one can be an overwhelming task. How will you afford their care? Will your loved one get the stimulation he or she needs? Will the staff treat them with care, never subjecting them to neglect or abuse? The choice you make impacts your loved one's every day well-being.</p>
								<p>Choosing the right elder care facility is as important to our families as it is to yours. That's why we've provided a directory of #application.apnhstate#'s nursing homes for you to easily research.</p>
								<p><strong>Get all the information you need on the nursing homes you are considering, including ratings, contact information and a complete history of complaints.</strong> Choose a city to get started now!</p>
								<h3>Nursing Homes In #application.apnhstate# by City</h3>
							</div>
						</section>
						<cfinclude template="nhcitygrid.cfm">
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
	<cfinclude template="footer.cfm">
	</body>
	</html>
</cfoutput>