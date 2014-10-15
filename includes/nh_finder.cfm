<cfoutput>
	<div class="form-title">
		<h3 class="">Find a Nursing Home By Name</h3>
	</div>
	<cfform method="post" action="http://#CGI.SERVER_NAME#/nursing-home-search.html" name="nh_search" id="nh_search">
		<!---		<div class="row-fluid">
			<div class="span7">
				State
			</div>
			<div class="span5">
				<cfselect name="nh_state" id="nh_state" class="span12">
					<!---<cfoutput query="states">
					<option value="#state_abbr#">#state_name#</option>
					</cfoutput>--->
					<cfselect name="nh_state" id="nh_state" style="width:120px;">
						<option value="WV">West Virginia</option>
					</cfselect>
				</cfselect>
			</div>
		</div>--->
		<input type="hidden" name="nh_state" value=#application.apnhstateabbr#>
		<div id="contact-form" class="sidebar-free-consultation">
			<div class="row-fluid">
				<div class="span7"> Facility Name </div>
				<div class="span5">
					<cfinput type="text" name="nh_facname" id="nh_facname" class="span12">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span7 whitet"> Number of Certified Beds </div>
				<div class="span5">
					<cfselect name="nh_beds" id="nh_beds" class="span12">
					<option value="">Any</option>
					<option value="40">0 - 40</option>
					<option value="80">41 - 80</option>
					<option value="120">81 - 120</option>
					<option value="160">121 - 160</option>
					<option value="200">161 - 200</option>
					<option value="240">201 - 240</option>
					<option value="240+">241+</option>
					</cfselect>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span7"> Number of Complaints </div>
				<div class="span5">
					<cfselect name="nh_complaints" id="nh_complaints" class="span12">
					<option value="">Any</option>
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="10">2-10</option>
					<option value="11+">11+</option>
					</cfselect>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span7"> Located within Hospital </div>
				<div class="span5">
					<cfselect name="nh_inhosp" id="nh_inhosp" class="span12">
					<option value="">Any</option>
					<option value="0">No</option>
					<option value="1">Yes</option>
					</cfselect>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span7"> Overall Rating </div>
				<div class="span5">
					<cfselect name="nh_rating" id="nh_rating" class="span12">
					<option value="">Any</option>
					<option value="1">1 Star</option>
					<option value="2">2 Stars</option>
					<option value="3">3 Stars</option>
					<option value="4">4 Stars</option>
					<option value="5">5 Stars</option>
					</cfselect>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<cfinput type="button" name="btn_find_home" value="Find Nursing Home" class="btn btn-red btn-primary btn-large span12" onclick="submit();">
				</div>
			</div>
		</div>
	</cfform>
</cfoutput>