<cfsilent>
	<cfset cityData=application.nursinghome.getCityTotals(rereplace(nh_state, '-', ' ','all'))>
	<cfset colSplit=Round(cityData.recordcount/3)+1>
	<cfset colSplit2=colSplit*2-1>
</cfsilent>
<cfoutput>
	<div class="row-fluid divide" style="height:200px;overflow:hidden;" id="NHCities">
		<cfoutput>
			<cfset x=0>
			<cfloop query="cityData">
			<cfset x=x+1>
				<cfif x  EQ 1 OR x EQ colSplit OR x EQ colSplit2>
				<div class="span4">
					<ul>
				</cfif>
						<li><a href="http://#CGI.SERVER_NAME#/nursing-homes-#Replace(lcase(city),' ','_','ALL')#-#LCASE(cityData.state_abbr)#.html">#cityData.city# (#cityData.GroupCount#)</a></li>
				<cfif x  EQ colsplit-1 OR x EQ colsplit2-1 OR x EQ cityData.recordcount>
					</ul>
				</div>
				</cfif>
			</cfloop>
		</cfoutput>
	</div>
	<div style="text-align:right;"><a onclick=swapht(NHCities,this) id="moretag" class="btn btn-small">More</a></div>
	<p></p>
</cfoutput>
<script>
	function swapht(swap,mt){
		if(swap.style.overflow=="hidden"){
			swap.style.overflow="visible";
			mt.innerHTML="Less";
		} else {
			swap.style.overflow="hidden";
			mt.innerHTML="More";
		}
	}
</script>

