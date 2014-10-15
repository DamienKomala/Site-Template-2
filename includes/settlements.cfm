<!---<cfif NOT isDefined("session.sbsettlements")>
	<cfsavecontent variable="session.sbsettlements">--->
		<cfsilent>
<!---			<cfif not isDefined("settlements")>--->
				<cfset settlements=application.pageData.getSettlements()>
<!---			</cfif>--->
		</cfsilent>
		<cfoutput>
		<cfif settlements.recordcount GT 0>
			<div class="box">
				<h3>Our Results Speak for Themselves</h3>
							<div class="accordion" id="accordion2">
					<cfloop query="settlements" endrow="10">
		<!---				<cfset thisText=LEFT(settlement_text,200)>
						<cfif (LEN(settlement_text) GT 200) AND (right(thisText, 1) NEQ " ")>
							<cfloop index="x" from="201" to="#LEN(settlement_text)#">
								<cfif MID(settlement_text,x,1) NEQ " ">
									<cfset thisText=thisText & MID(settlement_text,x,1)>
									<cfelse>
									<cfbreak>
								</cfif>
							</cfloop>
						</cfif>--->
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="##accordion2" href="##collapse#currentrow#">
									#REReplaceNoCase(DollarFormat(settlement_amt), '\.\d{2}', '')# - #settlement_header#
								</a>
								</div>
							<div id="collapse#currentrow#" class="accordion-body collapse">
		<!---						<div class="accordion-inner">#thisText#...<a href="http://#CGI.SERVER_NAME#/injury-verdicts-and-settlements.html##result#settlement_id#">Read More</a></div>--->
								<div class="accordion-inner">#sidebar_settlement_text#...<a href="http://#CGI.SERVER_NAME#/injury-verdicts-and-settlements.html##result#settlement_id#">Read More</a></div>
							</div>
						</div>
					</cfloop>
				</div>
			</div>
		</cfif>
		</cfoutput>
<!---	</cfsavecontent>
</cfif>
<cfoutput>#session.sbsettlements#</cfoutput>--->