<cfset statename=application.misc.getfullstatename(application.apnhstateabbr)>

<div class="span4 sidebar" id="sidebar">
	<cfif nhpage eq 3>
		<!---city page to include reg search--->
		<cfinclude template="caseevaluation.cfm">
		<cfelse>
		<cfinclude template="nh_finder.cfm">
	</cfif>
	<cfsilent>
	<cfset topdeficientnhomes=application.nursinghome.topdeficient(stateabbr="#application.apnhstateabbr#")>
	<cfset topeficientnhomes=application.nursinghome.topeficient(stateabbr="#application.apnhstateabbr#")>
	</cfsilent>
	
	<!---Specific Query for this nursing home sidebar---> 
	
	<!---<cfset contentid = ""> ############ Uncomment this and below to show ##########---> 
	<br />
	<!---Top 10 efficient--->
	<h3>Top 10 Facilities with the least deficiencies</h3>
	<div class="box">
		<ul>
			<cfoutput query="topeficientnhomes">
				<cfif providername NEQ "">
					<li><a href="http://#CGI.SERVER_NAME#/#Replace(LCase(TRIM(providername)),' ','-','ALL')#-#ReReplace(LCase(statename),' ','-','all')#-#provnum#-nh-information.html">#providername# (#defcount#)</a></li>
				</cfif>
			</cfoutput>
		</ul>
	</div>
	<br />
	<!---Top 10 Deficient--->
	<h3>Top 10 Facilities with the most deficiencies</h3>
	<div class="box">
		<ul>
			<cfoutput query="topdeficientnhomes">
				<cfif providername NEQ "">
					<li><a href="http://#CGI.SERVER_NAME#/#Replace(LCase(TRIM(providername)),' ','-','ALL')#-#ReReplace(LCase(statename),' ','-','all')#-#provnum#-nh-information.html">#providername# (#defcount#)</a></li>
				</cfif>
			</cfoutput>
		</ul>
	</div>
</div>
